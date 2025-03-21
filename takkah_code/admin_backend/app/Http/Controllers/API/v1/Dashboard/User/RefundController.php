<?php

namespace App\Http\Controllers\API\v1\Dashboard\User;

use App\Helpers\ResponseError;
use App\Http\Controllers\Controller;
use App\Http\Requests\Refund\IndexRequest;
use App\Http\Requests\Refund\StoreRequest;
use App\Http\Requests\Refund\UpdateRequest;
use App\Http\Resources\RefundResource;
use App\Models\Refund;
use App\Repositories\RefundRepository\RefundRepository;
use App\Services\RefundService\RefundService;
use App\Traits\ApiResponse;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\AnonymousResourceCollection;
use Symfony\Component\HttpFoundation\Response;

class RefundController extends Controller
{
    use ApiResponse;


    public function __construct(protected RefundRepository $repository,protected RefundService $service)
    {
    }

    /**
     * Display a listing of the resource with paginate.
     *
     * @param IndexRequest $request
     * @return AnonymousResourceCollection
     */

    public function index(IndexRequest $request): AnonymousResourceCollection
    {
        $collection = $request->validated();
        $user = auth('sanctum')->user();
        $refunds = $this->repository->paginate($collection,$shop = null, $user);
        return RefundResource::collection($refunds);
    }

    /**
     * @param int $id
     * @return JsonResponse|AnonymousResourceCollection
     */
    public function show(int $id)
    {
        $refund = $this->repository->show($id);

        if ($refund) {
            return $this->successResponse(__('errors.' . ResponseError::NO_ERROR), RefundResource::make($refund));
        }

        return $this->errorResponse(
            ResponseError::ERROR_404, trans('errors.' . ResponseError::ERROR_404, [], request()->lang),
            Response::HTTP_NOT_FOUND
        );
    }

    /**
     * @param StoreRequest $request
     * @return JsonResponse|AnonymousResourceCollection
     */
    public function store(StoreRequest $request)
    {
        $collection = $request->validated();

        $collection['user_id'] = auth('sanctum')->user()->id;

        $collection['status'] = Refund::PENDING;

        $result = $this->service->create($collection);

        if ($result['status']) {
            return $this->successResponse(__('web.record_successfully_created'), RefundResource::make($result['data']));
        }
        return $this->errorResponse(
            $result['code'], $result['message'] ?? trans('errors.' . $result['code'], [], \request()->lang),
            Response::HTTP_BAD_REQUEST
        );
    }

    /**
     * @param UpdateRequest $request
     * @param int $id
     * @return JsonResponse|AnonymousResourceCollection
     */
    public function update(UpdateRequest $request, int $id)
    {
        $collection = $request->validated();

        $result = $this->service->update($collection, $id);

        if ($result['status']) {
            return $this->successResponse(__('web.record_successfully_update'), RefundResource::make($result['data']));
        }
        return $this->errorResponse(
            $result['code'], $result['message'] ?? trans('errors.' . $result['code'], [], \request()->lang),
            Response::HTTP_BAD_REQUEST
        );
    }


}
