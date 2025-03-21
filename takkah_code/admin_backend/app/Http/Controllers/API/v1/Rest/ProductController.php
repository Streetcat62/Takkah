<?php

namespace App\Http\Controllers\API\v1\Rest;

use App\Helpers\ResponseError;
use App\Http\Requests\FilterParamsRequest;
use App\Http\Resources\ProductResource;
use App\Http\Resources\ShopProductResource;
use App\Http\Resources\ShopProductSearchResource;
use App\Models\Point;
use App\Repositories\CategoryRepository\CategoryRepository;
use App\Repositories\Interfaces\ProductRepoInterface;
use App\Repositories\ProductRepository\RestProductRepository;
use App\Repositories\ShopRepository\ShopRepository;
use App\Services\OrderService\OrderService;
use App\Services\ProductService\ProductReviewService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\AnonymousResourceCollection;
use Symfony\Component\HttpFoundation\Response;

class ProductController extends RestBaseController
{
    public function __construct(protected RestProductRepository $restProductRepository,protected ProductRepoInterface $productRepository)
    {
        $this->middleware('sanctum.check')->only('addProductReview');
    }

    /**
     * Display a listing of the resource.
     *
     * @param FilterParamsRequest $request
     * @return AnonymousResourceCollection
     */
    public function paginate(FilterParamsRequest $request): AnonymousResourceCollection
    {
        $products = $this->restProductRepository->productsPaginate(
            $request->input('perPage', 15),
            true,
            $request->merge(['rest' => true])->all()
        );

        return ShopProductResource::collection($products);
    }

    /**
     * Display the specified resource.
     *
     * @param string $uuid
     * @return JsonResponse
     */
    public function show(string $uuid): JsonResponse
    {
        $product = $this->restProductRepository->productByUUID($uuid);

        if ($product) {
            return $this->successResponse(__('errors.'.ResponseError::NO_ERROR), ShopProductResource::make($product));
        }

        return $this->errorResponse(
            ResponseError::ERROR_404, trans('errors.' . ResponseError::ERROR_404, [], request()->lang),
            Response::HTTP_NOT_FOUND
        );
    }

    public function productsByShopUuid(FilterParamsRequest $request, string $uuid): JsonResponse|AnonymousResourceCollection
    {
        $shop = (new ShopRepository())->shopDetails($uuid);
        if ($shop) {
            $products = $this->productRepository->productsPaginate($request->perPage ?? 15, true, ['shop_id' => $shop->id, 'rest' => true]);
            return ProductResource::collection($products);
        }
        return $this->errorResponse(
            ResponseError::ERROR_404, trans('errors.' . ResponseError::ERROR_404, [], request()->lang),
            Response::HTTP_NOT_FOUND
        );
    }

    public function productsByBrand(FilterParamsRequest $request, int $id): AnonymousResourceCollection
    {
        $products = $this->productRepository->productsPaginate($request->perPage ?? 15, true, ['brand_id' => $id, 'rest' => true]);
        return ProductResource::collection($products);
    }

    public function productsByCategoryUuid(FilterParamsRequest $request, string $uuid): JsonResponse|AnonymousResourceCollection
    {
        $category = (new CategoryRepository())->categoryByUuid($uuid);
        if ($category) {
            $products = $this->productRepository->productsPaginate($request->perPage ?? 15, true, ['category_id' => $category->id, 'rest' => true]);
            return ProductResource::collection($products);
        }
        return $this->errorResponse(
            ResponseError::ERROR_404, trans('errors.' . ResponseError::ERROR_404, [], request()->lang),
            Response::HTTP_NOT_FOUND
        );

    }

    /**
     * Search Model by tag name.
     *
     * @param Request $request
     * @return AnonymousResourceCollection
     */
    public function productsSearch(Request $request): AnonymousResourceCollection
    {
        $products = $this->restProductRepository->productsPaginateSearch($request->input('perPage', 15), true, $request->all());
        return ShopProductSearchResource::collection($products);
    }

    public function mostSoldProducts(FilterParamsRequest $request): JsonResponse|AnonymousResourceCollection
    {
        $products = $this->restProductRepository->productsMostSold($request->perPage,$request->all());
        if ($products->count() > 0)
            return ShopProductResource::collection($products);
        else
            return $this->errorResponse(
                ResponseError::ERROR_404, trans('errors.' . ResponseError::ERROR_404, [], request()->lang),
                Response::HTTP_NOT_FOUND
            );
    }

    /**
     * Search Model by tag name.
     *
     * @param string $uuid
     * @param Request $request
     * @return JsonResponse
     */
    public function addProductReview(string $uuid, Request $request): JsonResponse
    {
        $result = (new ProductReviewService)->addReview($uuid, $request);

        if (data_get($result, 'status')) {
            return $this->successResponse(ResponseError::NO_ERROR, []);
        }

        return $this->errorResponse(
            data_get($result, 'code', ResponseError::ERROR_404),
            trans('errors.' . data_get($result, 'code', ResponseError::ERROR_404), [], request()->lang),
            Response::HTTP_NOT_FOUND
        );
    }

    public function discountProducts(Request $request): JsonResponse|AnonymousResourceCollection
    {
        $products = $this->restProductRepository->productsDiscount($request->perPage ?? 15, $request->all());
        if ($products->count() > 0)
            return ShopProductResource::collection($products);
        else
            return $this->errorResponse(
                ResponseError::ERROR_404, trans('errors.' . ResponseError::ERROR_404, [], request()->lang),
                Response::HTTP_NOT_FOUND
            );

    }

    public function productsCalculate(Request $request): JsonResponse
    {
        $result = (new OrderService())->orderProductsCalculate($request->all());
        return $this->successResponse(__('web.products_calculated'), $result);
    }

    /**
     * Get Products by IDs.
     *
     * @param Request $request
     * @return AnonymousResourceCollection
     */
    public function productsByIDs(Request $request): AnonymousResourceCollection
    {
        $products = $this->restProductRepository->productsByIDs($request->products);
        return ShopProductResource::collection($products);
    }

    public function checkCashback(Request $request): JsonResponse
    {
        $point = Point::getActualPoint($request->amount ?? 0);
        return $this->successResponse(__('web.cashback'), ['price' => $point]);
    }

    public function buyWithProduct(int $id): AnonymousResourceCollection
    {
        $products = $this->restProductRepository->buyWithProduct($id);
        return ShopProductResource::collection($products);
    }
}
