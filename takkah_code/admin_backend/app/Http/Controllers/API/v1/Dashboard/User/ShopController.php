<?php

namespace App\Http\Controllers\API\v1\Dashboard\User;

use App\Helpers\ResponseError;
use App\Http\Controllers\Controller;
use App\Http\Requests\User\Shop\StoreRequest;
use App\Http\Resources\ShopResource;
use App\Models\Shop;
use App\Repositories\Interfaces\ShopRepoInterface;
use App\Services\Interfaces\ShopServiceInterface;
use Illuminate\Http\JsonResponse;
use Symfony\Component\HttpFoundation\Response;

class ShopController extends UserBaseController
{
    public function __construct(protected ShopRepoInterface $shopRepository,protected ShopServiceInterface $shopService)
    {
        parent::__construct();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param StoreRequest $request
     * @return JsonResponse|
     */
    public function store(StoreRequest $request): JsonResponse
    {
        $collection = $request->validated();
        $shop = Shop::where('user_id',auth('sanctum')->user()->id)->first();
        if (!$shop){
            $result = $this->shopService->create($collection);
            if ($result['status']) {
                auth('sanctum')->user()->invitations()->delete();
                return $this->successResponse(__('web.record_successfully_created'), ShopResource::make($result['data']));
            }
            return $this->errorResponse(
                $result['code'], $result['message'] ?? trans('errors.' . $result['code'], [], \request()->lang),
                Response::HTTP_BAD_REQUEST
            );
        } else {
            return $this->errorResponse(
                ResponseError::ERROR_205, __('errors.' . ResponseError::ERROR_205, [], \request()->lang),
                Response::HTTP_BAD_REQUEST
            );
        }
    }
}
