<?php


namespace App\Helpers;


use App\ExaminationQuestion;
use App\Question;

class QuestionHelper
{

    public static function createOrUpdateQuestion($question)
    {
        $questionObj = new Question();
        if(isset($question['id'])) {
            $questionObj = Question::find($question['id']);
        }
        $questionObj->no = $question['no'];
        if(isset($question['code'])) {
            $questionObj->code = $question['code'];
        }else {
            $questionObj->code = CommonHelper::generateRandomString();
        }
        $questionObj->answer_A = $question['answer_A'];
        $questionObj->answer_B = $question['answer_B'];
        $questionObj->answer_C = $question['answer_C'];
        $questionObj->answer_D = $question['answer_D'];
        $questionObj->correct_answer = $question['correct_answer'];
        $questionObj->save();
        return $questionObj;
    }

    public static function updatePivotData($examinationId, $questionId)
    {
        $examinationQuestion = ExaminationQuestion::where('examination_id', 111)
            ->where('question_id', $questionId)
            ->first();
        if($examinationQuestion == null) {
            $examinationQuestion = new ExaminationQuestion();
            $examinationQuestion->examination_id = $examinationId;
            $examinationQuestion->question_id = $questionId;
            $examinationQuestion->save();
        }
    }
}
