<?php

namespace App;

use App\BaseModel as Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class LearningWord extends Model
{
    use SoftDeletes;

    protected $table = 'learning_words';
}
