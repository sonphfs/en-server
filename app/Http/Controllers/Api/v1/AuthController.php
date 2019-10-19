<?php

namespace App\Http\Controllers\Api\v1;

use App\Http\Requests\LoginRequest;
use App\Http\Requests\RegisterRequest;
use App\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Tymon\JWTAuth\Facades\JWTAuth;
use Illuminate\Http\Response;

class AuthController extends Controller
{

    public function register(RegisterRequest $request)
    {
        $params = $request->only('email', 'username', 'password');
        $user = new User();
        $user->email = $params['email'];
        $user->username = $params['username'];
        $user->password = bcrypt($params['password']);
        $user->save();
        return $this->response($user,Response::HTTP_OK);
    }

    public function login(LoginRequest $request)
    {
        $credentials = $request->only('email', 'password');
        if (!($token = JWTAuth::attempt($credentials))) {
            return response()->json([
                'status' => 'error',
                'error' => 'invalid.credentials',
                'msg' => 'Invalid Credentials.'
            ], Response::HTTP_BAD_REQUEST);
        }
        $user = Auth::user();
        event(new \App\Events\Login($user));
        return $this->response(['token' => $token]);
    }

    public function user(Request $request)
    {
        $user = Auth::user()->load('roles');
        if ($user) {
            return $this->response($user,Response::HTTP_OK);
        }
        return $this->response(null, Response::HTTP_BAD_REQUEST);
    }


    public function logout(Request $request) {
        $token = $request->header('Authorization');
        try {
            JWTAuth::invalidate($token);
            return $this->response('You have successfully logged out.', Response::HTTP_OK);
        } catch (JWTException $e) {
            return $this->response('Failed to logout, please try again.', Response::HTTP_OK);

        }
    }

    public function refresh()
    {
        return $this->response(JWTAuth::getToken(), Response::HTTP_OK);
    }
}
