<?php

namespace App\Http\Controllers\API\v1\Dashboard\Seller;

use App\Helpers\ResponseError;
use App\Http\Requests\FilterParamsRequest;
use App\Http\Requests\Seller\ShopWorkingDay\StoreRequest;
use App\Http\Requests\Seller\ShopWorkingDay\UpdateRequest;
use App\Http\Requests\ShopWorkingDay\SellerRequest;
use App\Http\Resources\ShopResource;
use App\Http\Resources\ShopWorkingDayResource;
use App\Repositories\ShopWorkingDayRepository\ShopWorkingDayRepository;
use App\Services\ShopWorkingDayService\ShopWorkingDayService;
use Illuminate\Http\JsonResponse;

class ShopWorkingDayController extends SellerBaseController
{

    public function __construct(protected ShopWorkingDayRepository $repository,protected ShopWorkingDayService $service)
    {
        parent::__construct();
    }

    /**
     * Display a listing of the resource.
     *
     * @return JsonResponse
     */
    public function index(): JsonResponse
    {
        return $this->show($this->shop->uuid);
    }

    /**
     * NOT USED
     * Display the specified resource.
     *
     * @param StoreRequest $request
     * @return JsonResponse
     */
    public function store(StoreRequest $request): JsonResponse
    {
        $validated = $request->validated();
        $validated['shop_id'] = $this->shop->id;
        $result = $this->service->create($validated);

        if (!data_get($result, 'status')) {
            return $this->onErrorResponse($result);
        }

        return $this->successResponse(ResponseError::NO_ERROR, []);
    }

    /**
     * Display the specified resource.
     *
     * @param string $uuid
     * @return JsonResponse
     */
    public function show(string $uuid): JsonResponse
    {
        $shopWorkingDays = $this->repository->show($this->shop->id);

        return $this->successResponse(ResponseError::NO_ERROR, [
            'dates' => ShopWorkingDayResource::collection($shopWorkingDays),
            'shop'  => ShopResource::make($this->shop),
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param string $uuid
     * @param UpdateRequest $request
     * @return JsonResponse
     */
    public function update(string $uuid, UpdateRequest $request): JsonResponse
    {
        $result = $this->service->update($this->shop->id, $request->validated());

        if (!data_get($result, 'status')) {
            return $this->onErrorResponse($result);
        }

        return $this->successResponse(__('web.record_was_successfully_create'), []);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param FilterParamsRequest $request
     * @return JsonResponse
     */
    public function destroy(FilterParamsRequest $request): JsonResponse
    {
        $this->service->destroy($request->input('ids', []), $this->shop->id);

        return $this->successResponse(__('web.record_has_been_successfully_delete'), []);
    }
}
