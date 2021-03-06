<?php

namespace App;

use App\BaseModel as Model;

class ExaminationLog extends Model
{
    protected $table = 'examination_logs';

    public function questions()
    {
        return $this->belongsToMany(Question::class, 'question_logs')->withPivot('choosen_answer');
    }

    public function examination()
    {
        return $this->belongsTo(Examination::class, 'examination_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
