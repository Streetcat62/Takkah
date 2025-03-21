<?php

namespace App\Services\OrderService;

use App\Helpers\ResponseError;
use App\Models\OrderStatus;
use App\Services\CoreService;
use Exception;

class OrderStatusService extends CoreService
{
    protected function getModelClass(): string
    {
        return OrderStatus::class;
    }

    public function setActive(int $id, array $data): array
    {
        $orderStatus = $this->model()->find($id);

        if (empty($orderStatus)) {
            return ['status' => false, 'code' => ResponseError::ERROR_404];
        }

        $orderStatus->update([
            'active' => !$orderStatus->active,
            'sort'   => data_get($data, 'sort', $orderStatus->sort) ?? OrderStatus::count('id')
        ]);

        try {
            cache()->forget('order-status-list');
        } catch (Exception $e) {}

        return ['status' => true, 'code' => ResponseError::NO_ERROR, 'data' => $orderStatus];
    }
}
