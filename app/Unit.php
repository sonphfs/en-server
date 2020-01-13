<?php

namespace App;

use App\BaseModel as Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Unit extends Model
{
    use SoftDeletes;

    protected $table = 'units';

    public function lessons()
    {
        return $this->hasMany(Lesson::class, 'unit_id', 'id');
    }
}
