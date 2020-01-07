<?php

namespace App\Http\Controllers\Api\v1;

use App\Lesson;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class LessonController extends Controller
{
    public function getLessons()
    {
        $perPage = 9;
        return $this->response(Lesson::paginate($perPage));
    }

}
