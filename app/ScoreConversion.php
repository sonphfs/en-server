<?php

namespace App;

use App\BaseModel as Model;

class ScoreConversion extends Model
{
    protected $table= 'score_conversions';

    protected $fillable = ['num', 'listening_score', 'reading_score'];
}
