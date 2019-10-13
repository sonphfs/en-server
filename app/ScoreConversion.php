<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ScoreConversion extends Model
{
    protected $table= 'score_conversions';

    protected $fillable = ['num', 'listening_score', 'reading_score'];
}
