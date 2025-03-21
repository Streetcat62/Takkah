<?php

namespace App\Http\Controllers\API\v1\Auth;

use App\Helpers\ResponseError;
use App\Http\Controllers\Controller;
use App\Http\Requests\RegisterRequest;
use App\Models\User;
use App\Services\AuthService\AuthByEmail;
use App\Services\AuthService\AuthByMobilePhone;
use App\Services\SMSGatewayService\SMSBaseService;
use App\Traits\ApiResponse;
use Illuminate\Auth\Events\Registered;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Twilio\Exceptions\ConfigurationException;

class RegisterController extends Controller
{
    use ApiResponse;

    /**
     * @throws ConfigurationException
     */
    public function register(RegisterRequest $request)
    {
        $collection = $request->validated();

        $user = User::where([
            ['phone', $request->input('phone')],
            ['phone', '!=', 'NULL']
        ])->orWhere([
            ['email', $request->input('email')],
            ['email', '!=', 'NULL']
        ])->first();

        if ($user){
            return $this->errorResponse(ResponseError::ERROR_106, trans('errors.' . ResponseError::ERROR_106, [], request()->lang ?? 'en'), Response::HTTP_BAD_REQUEST);
        }

        if (isset($collection['phone'])){
            return (new AuthByMobilePhone())->authentication($collection);
        } elseif (isset($collection['email'])) {
            return (new AuthByEmail())->authentication($collection);
        }
        return $this->errorResponse(ResponseError::ERROR_400, 'errors.'.ResponseError::ERROR_400, Response::HTTP_BAD_REQUEST);
    }
}
