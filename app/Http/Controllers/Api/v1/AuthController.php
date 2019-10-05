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
        return response()->json($user, Response::HTTP_OK);
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
        return response()->json(['token' => $token], Response::HTTP_OK);
    }

    public function user(Request $request)
    {
        $user = Auth::user()->load('roles');
        if ($user) {
            return response($user, Response::HTTP_OK);
        }
        return response(null, Response::HTTP_BAD_REQUEST);
    }


    public function logout(Request $request) {
        $this->validate($request, ['token' => 'required']);
        try {
            JWTAuth::invalidate($request->input('token'));
            return response()->json('You have successfully logged out.', Response::HTTP_OK);
        } catch (JWTException $e) {
            return response()->json('Failed to logout, please try again.', Response::HTTP_BAD_REQUEST);
        }
    }

    public function refresh()
    {
        return response(JWTAuth::getToken(), Response::HTTP_OK);
    }
}
