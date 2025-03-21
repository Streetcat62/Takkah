<?php

namespace App\Http\Controllers\API\v1\Dashboard\User;

use App\Http\Controllers\Controller;
use App\Http\Requests\Cart\InsertProductsRequest;
use App\Http\Requests\Cart\OpenCartOwnerRequest;
use App\Http\Requests\Cart\StoreRequest;
use App\Http\Requests\Cart\UpdateRequest;
use App\Http\Resources\CartResource;
use App\Http\Resources\UserCartResource;
use App\Repositories\CartRepository\CartRepository;
use App\Services\CartService\CartService;
use App\Services\OrderService\OrderService;
use App\Traits\ApiResponse;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\AnonymousResourceCollection;
use Symfony\Component\HttpFoundation\Response;

class CartController extends Controller
{
    use ApiResponse;


    public function __construct(
        protected CartRepository $cartRepository,
        protected CartService $cartService,
        protected OrderService $orderService
    )
    {

    }

    public function get(Request $request)
    {
        $cart = $this->cartRepository->get($request->shop_id);
        if ($cart) {
            return $this->successResponse(__('web.record_was_found'), CartResource::make($cart));
        }
        return $this->successResponse(__('web.record_was_found'));
    }

    public function store(StoreRequest $request)
    {

        $collection = $request->validated();
        $result = $this->cartService->create($collection);

        if ($result['status']) {
            return $this->successResponse(__('web.record_was_successfully_create'), CartResource::make($result['data']));
        }

        return $this->errorResponse(
            $result['code'], $result['message'] ?? trans('errors.' . $result['code'], ['quantity' => $result['data']['quantity'] ?? null], \request()->lang),
            Response::HTTP_BAD_REQUEST
        );
    }

    public function openCart(OpenCartOwnerRequest $request)
    {
        $collection = $request->validated();
        $user = auth('sanctum')->user();
        $collection['owner_id'] = $user->id;
        $collection['user_id'] = $user->id;
        $collection['name'] = $user->firstname ?? $user->email;
        $collection['together'] = true;
        $result = $this->cartService->openCartOwner($collection);
        if ($result['status']) {
            return $this->successResponse(__('web.record_was_successfully_create'), CartResource::make($result['data']));
        }
        return $this->errorResponse(
            $result['code'], $result['message'] ?? trans('errors.' . $result['code'], ['quantity' => $result['data'] ?? null], \request()->lang),
            Response::HTTP_BAD_REQUEST
        );
    }

    public function delete(int $id)
    {
        $result = $this->cartService->destroy($id);
        if ($result['status']) {
            return $this->successResponse(__('web.record_was_successfully_delete'));
        } else {
            return $this->errorResponse(
                $result['code'], $result['message'] ?? trans('errors.' . $result['code'], [], \request()->lang),
                Response::HTTP_BAD_REQUEST
            );
        }
    }

    public function cartProductDelete(int $cart_detail_id)
    {
        $result = $this->cartService->cartProductDelete($cart_detail_id);
        if ($result['status']) {
            return $this->successResponse(__('web.record_was_successfully_delete'));
        } else {
            return $this->errorResponse(
                $result['code'], $result['message'] ?? trans('errors.' . $result['code'], [], \request()->lang),
                Response::HTTP_BAD_REQUEST
            );
        }
    }

    public function userCartDelete(string $user_cart_uuid, Request $request): JsonResponse|AnonymousResourceCollection
    {
        $result = $this->cartService->userCartDelete($user_cart_uuid, $request->cart_id);
        if ($result['status']) {
            return $this->successResponse(__('web.record_was_successfully_delete'));
        } else {
            return $this->errorResponse(
                $result['code'], $result['message'] ?? trans('errors.' . $result['code'], [], \request()->lang),
                Response::HTTP_BAD_REQUEST
            );
        }
    }

    public function insertProducts(InsertProductsRequest $request): JsonResponse|AnonymousResourceCollection
    {
        $collection = $request->validated();
        $result = $this->cartService->insertProducts($collection);
        if ($result['status']) {
            return $this->successResponse(__('web.record_was_successfully_create'));
        } else {
            return $this->errorResponse(
                $result['code'], $result['message'] ?? trans('errors.' . $result['code'], [], \request()->lang),
                Response::HTTP_BAD_REQUEST
            );
        }
    }

    public function statusChange(string $user_cart_uuid,Request $request): JsonResponse|AnonymousResourceCollection
    {
        $result = $this->cartService->statusChange($user_cart_uuid, $request->cart_id);
        if ($result['status']) {
            return $this->successResponse(__('web.record_was_successfully_create'),UserCartResource::make($result['data']));
        } else {
            return $this->errorResponse(
                $result['code'], $result['message'] ?? trans('errors.' . $result['code'], [], \request()->lang),
                Response::HTTP_BAD_REQUEST
            );
        }
    }

    public function cartCalculate(int $id): JsonResponse|AnonymousResourceCollection
    {
        $result = $this->orderService->orderProductsCalculate($id);
        return $this->successResponse(__('web.products_calculated'), $result);
    }


}
