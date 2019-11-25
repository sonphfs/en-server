<?php

namespace App\Http\Controllers\Api\v1\Admin;

use App\RoleUser;
use App\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{
    public function getUsers()
    {
        $keyword = request()->keyword;
        if(!empty($keyword)) {
            $users = User::where('username', 'LIKE', "%{$keyword}%")
                ->orWhere('username', 'LIKE', "%{$keyword}%")
                ->orWhere('email', 'LIKE', "%{$keyword}%")
                ->orWhere('phone', 'LIKE', "%{$keyword}%")
                ->orWhere('address', 'LIKE', "%{$keyword}%")
                ->orWhere('created_at', 'LIKE', "%{$keyword}%")
                ->orWhere('updated_at', 'LIKE', "%{$keyword}%")
                ->paginate(self::PER_PAGE);
            return $this->response($users);
        }
        return $this->response(User::paginate(self::PER_PAGE));
    }

    public function updateProfile(Request $request)
    {
        $user = Auth::user();
        if(!$request->file('avatar')) {
            $request->validate([
                'username' => 'required|min:3|max:20',
                'phone' => 'required|min:3|max:20',
                'address' => 'required|min:3|max:20',
            ]);
            $user->username = $request->username;
            $user->phone = $request->phone;
            $user->address = $request->address;
        }else {
            $file = $request->file('avatar');
            //Move Uploaded File
            $destinationPath = self::USER_AVATARS_FOLDER;
            $result = $file->move($destinationPath,$file->getFileName().'.'.$file->getClientOriginalExtension());
            $user->avatar = $result->getPathname();
        }

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
            $user->password = bcrypt('123123');
            $user->phone = $requestData['phone'];
            $user->address = $requestData['address'];
            $user->email = $requestData['email'];
            $user->birthday = $requestData['birthday'];
            $user->gender = $requestData['gender'];
            $result = $user->save();
            $roleUser = new RoleUser();
            $roleUser->user_id = $user->id;
            $roleUser->role_id = 3;
            $roleUser->save();
        }catch (\Exception $e) {
            return $this->response($e, 422);
        }
        return $this->response($user);
    }

    public function show($id)
    {
        return $this->response(User::findOrFail($id));
    }

    public function update(Request $request, $id)
    {
        $user = User::find($id);
        $requestData = $request->all();
        $user->username = $requestData['username'];
        $user->phone = $requestData['phone'];
        $user->address = $requestData['address'];
        $user->gender = $requestData['gender'];
        $user->birthday = $requestData['birthday'];
        $user->save();
        return $this->response($user);
    }

    public function delete(Request $request)
    {
        try {
            $id = $request->all()['id'];
            $user = User::find($id);
            $user->delete();
            if($user->deleted_at != null)
                return $this->response($user);
        }catch (\Exception $e) {
            return response()->json(['message' => 'Deleted fail!'], 400);
        }
    }
}
