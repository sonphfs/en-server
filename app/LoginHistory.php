<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class LoginHistory extends Model
{
    protected $table = 'login_histories';

    protected $fillable = [
        'user_id',
        'ip_address',
        'device'
    ];
}
