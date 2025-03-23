<?php

namespace App\Http\Controllers\API\v1\Dashboard\Seller;

use App\Exports\ProductsExport;
use App\Helpers\ResponseError;
use App\Http\Requests\Admin\Product\OrderChartRequest;
use App\Http\Requests\Admin\Product\StoreRequest;
use App\Http\Requests\Admin\Product\UpdateRequest;
use App\Http\Resources\ProductResource;
use App\Http\Resources\ShopProductSearchResource;
use App\Models\Product;
use App\Models\ShopProduct;
use App\Repositories\Interfaces\ProductRepoInterface;
use App\Services\ProductService\ProductAdditionalService;
use App\Services\ProductService\ProductService;
use App\Services\SellerProductService\SellerProductService;
use Carbon\Carbon;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\AnonymousResourceCollection;
use Illuminate\Support\Str;
use Maatwebsite\Excel\Facades\Excel;
use Symfony\Component\HttpFoundation\Response;

class ProductController extends SellerBaseController
{

    public function __construct(
        protected ProductService $productService,
        protected ProductRepoInterface $productRepository,
        protected SellerProductService $sellerProductService
    )
    {
        parent::__construct();
    }

    /**
     * Display a listing of the resource.
     *
     * @return JsonResponse|AnonymousResourceCollection
     */
    public function paginate(Request $request)
    {

        $products = $this->productRepository->productsPaginate($request->perPage ?? 15, $request->active ?? null, $request->all() + ['shop_id' => $this->shop->id]);

        return ProductResource::collection($products);

    }

    /**
     * Store a newly created resource in storage.
     * @param StoreRequest $request
     * @return JsonResponse
     */
    public function store(StoreRequest $request): JsonResponse
    {
        $collection = $request->validated();

        $result = $this->sellerProductService->create($collection, $this->shop->id);

        if ($result['status']) {
            return $this->successResponse(__('web.record_was_successfully_create'), ProductResource::make($result['data']));
        }

        return $this->errorResponse(
            $result['code'], $result['message'] ?? trans('errors.' . $result['code'], [], \request()->lang),
            Response::HTTP_BAD_REQUEST
        );
    }

    /**
     * Display the specified resource.
     *
     * @param string $uuid
     * @return JsonResponse
     */
    public function show(string $uuid): JsonResponse
    {
        $product = $this->productRepository->productByUUID($uuid);

        if ($product) {
            return $this->successResponse(__('web.product_found'), ProductResource::make($product->load('translations')));
        }

        return $this->errorResponse(
            ResponseError::ERROR_404, trans('errors.' . ResponseError::ERROR_404, [], request()->lang),
            Response::HTTP_NOT_FOUND
        );
    }

    /**
     * Update the specified resource in storage.
     *
     * @param UpdateRequest $request
     * @param int $id
     * @return JsonResponse
     */
    public function update(UpdateRequest $request, int $id): JsonResponse
    {
        $collection = $request->validated();

        $product = Product::find($id);

        if (!$product) {
            return $this->errorResponse(
                ResponseError::ERROR_404, __('errors.' . ResponseError::ERROR_404, [], \request()->lang),
                Response::HTTP_NOT_FOUND
            );
        }

        $collection['shop_id'] = $this->shop->id;
        $result = $this->sellerProductService->update($product, $collection);

        if ($result['status']) {
            return $this->successResponse(
                __('web.record_was_successfully_update'),
                ProductResource::make($result['data'])
            );
        }

        return $this->errorResponse(
            $result['code'], $result['message'] ?? trans('errors.' . $result['code'], [], \request()->lang),
            Response::HTTP_BAD_REQUEST
        );
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param string $uuid
     * @return JsonResponse
     */
    public function destroy(string $uuid)
    {
        $product = Product::firstWhere('uuid', $uuid);
        if ($product) {
            $result = $this->productService->delete($product->uuid);

            if ($result['status']) {
                return $this->successResponse(__('web.record_has_been_successfully_delete'));
            }
            return $this->errorResponse(
                $result['code'], $result['message'] ?? trans('errors.' . $result['code'], [], \request()->lang),
                Response::HTTP_BAD_REQUEST
            );
        } else {
            return $this->errorResponse(
                ResponseError::ERROR_404, __('errors.' . ResponseError::ERROR_404, [], \request()->lang),
                Response::HTTP_NOT_FOUND
            );
        }
    }

    /**
     * Add Product Properties.
     *
     * @param string $uuid
     * @param Request $request
     * @return JsonResponse
     */
    public function addProductProperties(string $uuid, Request $request)
    {
        $product = Product::firstWhere('uuid', $uuid);
        if ($product) {
            $result = (new ProductAdditionalService())->createOrUpdateProperties($product->uuid, $request->all());

            if ($result['status']) {
                return $this->successResponse(__('web.record_has_been_successfully_created'), ProductResource::make($result['data']));
            }
            return $this->errorResponse(
                $result['code'], $result['message'] ?? trans('errors.' . $result['code'], [], \request()->lang),
                Response::HTTP_BAD_REQUEST
            );
        } else {
            return $this->errorResponse(
                ResponseError::ERROR_404, __('errors.' . ResponseError::ERROR_404, [], \request()->lang),
                Response::HTTP_NOT_FOUND
            );
        }
    }

    /**
     * Search Model by tag name.
     *
     * @param Request $request
     * @return JsonResponse|AnonymousResourceCollection
     */
    public function productsSearch(Request $request)
    {

        $shopProducts = $this->productRepository->shopProductsSearch($request->input('perPage', 15), true, $request->merge(['shop' => $this->shop])->all());
        return ShopProductSearchResource::collection($shopProducts);
    }

    /**
     * Change Active Status of Model.
     *
     * @param string $uuid
     * @return JsonResponse|AnonymousResourceCollection
     */
    public function setActive(string $uuid)
    {
        $shopProduct = ShopProduct::firstWhere('uuid', $uuid);

        if (!empty($shopProduct) && $shopProduct->shop_id == $this->shop->id) {

            $shopProduct->update(['active' => !$shopProduct->active]);

            return $this->successResponse(
                __('web.record_has_been_successfully_updated'),
                ProductResource::make($shopProduct)
            );
        }

        return $this->errorResponse(
            ResponseError::ERROR_404, __('errors.' . ResponseError::ERROR_404, [], \request()->lang),
            Response::HTTP_NOT_FOUND
        );
    }

    public function fileExport()
    {
        $shop_id = $this->shop->id;
        $time = Str::slug(Carbon::now()->format('Y-m-d h:i:s'));
        $fileName = 'export/' . $time . '-products.xlsx';

        $file = Excel::store(new ProductsExport($shop_id), $fileName, 'public');
        if ($file) {
            return $this->successResponse('Successfully exported', [
                'path' => 'public/export',
                'file_name' => 'public/' . $fileName
            ]);
        }
        return $this->errorResponse('Error during export');
    }


    public function reportChart(OrderChartRequest $request): JsonResponse
    {
        $collection = $request->validated();
        $collection['shop_id'] = $this->shop->id;
        try {

            $result = $this->productRepository->reportChart($collection);
            return $this->successResponse('Successfully', $result);
        } catch (\Exception $exception) {
            return $this->errorResponse(ResponseError::ERROR_400, $exception->getMessage());
        }
    }


    public function reportPaginate(OrderChartRequest $request): JsonResponse
    {
        $collection = $request->validated();

        $collection['shop_id'] = $this->shop->id;
        try {
            $result = $this->productRepository->productReportPaginate($collection);

            return $this->successResponse(
                'Successfully',
                data_get($result, 'data')
            );
        } catch (\Exception $exception) {
            return $this->errorResponse(ResponseError::ERROR_400, $exception->getMessage());
        }
    }
}
