<?php

namespace App\Http\Controllers\API\v1\Dashboard\User;

use App\Helpers\ResponseError;
use App\Http\Controllers\Controller;
use App\Http\Resources\InviteResource;
use App\Models\Invitation;
use App\Models\Shop;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class InviteController extends UserBaseController
{

    public function __construct(protected Invitation $model)
    {
        parent::__construct();
    }

    public function paginate(Request $request)
    {
        $invites = $this->model->filter($request->all())->with([
            'user.roles',
            'user' => function($q) {
                $q->select('id', 'firstname', 'lastname');
            },
            'shop.translation'
        ])
            ->where('user_id', auth('sanctum')->id())
            ->orderBy($request->column ?? 'id', $request->sort ?? 'desc')
            ->paginate($request->perPage ?? 15, );
        return InviteResource::collection($invites);
    }


    public function create($shop)
    {
        $shop = Shop::firstWhere('uuid', $shop);
        if ($shop){
            $invite = $this->model->updateOrCreate(['user_id' => auth('sanctum')->user()->id],[
                'shop_id' => $shop->id,
            ]);
            return $this->successResponse(__('web.invite_send'), InviteResource::make($invite));
        }else{
            return $this->errorResponse(
                ResponseError::ERROR_404, trans('errors.' . ResponseError::ERROR_404, [], request()->lang),
                Response::HTTP_NOT_FOUND
            );
        }

    }
}
