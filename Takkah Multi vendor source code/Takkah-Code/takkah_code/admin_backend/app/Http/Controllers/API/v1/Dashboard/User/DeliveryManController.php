<?php

namespace App\Http\Controllers\API\v1\Dashboard\User;

use App\Helpers\ResponseError;
use App\Http\Controllers\Controller;
use App\Http\Resources\UserResource;
use App\Models\Order;
use App\Services\UserServices\UserService;
use App\Traits\ApiResponse;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class DeliveryManController extends Controller
{
    use ApiResponse;

    private UserService $service;

    public function __construct(UserService $service)
    {
        $this->service = $service;
    }

    /**
     * Add Review to OrderDetai ls.
     *
     * @param int $orderId
     * @param Request $request
     * @return JsonResponse
     */
    public function addDeliveryManReview(int $orderId, Request $request): JsonResponse
    {
        $order = Order::where('status',Order::DELIVERED)->find($orderId);

        if ($order && $order->deliveryMan){

            $result = (new UserService())->createReview($order->deliveryman, $request);
            if ($result['status']) {
                return $this->successResponse(ResponseError::NO_ERROR, UserResource::make($result['data']));
            }

        }

        return $this->errorResponse(
            ResponseError::ERROR_404, trans('errors.' . ResponseError::ERROR_404, [], request()->lang),
            Response::HTTP_NOT_FOUND
        );
    }
}
