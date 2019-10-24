<?php

namespace App;

use App\BaseModel as Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class LearningWord extends Model
{
    use SoftDeletes;

    protected $table = 'learning_words';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['subject_id', 'word', 'type', 'meaning', 'pronunciation', 'example'];
}
