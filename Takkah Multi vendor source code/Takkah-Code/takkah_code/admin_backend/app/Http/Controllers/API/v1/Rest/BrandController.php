<?php

namespace App\Http\Controllers\API\v1\Rest;

use App\Helpers\ResponseError;
use App\Http\Resources\BrandResource;
use App\Http\Resources\ShopBrandResource;
use App\Models\Shop;
use App\Models\User;
use App\Repositories\BrandRepository\BrandRepository;
use App\Repositories\ShopBrandRepository\ShopBrandRepository;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\AnonymousResourceCollection;
use Symfony\Component\HttpFoundation\Response;

class BrandController extends RestBaseController
{

    public function __construct(protected ShopBrandRepository $shopBrandRepository)
    {}

    public function paginate(Request $request): AnonymousResourceCollection
    {
        if (auth('sanctum')->user()){
            if (auth('sanctum')->user()->role == 'seller'){
                $shop = Shop::where('user_id',auth('sanctum')->user()->id)->first();
                if ($shop){
                    $request->merge(['shop_id' => $shop->id]);
                }
            }
        }
        $brands = $this->shopBrandRepository->paginate($request->perPage ?? 15,$request->merge(['rest' => true])->all());
        return ShopBrandResource::collection($brands);
    }

    /**
     * Display the specified resource.
     *
     * @param int $id
     * @return JsonResponse
     */
    public function show(int $id): JsonResponse
    {
        $brand = $this->shopBrandRepository->show($id);
        if ($brand){
            return $this->successResponse(__('errors.'. ResponseError::NO_ERROR), ShopBrandResource::make($brand));
        }
        return $this->errorResponse(
            ResponseError::ERROR_404, trans('errors.' . ResponseError::ERROR_404, [], request()->lang),
            Response::HTTP_NOT_FOUND
        );
    }
}
