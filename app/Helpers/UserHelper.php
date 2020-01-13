<?php


namespace App\Helpers;

use App\User;

class UserHelper
{
    public static function all()
    {
        return User::all();
    }

    public static function isAdmin(User $user)
    {
        $roles = $user->roles;
        foreach ($roles as $role) {
            if($role['name'] == 'ROOT' || $role['name'] == 'ADMIN') {
                return true;
            }
        }
        return false;
    }
}
