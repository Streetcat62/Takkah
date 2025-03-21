<?php

namespace App\Helpers;

use App\Models\Order;
use App\Models\Settings;

class NotificationHelper
{
    public function deliveryManOrder(Order $order, ?string $language = null, string $type = 'deliveryman'): array
    {
        $km = (new Utility)->getDistance(
            optional($order->shop)->location,
            $order?->deliveryAddress?->location,
        );

        $second = Settings::adminSettings()->where('key', 'deliveryman_order_acceptance_time')->first();

        $order = Order::with('deliveryAddress')->find($order->id);

        return [
            'second'        => data_get($second, 'value', 30),
            'order'         => $order->setAttribute('km', $km)->setAttribute('type', $type),
        ];
    }
}
