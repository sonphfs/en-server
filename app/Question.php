<?php

namespace App;

use App\BaseModel as Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Question extends Model
{
    use SoftDeletes;

    protected $table = 'questions';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['part', 'no', 'content', 'image', 'data','paragraph','content','answer_A','answer_B','answer_C','answer_D','correct_answer',];
}
