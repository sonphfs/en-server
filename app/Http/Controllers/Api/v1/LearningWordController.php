<?php

namespace App\Http\Controllers\Api\v1;

use App\LearningWord;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class LearningWordController extends Controller
{
    public function getLearingWords($subjectId)
    {
        return $this->response(LearningWord::where('subject_id', $subjectId)->get());
    }
}
