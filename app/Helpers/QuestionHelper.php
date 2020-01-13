<?php


namespace App\Helpers;


use App\ExaminationQuestion;
use App\Question;

class QuestionHelper
{

    public static function createOrUpdateQuestion($question, $paragraphObj =null)
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
        if(isset($paragraphObj->id) && !isset($question['parent_id'])) {
            $questionObj->parent_id = $paragraphObj->id;
            $questionObj->part = $paragraphObj->part;
        }else{
            $questionObj->part = $question['part'];
        }
        $questionObj->image = $question['image'];
        $questionObj->content = $question['content'];
        $questionObj->audio = $question['audio'];
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
        $examinationQuestion = ExaminationQuestion::where('examination_id', $examinationId)
            ->where('question_id', $questionId)
            ->first();
        if($examinationQuestion == null) {
            $examinationQuestion = new ExaminationQuestion();
            $examinationQuestion->examination_id = $examinationId;
            $examinationQuestion->question_id = $questionId;
            $examinationQuestion->save();
        }
    }

    public static function createOrUpdateParagraph($exam, $question)
    {
        $newParagraph = new Question();
        if(isset($question['id'])) {
            $newParagraph = Question::find($question['id']);
        }
        if(isset($question['code'])) {
            $newParagraph->code = $question['code'];
        }else {
            $newParagraph->code = CommonHelper::generateRandomString();
        }
        $newParagraph->part = $question['part'];
        $newParagraph->content = $question['content'];
        $newParagraph->paragraph = $question['paragraph'];
        $newParagraph->save();
        QuestionHelper::updatePivotData($exam->id, $newParagraph->id);
        if(!empty($question['questions'])) {
            foreach ($question['questions'] as $item) {
                $questionObj = self::createOrUpdateQuestion($item, $newParagraph);
                QuestionHelper::updatePivotData($exam->id, $questionObj->id);
            }
        }
    }
}
