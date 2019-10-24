<?php

namespace App\Http\Controllers\Api\v1;

use App\Helpers\UserHelper as User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{
    public function getUsers()
    {
        return $this->response(User::all());
    }

    public function updateProfile(Request $request)
    {
        $request->validate([
            'username' => 'required|min:3|max:20',
            'phone' => 'required|min:3|max:20',
            'address' => 'required|min:3|max:20',
        ]);
        $user = Auth::user();
        $user->username = $request->username;
        $user->phone = $request->phone;
        $user->address = $request->address;
        $result = $user->update();
        return $this->response($result);
    }

    public function changePassword(Request $request)
    {
        $currentPassword = Auth::user()->getAuthPassword();
        $request->validate([
            'current_password' => 'required|min:3|max:20',
            'password' => 'required|min:3|max:20',
            'password_confirmation' => 'required|min:3|max:20',
        ]);
        if ($request->password != $request->password_confirmation) {
            return $this->response(false, 402, 'Password incorrect');
        }
        $user = Auth::user();
        $user->password = bcrypt($request->password);
        return $this->response($user->update());
    }

    public function create(Request $request)
    {
        $requestData = $request->all();
        try{
            $user = new User();
            $user->username = $requestData['username'];
            $user->password = bcrypt($requestData['username']);
            $user->phone = $requestData['username'];
            $user->address = $requestData['username'];
            $user->email = $requestData['username'];
            $result = $user->save();
        }catch (\Exception $e) {
            return $this->response('Create user failed!', 422);
        }
        return $this->response($result);
    }

    public function show($id)
    {
        return $this->response(User::findOrFail($id));
    }

    public function update(Request $request, $id)
    {

    }

    public function delete($id)
    {
        $result = User::find($id)->detete();
        return $this->response($result);
    }
}
