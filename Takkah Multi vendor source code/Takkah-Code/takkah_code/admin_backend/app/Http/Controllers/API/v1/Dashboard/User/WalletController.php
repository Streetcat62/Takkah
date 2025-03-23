<?php

namespace App\Http\Controllers\API\v1\Dashboard\User;

use App\Helpers\ResponseError;
use App\Http\Requests\FilterParamsRequest;
use App\Http\Requests\Wallet\StoreRequest;
use App\Http\Resources\WalletHistoryResource;
use App\Models\PointHistory;
use App\Models\WalletHistory;
use App\Repositories\WalletRepository\WalletHistoryRepository;
use App\Services\WalletHistoryService\WalletHistoryService;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\AnonymousResourceCollection;
use Symfony\Component\HttpFoundation\Response;

class WalletController extends UserBaseController
{

    public function __construct(protected WalletHistoryRepository $walletHistoryRepository,protected WalletHistoryService $walletHistoryService)
    {
        parent::__construct();
    }

    public function walletHistories(FilterParamsRequest $request): AnonymousResourceCollection
    {
        $histories = $this->walletHistoryRepository->walletHistoryPaginate($request->perPage ?? 15, $request->all());
        return WalletHistoryResource::collection($histories);
    }

    public function store(StoreRequest $request)
    {
        $collection = $request->validated();
        $user = auth('sanctum')->user();
        $collection['type'] = $collection['type'] ?? 'withdraw';
        if ($user->wallet) {
            if ($collection['type'] == 'withdraw' && $user->wallet->price < $request->price) {
                return $this->errorResponse(
                    ResponseError::ERROR_109, trans('errors.' . ResponseError::ERROR_109, [], \request()->lang ?? config('app.locale')),
                    Response::HTTP_BAD_REQUEST
                );
            } else {
                $result = $this->walletHistoryService->create(auth('sanctum')->user(), $request->all());
                if ($result['status']) {
                    return $this->successResponse(__('web.record_was_successfully_create'), WalletHistoryResource::make($result['data']));
                }
            }
        }
        return $this->errorResponse(
            ResponseError::ERROR_108, trans('errors.' . ResponseError::ERROR_108, [], \request()->lang ?? config('app.locale')),
            Response::HTTP_BAD_REQUEST
        );


    }

    public function changeStatus(string $uuid, Request $request)
    {
        if (!$request->input('status') ||
            !in_array($request->input('status'), [WalletHistory::REJECTED, WalletHistory::CANCELED])) {
            return $this->errorResponse(ResponseError::ERROR_253, trans('errors.' . ResponseError::ERROR_253, [], \request()->lang ?? config('app.locale')),
                Response::HTTP_BAD_REQUEST
            );
        }
        $result = $this->walletHistoryService->changeStatus($uuid, $request->status ?? null);
        if ($result['status']) {
            return $this->successResponse(__('web.record_was_successfully_updated'), []);
        }
        return $this->errorResponse(
            $result['code'], $result['message'] ?? trans('errors.' . $result['code'], [], \request()->lang),
            Response::HTTP_BAD_REQUEST
        );
    }

    public function pointHistories(FilterParamsRequest $request)
    {
        $histories = PointHistory::where('user_id', auth('sanctum')->id())
            ->orderBy($request->column ?? 'created_at', $request->sort ?? 'desc')
            ->paginate($request->perPage ?? 15);

        return $histories;
    }
}
