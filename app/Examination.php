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
}
