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
        $wordId = \request()->word_id;
        $lessonId = \request()->lesson_id;
        $searchConditions = [];
        if(!empty($wordId)) {
            $searchConditions['word_id'] = $wordId;
        }
        if(!empty($lessonId)) {
            $searchConditions['lesson_id'] = $lessonId;
        }
        if(!empty($keyword) || !empty($searchConditions)) {
            $subjects = Question::where('code', 'LIKE', "%{$keyword}%")
                ->orWhere('content', 'LIKE', "%{$keyword}%")
                ->orWhere('answer_A', 'LIKE', "%{$keyword}%")
                ->orWhere('answer_B', 'LIKE', "%{$keyword}%")
                ->orWhere('answer_C', 'LIKE', "%{$keyword}%")
                ->orWhere('answer_D', 'LIKE', "%{$keyword}%")
                ->orWhere('correct_answer', 'LIKE', "%{$keyword}%")
                ->orWhere('created_at', 'LIKE', "%{$keyword}%")
                ->where($searchConditions)
                ->paginate(self::PER_PAGE);
            return $this->response($subjects);
        }
        return $this->response(Question::paginate(self::PER_PAGE));
    }
}
