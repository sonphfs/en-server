<?php

namespace App\Http\Controllers\Api\v1;

use App\Helpers\LessonHelper as Lesson;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class LessonController extends Controller
{
    public function getLessons()
    {
        return $this->response(Lesson::all());
    }
}
