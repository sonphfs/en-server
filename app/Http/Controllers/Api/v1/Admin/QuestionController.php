<?php

namespace App\Http\Controllers\Api\v1\Admin;

use App\Question;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class QuestionController extends Controller
{
    public function getQuestions()
    {
        $keyword = \request()->keyword;
        if(!empty($keyword)) {
            $subjects = Question::where('code', 'LIKE', "%{$keyword}%")
                ->orWhere('content', 'LIKE', "%{$keyword}%")
                ->orWhere('answer_A', 'LIKE', "%{$keyword}%")
                ->orWhere('answer_B', 'LIKE', "%{$keyword}%")
                ->orWhere('answer_C', 'LIKE', "%{$keyword}%")
                ->orWhere('answer_D', 'LIKE', "%{$keyword}%")
                ->orWhere('correct_answer', 'LIKE', "%{$keyword}%")
                ->orWhere('created_at', 'LIKE', "%{$keyword}%")
                ->paginate(self::PER_PAGE);
            return $this->response($subjects);
        }
        return $this->response(Question::paginate(self::PER_PAGE));
    }
}
