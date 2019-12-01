<?php

namespace App\Http\Controllers\Api\v1\Admin;

use App\Question;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class QuestionController extends Controller
{
    public function getQuestion()
    {
        $keyword = \request()->keyword;
        if(!empty($keyword)) {
            $question = Question::where('code', 'LIKE', "%{$keyword}%")
                ->orWhere('content', 'LIKE', "%{$keyword}%")
                ->orWhere('answer_A', 'LIKE', "%{$keyword}%")
                ->orWhere('answer_B', 'LIKE', "%{$keyword}%")
                ->orWhere('answer_C', 'LIKE', "%{$keyword}%")
                ->orWhere('answer_D', 'LIKE', "%{$keyword}%")
                ->orWhere('created_at', 'LIKE', "%{$keyword}%")
                ->orderBy('id', 'desc')->paginate(self::PER_PAGE);
            return $this->response($question);
        }
        return $this->response(Question::paginate(self::PER_PAGE));
    }
}
