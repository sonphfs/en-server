<?php

namespace App\Http\Controllers\Api\v1;

use App\Examination;
use App\ExaminationLog;
use App\Question;
use App\QuestionLog;
use App\ScoreConversion;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class ExaminationController extends Controller
{
    public function getExam($code)
    {
        $exam = Examination::where('code', $code)->first()->load('questions');
        return $this->response($exam);
    }

    public function getExaminations()
    {
        return $this->response(Examination::all());
    }

    public function submitExam(Request $request)
    {
        $exam = new ExaminationLog();
        $requestData = $request->only(['examination_id', 'listening_questions', 'reading_questions']);
        $responseData = [];
        $readingCorrectNum = 0;
        $listeningCorrectNum = 0;
        $listeningQuestionIds = [];
        foreach ($requestData['listening_questions'] as $question) {
            $listeningQuestionIds[] = $question['question_id'];
        }
        $readingQuestionIds = [];
        foreach ($requestData['reading_questions'] as $question) {
            $readingQuestionIds[] = $question['question_id'];
        }

        $questionIds = array_merge($listeningQuestionIds, $readingQuestionIds);
        $questionData = Question::whereIn('id', $questionIds)->get(['id', 'correct_answer']);
        foreach ($questionData as $item) {
            foreach ($requestData['listening_questions'] as $question) {
                if($question['question_id'] == $item->id && $question['choose'] == $item->correct_answer) {
                    $listeningCorrectNum ++;
                }
            }
            foreach ($requestData['reading_questions'] as $question) {
                if($question['question_id'] == $item->id && $question['choose'] == $item->correct_answer) {
                    $readingCorrectNum ++;
                }
            }
        }
        $readingScore = ScoreConversion::where('num', $readingCorrectNum)->first()['reading_score'];
        $listeningScore = ScoreConversion::where('num', $listeningCorrectNum)->first()['listening_score'];
        $exam->user_id = Auth::user()->id;
        $exam->examination_id = 1;
        $exam->total_score = $readingScore + $listeningScore;
        $exam->save();
        $responseData['examination_log'][] = $exam;
        $requestData['questions'] = array_merge($requestData['listening_questions'], $requestData['reading_questions']);
        foreach($requestData['questions'] as $question) {
            $questionLog =  new QuestionLog();
            $questionLog->examination_log_id = $exam->id;
            $questionLog->question_id = $question['question_id'];
            $questionLog->choosen_answer = $question['choose'];
            $questionLog->save();
            $responseData['question_logs'][] = $questionLog;
        }
        return $this->response(['Logs' => $responseData, 'examination_log_id' => $exam->id]);
    }

    public function getExaminationHistory()
    {
        $examinationLogs = ExaminationLog::where('examination_id', 1)->get();
        return $this->response(['Logs' => $examinationLogs]);
    }

}
