<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Examination extends Model
{
    protected $table = 'examinations';

    protected $fillable = ['title', 'type', 'description', 'audio'
    ];
}
