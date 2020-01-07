<?php

namespace App;

use App\BaseModel as Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Examination extends Model
{
    use SoftDeletes;

    protected $table = 'examinations';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */

    protected $fillable = [
        'title',
        'type',
        'description',
        'audio',
        'published',
    ];

    public function questions()
    {
        return $this->belongsToMany(Question::class, 'examination_questions');
    }

    public function examination_logs()
    {
        return $this->hasMany(ExaminationLog::class);
    }

    public function examination_type()
    {
        return $this->hasOne(ExaminationType::class, 'id', 'type');
    }

    public function subject()
    {
        return $this->hasOne(Subject::class, 'id', 'subject_id');
    }

    public function lesson()
    {
        return $this->hasOne(Subject::class, 'id', 'subject_id');
    }
}
