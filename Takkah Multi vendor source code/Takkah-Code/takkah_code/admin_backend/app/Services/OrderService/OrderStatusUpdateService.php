<?php

namespace App\Services\OrderService;

use App\Helpers\ResponseError;
use App\Jobs\PayReferral;
use App\Models\Language;
use App\Models\Notification;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\ShopProduct;
use App\Models\Transaction;
use App\Models\Translation;
use App\Models\WalletHistory;
use App\Services\CoreService;
use App\Services\WalletHistoryService\WalletHistoryService;
use DB;
use Throwable;

class OrderStatusUpdateService extends CoreService
{

    use \App\Traits\Notification;

    /**
     * @return string
     */
    protected function getModelClass(): string
    {
        return Order::class;
    }


    /**
     * @param Order $order
     * @param string|null $status
     * @param bool $isDelivery
     * @return array
     */
    public function statusUpdate(Order $order, ?string $status, bool $isDelivery = false): array
    {
        if ($order->status == $status) {
            return ['status' => false, 'code' => ResponseError::ERROR_252];
        }

        try {
            $order = DB::transaction(function () use ($order,$status){

                if ($status == Order::DELIVERED) {

                    $this->sellerWalletTopUp($order);

//                    if (!empty($order->deliveryman)) {
//                        $this->deliverymanWalletTopUp($order);
//                    }

                    PayReferral::dispatchAfterResponse($order->user, 'increment');
                }

                if ($status == Order::CANCELED && $order->refund()?->count() === 0){
                    $user = $order->user;

                    if ($user->wallet &&
                        $order->transactions->where('status', Transaction::PAID)->first()?->id
                    ) {

                        (new WalletHistoryService)->create($user,[
                            'type'      => 'topup',
                            'price'     => $order->price,
                            'note'      => 'For Order #' . $order->id,
                            'status'    => WalletHistory::PAID,
                            'user'      => $user
                        ]);

                    }

                    if ($order->status === Order::DELIVERED) {
                        PayReferral::dispatchAfterResponse($order->user, 'decrement');
                    }

                    $order->orderDetails->map(function (OrderDetail $orderDetail) {
                        $orderDetail->shopProduct()->increment('quantity', $orderDetail->quantity);
                    });
                }

                $order->update([
                    'status'  => $status,
//                    'current' => in_array($status, [Order::DELIVERED, Order::CANCELED]) ? 0 : $order->current,
                ]);

                return $order;
            });

        }catch (Throwable $throwable)
        {
            $this->error($throwable);
            return ['status' => false, 'code' => ResponseError::ERROR_501];
        }

        /** @var Order $order */

        $order->loadMissing(['shop.seller', 'deliveryMan', 'user']);

        /** @var Notification $notification */
        $notification = $order->user?->notifications
            ?->where('type', Notification::ORDER_STATUSES)
            ?->first();


        if (in_array($order->status, ($notification?->payload ?? []))) {

            $userToken = $order->user?->firebase_token;
        }

        if (!$isDelivery) {
            $deliveryManToken = $order->deliveryMan?->firebase_token;
        }

        if (in_array($status, [Order::ON_A_WAY, Order::DELIVERED, Order::CANCELED])) {
            $sellerToken = $order->shop?->seller?->firebase_token;
        }

        $firebaseTokens = array_merge(
            !empty($userToken) && is_array($userToken) ? $userToken : [],
            !empty($deliveryManToken) && is_array($deliveryManToken) ? $deliveryManToken : [],
            !empty($sellerToken) && is_array($sellerToken) ? $sellerToken : [],
        );

        $default = data_get(Language::where('default', 1)->first(['locale', 'default']), 'locale');

        $tStatus = Translation::where('locale', $this->language)
            ->orWhere('locale', $default)
            ->first()?->value;

        $this->sendNotification(
            array_values(array_unique($firebaseTokens)),
            sprintf('Your order status has been changed to %s',!empty($tStatus) ? $tStatus : $status),
            $order->id,
            $order->load([
                'user:id,uuid,firstname,lastname,email,phone,img,created_at',
                'shop:tax,user_id,id,logo_img,location,created_at,uuid',
                'shop.translation' => fn($q) => $q->select('id', 'shop_id', 'locale', 'title')->where('locale', $this->language),
                'transaction:id,user_id,payable_type,price,payable_id,note,perform_time,refund_time',
            ])->setAttribute('type', 'status_changed'),
        );

        return ['status' => true, 'code' => ResponseError::NO_ERROR, 'data' => $order];

    }

    // Seller Order price topup function
    private function sellerWalletTopUp(Order $order): void
    {
        $seller = $order->shop->seller;
        if ($seller->wallet)
        {

        $request = request()->merge([
            'type' => 'topup',
            'price' => $order->price - $order->commission_fee,
            'note' => 'For Order #' . $order->id,
            'status' => 'paid',
        ]);
            (new WalletHistoryService())->create($seller, $request);
        }
    }

    // Deliveryman  Order price topup function
    private function deliverymanWalletTopUp(Order $order): void
    {
        $deliveryman = $order->deliveryMan;
        if ($deliveryman->wallet)
        {
            $request = request()->merge([
                'type' => 'topup',
                'price' => $order->delivery_fee,
                'note' => 'For Order #' . $order->id,
                'status' => 'paid',
            ]);
            (new WalletHistoryService())->create($deliveryman, $request);
        }

    }

    public function incrementQuantity($details)
    {
        $details->map(function ($model){
            ShopProduct::find($model->shop_product_id)->increment('quantity',$model->quantity);
        });
    }
}
