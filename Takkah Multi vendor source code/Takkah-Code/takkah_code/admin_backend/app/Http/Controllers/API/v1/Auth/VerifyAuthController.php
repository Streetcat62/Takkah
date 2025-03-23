<?php

namespace App\Http\Controllers\API\v1\Auth;

use App\Events\Mails\SendEmailVerification;
use App\Helpers\ResponseError;
use App\Http\Controllers\Controller;
use App\Http\Requests\Auth\AfterVerifyRequest;
use App\Http\Requests\Auth\ResendVerifyRequest;
use App\Http\Resources\UserResource;
use App\Models\User;
use App\Services\AuthService\AuthByMobilePhone;
use App\Services\UserServices\UserWalletService;
use App\Traits\ApiResponse;
use App\Traits\Notification;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class VerifyAuthController extends Controller
{
    use ApiResponse, Notification;

//    public function verifyEmail(Request $request): \Illuminate\Http\JsonResponse
//    {
//        return (new AuthByEmail())->confirmOPTCode($request->all());
//    }

    public function verifyPhone(Request $request)
    {
        return (new AuthByMobilePhone())->confirmOPTCode($request->all());
    }

    public function resendVerify(ResendVerifyRequest $request): JsonResponse
    {
        $user = User::where('email', $request->input('email'))
            ->whereNotNull('verify_token')
            ->whereNull('email_verified_at')
            ->first();

        if (!$user) {
            return $this->errorResponse(ResponseError::ERROR_404, trans('errors.' . ResponseError::ERROR_404, [], request()->lang),
                Response::HTTP_NOT_FOUND);
        }

        event((new SendEmailVerification($user)));

        return $this->successResponse('Verify code send');
    }

    public function verifyEmail(?string $verifyToken): JsonResponse
    {
        $user = User::withTrashed()->where('verify_token', $verifyToken)
            ->whereNull('email_verified_at')
            ->first();

        if (empty($user)) {
            return $this->errorResponse(ResponseError::ERROR_404, trans('errors.' . ResponseError::ERROR_404, [], request()->lang),
                Response::HTTP_NOT_FOUND);
        }

        try {
            $user->update([
                'email_verified_at' => now(),
                'verify_token'      => null,
                'deleted_at'        => null,
            ]);

            return $this->successResponse('Email successfully verified', [
                'email' => $user->email
            ]);
        } catch (\Throwable $e) {
            return $this->errorResponse(ResponseError::ERROR_501, trans('errors.' . ResponseError::ERROR_501, [], request()->lang),
                Response::HTTP_BAD_REQUEST);
        }
    }

    public function afterVerifyEmail(AfterVerifyRequest $request): JsonResponse
    {
        $user = User::where('email', $request->input('email'))->first();

        $user->update([
            'firstname'         => $request->input('firstname', $user->email),
            'lastname'         => $request->input('lastname', $user->email),
            'referral'          => $request->input('referral', $user->referral),
            'birthday'          => $request->input('birthday', $user->birthday),
//            'gender'            => $request->input('gender','male'),
            'password'          => bcrypt($request->input('password', 'password')),
        ]);

        $referral = User::where('my_referral', $request->input('referral', $user->referral))
            ->first();

        if (!empty($referral) && !empty($referral->firebase_token)) {
            $this->sendNotification(
                [$referral->firebase_token],
                "By your referral registered new user. $user->name_or_email",
                "Congratulations!",
                [
                    'type' => 'new_user_by_referral'
                ],
            );
        }


//        $user->notifications()->sync(
//            Notification::where('type', Notification::PUSH)
//                ->select(['id', 'type'])
//                ->first()
//                ->pluck('id')
//                ->toArray()
//        );

        $user->emailSubscription()->updateOrCreate([
            'user_id' => $user->id
        ], [
            'active' => true
        ]);

        if(empty($user->wallet)) {
            $user = (new UserWalletService())->create($user);
        }

        $token = $user->createToken('api_token')->plainTextToken;

        return $this->successResponse(__('web.user_successfully_registered'), [
            'token' => $token,
            'user'  => UserResource::make($user),
        ]);
    }

}
