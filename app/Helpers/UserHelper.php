<?php


namespace App\Helpers;

use App\User;

class UserHelper
{
    public static function all()
    {
        return User::all();
    }
}