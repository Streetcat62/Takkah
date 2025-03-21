<?php

namespace App\Http\Controllers\API\v1\Rest;

use App\Models\ShopCategory;
use Illuminate\Http\Request;
use App\Helpers\ResponseError;
use Illuminate\Http\JsonResponse;
use App\Http\Resources\CategoryResource;
use App\Http\Resources\CategoryCustomResource;
use Symfony\Component\HttpFoundation\Response;
use App\Repositories\Interfaces\CategoryRepoInterface;
use Illuminate\Http\Resources\Json\AnonymousResourceCollection;

class CategoryController extends RestBaseController
{

    public function __construct(protected CategoryRepoInterface $categoryRepo)
    {
    }

    /**
     * Display a listing of the resource.
     *
     * @param Request $request
     * @return AnonymousResourceCollection
     */

    public function paginate(Request $request): AnonymousResourceCollection
    {
        $categories = $this->categoryRepo->parentCategories($request->perPage ?? 15, true,  $request->all());
        return CategoryResource::collection($categories);
    }

    /**
     * Display a listing of the resource.
     *
     * @param Request $request
     * @return AnonymousResourceCollection
     */

    public function selectPaginate(Request $request): AnonymousResourceCollection
    {

        $categories = $this->categoryRepo->selectPaginate($request->perPage ?? 15, true,  $request->all());

        return CategoryResource::collection($categories);
    }

    public function shopCategoryProduct(Request $request): AnonymousResourceCollection
    {
        $categoryIds = ShopCategory::where('shop_id', $request->input('shop_id', 0))->pluck('category_id');
        $categories = $this->categoryRepo->shopCategoryProduct($categoryIds, $request->all(),$request->perPage ?? 15);
        return CategoryCustomResource::collection($categories);
    }


    /**
     * Display the specified resource.
     *
     * @param string $uuid
     * @return JsonResponse
     */
    public function show(string $uuid): JsonResponse
    {
        $category = $this->categoryRepo->categoryByUuid($uuid);
        if ($category){
            return $this->successResponse(__('errors.'. ResponseError::NO_ERROR), CategoryResource::make($category));
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
     * @return JsonResponse
     */
    public function categoriesSearch(Request $request): JsonResponse
    {
        $categories = $this->categoryRepo->categoriesSearch($request->search ?? '', true);
        return $this->successResponse(__('errors.'. ResponseError::NO_ERROR), CategoryResource::collection($categories));
    }

    public function parentCategory(Request $request): JsonResponse|AnonymousResourceCollection
    {
        $categories = $this->categoryRepo->parentCategories($request->perPage,true,$request->all());
        return $this->successResponse(__('errors.'. ResponseError::NO_ERROR), CategoryResource::collection($categories));
    }

    public function childrenCategory(Request $request,int $id): JsonResponse|AnonymousResourceCollection
    {
        $childrenCategories = $this->categoryRepo->childrenCategory($request->perPage ?? 15,$id);
        if ($childrenCategories){
            return $this->successResponse(__('errors.'. ResponseError::NO_ERROR), CategoryResource::collection($childrenCategories));
        }
        return $this->errorResponse(
            ResponseError::ERROR_404, trans('errors.' . ResponseError::ERROR_404, [], request()->lang),
            Response::HTTP_NOT_FOUND
        );
    }
}
