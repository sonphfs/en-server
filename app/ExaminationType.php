<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ExaminationType extends Model
{
    protected $table = 'examination_types';

    protected $fillable = ['name', 'type'];
}
