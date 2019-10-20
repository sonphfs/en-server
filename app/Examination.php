<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Examination extends Model
{
    protected $table = 'examinations';

    protected $fillable = ['title', 'type', 'description', 'audio'
    ];

    public function questions()
    {
        return $this->belongsToMany(Question::class, 'examination_questions');
    }

    public function examination_logs()
    {
        return $this->hasMany(ExaminationLog::class);
    }
}
