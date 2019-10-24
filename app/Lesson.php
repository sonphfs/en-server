<?php

namespace App;

use App\BaseModel as Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Lesson extends Model
{
    use SoftDeletes;

    protected $table = 'lessons';
}
