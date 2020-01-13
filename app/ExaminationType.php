<?php

namespace App;

use App\BaseModel as Model;

class ExaminationType extends Model
{
    protected $table = 'examination_types';

    protected $fillable = ['name', 'type'];
}
