<?php


namespace App\Helpers;

use App\Lesson;

class LessonHelper
{
    public static function all()
    {
        return Lesson::all();
    }
}