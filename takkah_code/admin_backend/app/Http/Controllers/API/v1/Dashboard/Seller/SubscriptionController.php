<?php

namespace App\Http\Controllers\API\v1\Dashboard\Seller;

use App\Helpers\ResponseError;
use App\Http\Controllers\Controller;
use App\Http\Resources\SubscriptionResource;
use App\Models\ShopSubscription;
use App\Models\Subscription;
use App\Models\Transaction;
use App\Services\SubscriptionService\SubscriptionService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class SubscriptionController extends SellerBaseController
{

    public function __construct(protected Subscription $model,protected SubscriptionService $subscriptionService)
    {
        parent::__construct();
    }

    /**
     * Display a listing of the resource.
     *
     * @return JsonResponse
     */
    public function index()
    {
        $subscriptions = $this->model->subscriptionsList()->where('active', 1);
        return $this->successResponse(trans('web.subscription_list', [], \request()->lang ?? config('app.locale')), SubscriptionResource::collection($subscriptions));
    }

    public function subscriptionAttach(int $id)
    {
        $subscription = Subscription::find($id);
        if (!$subscription) {
            return $this->errorResponse(
                ResponseError::ERROR_404, __('errors.' . ResponseError::ERROR_404, [], \request()->lang ?? config('app.locale')),
                Response::HTTP_NOT_FOUND
            );
        }
        return $this->successResponse(
            __('web.subscription_attached'),
            $this->subscriptionService->subscriptionAttach($subscription, $this->shop->id)
        );
    }

}
