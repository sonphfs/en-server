<?php

namespace App;

use App\BaseModel as Model;

class LoginHistory extends Model
{
    protected $table = 'login_histories';

    protected $fillable = [
        'user_id',
        'ip_address',
        'device'
    ];

    public function user(){
        return $this->belongsTo(User::class);
    }
}
