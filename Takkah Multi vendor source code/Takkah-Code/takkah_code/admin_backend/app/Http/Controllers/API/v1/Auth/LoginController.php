<?php

namespace App\Http\Controllers\API\v1\Auth;

use App\Helpers\ResponseError;
use App\Http\Controllers\Controller;
use App\Http\Requests\Auth\PhoneVerifyRequest;
use App\Http\Resources\UserResource;
use App\Models\Currency;
use App\Models\User;
use App\Models\Wallet;
use App\Services\AuthService\AuthByMobilePhone;
use App\Services\EmailSettingService\EmailSendService;
use App\Services\UserServices\UserWalletService;
use App\Traits\ApiResponse;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Str;
use Spatie\Permission\Models\Role;
use Symfony\Component\HttpFoundation\Response;
use App\Mail\SendMail;
use function auth;

class LoginController extends Controller
{
    use ApiResponse;

    /**
     * @OA\Post  (
     *   path="/v1/auth/login",
     *   tags={"Auth"},
     *   summary="Auntheficate user",
     *   operationId="AuthLogin",
     *   @OA\RequestBody (
     *      required=true,
     *      description="Pass user credentials",
     *      @OA\JsonContent (
     *          type="object",
     *          required={"email","password"},
     *          @OA\Property (
     *              format="string",
     *              example="admin@gmail.com",
     *              property="email",
     *          ),
     *          @OA\Property(
     *              format="string",
     *              example="admin123",
     *              property="password"
     *          )
     *      )
     *  ),
     *  @OA\Response (
     *      response=200, description="Successful operation",
     *      @OA\MediaType( mediaType="application/json" )
     *  ),
     *  @OA\Response( response=401, description="Unauthorized" ),
     *  @OA\Response( response=403, description="Forbidden" ),
     *  @OA\Response( response=400, description="Bad Request" ),
     *  @OA\Response( response=404, description="Not found" ),
     * )
     */
    public function login(Request $request)
    {
        if (isset($request->phone)) {
            if (!auth()->attempt($request->only('phone', 'password'))) {
                return $this->errorResponse('ERROR_102',trans('errors.' . ResponseError::ERROR_102, [], request()->lang ?? 'en'), Response::HTTP_NOT_FOUND);
            }
            $token = auth()->user()->createToken('api_token')->plainTextToken;

            return $this->successResponse('User successfully login', [
                'access_token' => $token,
                'token_type' => 'Bearer',
                'user' => UserResource::make(auth('sanctum')->user()),
            ]);
        } else {
            if (!auth()->attempt($request->only('email', 'password'))) {
                return $this->errorResponse('ERROR_102',trans('errors.' . ResponseError::ERROR_102, [], request()->lang ?? 'en'), Response::HTTP_NOT_FOUND);
            }
            if (auth()->user()->hasVerifiedEmail()){
                $token = auth()->user()->createToken('api_token')->plainTextToken;

                return $this->successResponse('User successfully login', [
                    'access_token' => $token,
                    'token_type' => 'Bearer',
                    'user' => UserResource::make(auth('sanctum')->user()),
                ]);
            }
        }

        return $this->errorResponse(ResponseError::ERROR_103,trans('errors.' . ResponseError::ERROR_103, [], request()->lang ?? 'en'), Response::HTTP_UNAUTHORIZED);

    }

//    /**
//     * Redirect the user to the Provider authentication page.
//     *
//     * @param $provider
//     * @return JsonResponse
//     */
//    public function redirectToProvider($provider)
//    {
//        $validated = $this->validateProvider($provider);
//        if (!is_null($validated)) {
//            return $validated;
//        }
//
//        return Socialite::driver($provider)->stateless()->redirect();
//    }

    /**
     * Obtain the user information from Provider.
     *
     * @param $provider
     * @param Request $request
     * @return JsonResponse
     */
    public function handleProviderCallback($provider, Request $request)
    {
        $validated = $this->validateProvider($provider);
        if (!is_null($validated)) {
            return $validated;
        }

        $user = User::withTrashed()->updateOrCreate(
            [
                'email' => $request->email
            ],
            [
                'email_verified_at' => now(),
                'firstname' => $request->name,
                'active' => true,
                'img' => $request->avatar ?? null,
                'deleted_at'         => null,
            ]
        );
        $user->socialProviders()->updateOrCreate(
            [
                'provider' => $provider,
                'provider_id' => $request->id,
            ],
            [
                'avatar' => $request->avatar ?? null
            ]
        );

        if (!$user->hasAnyRole(Role::pluck('name')->toArray())) {
            $user->syncRoles('user');
        }

        $user->emailSubscription()->updateOrCreate([
            'user_id' => $user->id
        ], [
            'active' => true
        ]);

        if (!isset($user->wallet)) {
            $wallet = new Wallet();
            $wallet->uuid = Str::uuid();
            $wallet->user_id = $user->id;
            $wallet->currency_id = Currency::whereDefault(1)->pluck('id')->first();
            $wallet->price = 0;
            $wallet->save();
        }


        $token = $user->createToken('api_token')->plainTextToken;

        return $this->successResponse('User successfully login', [
            'access_token' => $token,
            'token_type' => 'Bearer',
            'user' => UserResource::make($user),
        ]);
    }

    /**
     * @param $provider
     * @return JsonResponse
     */
    protected function validateProvider($provider)
    {
        if (!in_array($provider, ['facebook', 'github', 'google'])) {
            return $this->errorResponse(ResponseError::ERROR_107, trans('errors.'. ResponseError::ERROR_107, [], \request()->lang ?? 'en'), Response::HTTP_UNAUTHORIZED);
        }
    }


    /**
     * @OA\Post (
     *  path="/v1/auth/logout",
     *  tags={"Auth"},
     *  summary="Logout authificated user",
     *  operationId="AuthLogout",
     *  security={{"sanctum": {}}},
     *  @OA\Response(
     *      response=200, description="Successful operation",
     *      @OA\MediaType(mediaType="application/json")
     *  ),
     *  @OA\Response(response=401, description="Unauthorized"),
     *  @OA\Response(response=403, description="Forbidden"),
     *  @OA\Response(response=400, description="Bad Request"),
     *  @OA\Response(response=404, description="Not found"),
     * )
     */
    public function logout()
    {
        auth('sanctum')->user()->currentAccessToken()->delete();
        return $this->successResponse('User successfully logout');
    }

    public function forgetPassword(Request $request)
    {
        if (isset($request->phone)) {
            return (new AuthByMobilePhone())->authentication($request->all());
        }
        return $this->errorResponse(ResponseError::ERROR_400, 'errors.' . ResponseError::ERROR_400, Response::HTTP_BAD_REQUEST);
    }

    public function forgetPasswordEmail(Request $request): JsonResponse
    {
        $user = User::withTrashed()->where('email', $request->input('email'))->first();

        if (!$user) {
            return $this->onErrorResponse(['code' => ResponseError::ERROR_404]);
        }

        $token = rand(111111, 999999);

        Cache::put($token, $token, 900);

        (new EmailSendService)->sendEmailPasswordReset(User::find($user->id), $token);

        return $this->successResponse('Verify code send');
    }

    public function forgetPasswordVerifyEmail($hash, Request $request): JsonResponse
    {
        $token = Cache::get($hash);

        if (!$token) {
            return $this->onErrorResponse(['code' => ResponseError::ERROR_400, 'message' => 'Incorrect code or token expired']);
        }

        $user = User::withTrashed()->where('email', $request->input('email'))->first();

        if (!$user) {
            return $this->onErrorResponse(['code' => ResponseError::ERROR_404]);
        }

        if (!$user->hasAnyRole(Role::query()->pluck('name')->toArray())) {
            $user->syncRoles('user');
        }

        $token = $user->createToken('api_token')->plainTextToken;

        $user->update([
            'active'        => true,
            'deleted_at'    => null
        ]);

        session()->forget([$request->input('email') . '-' . $hash]);

        return $this->successResponse('User successfully login', [
            'token' => $token,
            'user'  => UserResource::make($user),
        ]);
    }


    public function forgetPasswordVerify(PhoneVerifyRequest $request)
    {
        $collection = $request->validated();
        return (new AuthByMobilePhone())->confirmOPTCode($collection);
    }


}
