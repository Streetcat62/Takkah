<?php

namespace App\Http\Controllers\API\v1\Dashboard\Admin;

use App\Helpers\ResponseError;
use App\Http\Requests\FilterParamsRequest;
use App\Http\Resources\TransactionResource;
use App\Repositories\TransactionRepository\TransactionRepository;
use Symfony\Component\HttpFoundation\Response;

class TransactionController extends AdminBaseController
{

    public function __construct(protected TransactionRepository $transactionRepository)
    {
        parent::__construct();
    }

    public function paginate(FilterParamsRequest $request)
    {
        $transactions = $this->transactionRepository->paginate($request->perPage ?? 15, $request->all());
        return TransactionResource::collection($transactions);
    }

    public function show(int $id)
    {
        $transaction = $this->transactionRepository->show($id);
        if ($transaction) {
            return $this->successResponse(ResponseError::NO_ERROR, TransactionResource::make($transaction));
        }
        return $this->errorResponse(
            ResponseError::ERROR_404, trans('errors.' . ResponseError::ERROR_404, [], request()->lang),
            Response::HTTP_NOT_FOUND
        );
    }
}
