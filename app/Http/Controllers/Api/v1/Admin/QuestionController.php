<?php

namespace App\Http\Controllers\Api\v1\Admin;

use App\Question;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

class QuestionController extends Controller
{
    public function getQuestions()
    {
        $keyword = \request()->keyword;
        $wordId = \request()->word_id;
        $lessonId = \request()->lesson_id;
        $type = \request()->type;
        $searchConditions = [];
        if(!empty($wordId)) {
            $searchConditions['word_id'] = $wordId;
        }
        if(!empty($lessonId)) {
            $searchConditions['lesson_id'] = $lessonId;
        }
        if(!empty($keyword) || !empty($searchConditions)) {
            $subjects = Question::when($searchConditions, function($query, $searchConditions){
                return $query->where($searchConditions);
            })->when($keyword, function($query, $keyword) {
                    $query->orWhere('content', 'LIKE', "%{$keyword}%")
                        ->orWhere('answer_A', 'LIKE', "%{$keyword}%")
                        ->orWhere('answer_B', 'LIKE', "%{$keyword}%")
                        ->orWhere('answer_C', 'LIKE', "%{$keyword}%")
                        ->orWhere('answer_D', 'LIKE', "%{$keyword}%")
                        ->orWhere('correct_answer', 'LIKE', "%{$keyword}%")
                        ->orWhere('created_at', 'LIKE', "%{$keyword}%")
                        ->orWhere('code', 'LIKE', "%{$keyword}%");
            })->paginate(self::PER_PAGE);
            return $this->response($subjects);
        }
        return $this->response(Question::paginate(self::PER_PAGE));
    }

    public function createOrUpdate(Request $request){
        $question = $request->all()['question'];
        if(isset($question['id'])) {
            $questionObject = Question::find($question['id']);
        }else{
            $questionObject = new Question();
        }

        $questionObject->content = $question['content'];
        $questionObject->code = $this->_generateRandomString();
        if(isset($question['word_id'])){
            $questionObject->word_id = $question['word_id'];
        }
        if(isset($question['lesson_id'])){
            $questionObject->lesson_id = $question['lesson_id'];
        }
        $questionObject->answer_A = $question['answer_A'];
        $questionObject->answer_B = $question['answer_B'];
        $questionObject->answer_C = $question['answer_C'];
        $questionObject->answer_D = $question['answer_D'];
        $questionObject->correct_answer = $question['correct_answer'];
        $questionObject->image = $question['image'];
        $questionObject->audio = $question['audio'];
        $questionObject->save();
    }

    public function delete(Request $request)
    {
        try {
            $id = $request->all()['id'];
            $question = Question::find($id);
            $subQuestionIds = Question::where('parent_id', $id)->get()->pluck('id')->toArray();
            if(count($subQuestionIds)) {
                $result = Question::whereIn('id', $subQuestionIds)->delete();
            }
            $question->delete();
            if($question->deleted_at != null)
                return $this->response($question);
        }catch (\Exception $e) {}
    }
}
