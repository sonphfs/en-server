<?php


namespace App\Helpers;


class QuestionHelper
{

    public static function createQuestion($question)
    {
        $newQuestion = new Question();
        $newQuestion->no = $question['no'];
        $newQuestion->answer_A = $question['answer_A'];
        $newQuestion->answer_B = $question['answer_B'];
        $newQuestion->answer_C = $question['answer_C'];
        $newQuestion->answer_D = $question['answer_D'];

    }

    public static function updateQuestion($question)
    {

    }
}