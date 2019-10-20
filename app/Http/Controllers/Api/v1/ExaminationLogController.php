<?php

namespace App\Http\Controllers\Api\v1;

use App\ExaminationLog;
use App\ScoreConversion;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ExaminationLogController extends Controller
{
    public function getExaminationResult($id)
    {
        $examinationLog = ExaminationLog::find($id)->load('questions');
        $questionLogs = $examinationLog->questions;
        $correctAnswerCount = [];
        $correctAnswerCount['part_1'] = 0;
        $correctAnswerCount['part_2'] = 0;
        $correctAnswerCount['part_3'] = 0;
        $correctAnswerCount['part_4'] = 0;
        $correctAnswerCount['part_5'] = 0;
        $correctAnswerCount['part_6'] = 0;
        $correctAnswerCount['part_7'] = 0;
        $notSelected = 0;
        foreach ($questionLogs as $question) {
            $choosen_answer = $question->pivot->choosen_answer;
            if ($choosen_answer == null) {
                $notSelected++;
            }
            if ($question->correct_answer == $choosen_answer) {
                switch ($question->part) {
                    case 1:
                        $correctAnswerCount['part_1']++;
                        break;
                    case 2:
                        $correctAnswerCount['part_2']++;
                        break;
                    case 3:
                        $correctAnswerCount['part_3']++;
                        break;
                    case 4:
                        $correctAnswerCount['part_4']++;
                        break;
                    case 5:
                        $correctAnswerCount['part_5']++;
                        break;
                    case 6:
                        $correctAnswerCount['part_6']++;
                        break;
                    case 7:
                        $correctAnswerCount['part_7']++;
                        break;

                }
            }
        }
        $readingCorrectAnswer = $correctAnswerCount['part_5'] + $correctAnswerCount['part_6'] + $correctAnswerCount['part_7'];
        $listeningCorrectAnswer = $correctAnswerCount['part_1'] + $correctAnswerCount['part_2'] + $correctAnswerCount['part_3'] + $correctAnswerCount['part_4'];
        $listeningScore = ScoreConversion::where('num', $listeningCorrectAnswer)->get('listening_score')->first()->listening_score;
        $readingScore = ScoreConversion::where('num', $readingCorrectAnswer)->get('reading_score')->first()->reading_score;
        $examinationResult = [
            'correct_answer_count' => $correctAnswerCount,
            'reading_score' => $readingScore,
            'listening_score' => $listeningScore,
            'not_selected' => $notSelected
        ];
        return $this->response($examinationResult);
    }
}
