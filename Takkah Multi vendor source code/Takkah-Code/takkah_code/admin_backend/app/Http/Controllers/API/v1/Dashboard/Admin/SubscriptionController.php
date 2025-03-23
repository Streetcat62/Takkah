<?php

namespace App\Http\Controllers\API\v1\Dashboard\Admin;

use App\Helpers\ResponseError;
use App\Http\Resources\EmailSubscriptionResource;
use App\Http\Resources\SubscriptionResource;
use App\Models\EmailSubscription;
use App\Models\Subscription;
use App\Services\SubscriptionService\SubscriptionService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\AnonymousResourceCollection;
use Symfony\Component\HttpFoundation\Response;

class SubscriptionController extends AdminBaseController
{
    public function __construct(protected Subscription $model,protected SubscriptionService $subscriptionService)
    {
        parent::__construct();
    }

    /**
     * Display a listing of the resource.
     *
     * @return JsonResponse
     */
    public function index()
    {
        $subscriptions = $this->model->subscriptionsList();
        return $this->successResponse(trans('web.subscription_list', [], \request()->lang), SubscriptionResource::collection($subscriptions));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return JsonResponse
     */
    public function show($id)
    {
        $subscription = $this->model->find($id);
        if ($subscription) {
            return $this->successResponse(trans('web.subscription_list', [], \request()->lang), SubscriptionResource::make($subscription));
        }
        return $this->errorResponse(ResponseError::ERROR_404, trans('errors.ERROR_404', [], \request()->lang), Response::HTTP_NOT_FOUND);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param Request $request
     * @param  int  $id
     * @return JsonResponse
     */
    public function update(Request $request, $id)
    {

        $result = $this->subscriptionService->update($id, $request);
        if ($result['status']) {

            cache()->forget('subscriptions-list');
            return $this->successResponse(trans('web.subscription_list', [], \request()->lang), SubscriptionResource::make($result['data']));
        }
        return $this->errorResponse($result['code'], $result['message'] ?? trans('errors.' . $result['code'], [], \request()->lang), Response::HTTP_BAD_REQUEST);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    /**
     * @param Request $request
     * @return AnonymousResourceCollection
     */
    public function emailSubscriptions(Request $request): AnonymousResourceCollection
    {
        $emailSubscriptions = EmailSubscription::with([
            'user' => fn($q) => $q->select([
                'id',
                'uuid',
                'firstname',
                'lastname',
                'email',
            ])
        ])
            ->when($request->input('user_id'), fn($q, $userId) => $q->where('user_id', $userId))
            ->paginate($request->input('perPage', 10));

        return EmailSubscriptionResource::collection($emailSubscriptions);
    }
}
