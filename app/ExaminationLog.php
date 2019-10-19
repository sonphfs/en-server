<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ExaminationLog extends Model
{
    protected $table = 'examination_logs';

    public function questions()
    {
        return $this->belongsToMany(Question::class, 'question_logs');
    }
}
