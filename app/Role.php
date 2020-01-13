<?php

namespace App;

use App\BaseModel as Model;

class Role extends Model
{
    protected $table = 'roles';

    public function users()
    {
        return $this->belongsToMany(User::class, 'role_users');
    }
}
