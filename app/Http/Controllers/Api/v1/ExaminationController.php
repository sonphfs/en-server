<?php

namespace App\Http\Controllers\Api\v1;

use App\Examination;
use App\ExaminationLog;
use App\ExaminationType;
use App\Helpers\ExaminationLogHelper;
use App\Mail\ExaminationResult;
use App\Question;
use App\QuestionLog;
use App\ScoreConversion;
use App\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;

class ExaminationController extends Controller
{
    public function getExam($code)
    {
        $exam = Examination::where('code', $code)->first()->load('questions');
        return $this->response($exam);
    }

    public function getList()
    {
        $examinationTypes = ExaminationType::where('type', 'TOEIC_TEST')->get();
        $typeIds = [];
        foreach ($examinationTypes as $examinationType) {
                $typeIds[] = $examinationType->id;
        }
        $examinationList = Examination::where('status', 1)->whereIn('type', $typeIds)->get();
        return $this->response(['examinationList' => $examinationList, 'examinationTypes' => $examinationTypes]);
    }

    public function getExaminations()
    {
        return $this->response(Examination::all());
    }

    public function submitExam(Request $request)
    {
        $exam = new ExaminationLog();
        $requestData = $request->only(['examination_code', 'listening_questions', 'reading_questions']);
        $exammination = Examination::where('code', $requestData['examination_code'])->first();
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
        $user = Auth::user();
        $exam->user_id = $user->id;
        $exam->examination_id = $exammination->id;
        if($exammination->type == self::SHORT_TEST) {
            $exam->total_score = round(($listeningCorrectNum + $readingCorrectNum) / self::SHORT_TEST_QUESTION_NUM, 2);
        }else {
            $exam->total_score = $readingScore+ $listeningScore;
        }
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
//        $examLog = ExaminationLog::where('id', $exam->id)->first()->load('examination','examination.examination_type');
        $examLog = ExaminationLogHelper::getDetailExaminationResult($exam->id);
        Mail::to($user)->send(new ExaminationResult($examLog));
        return $this->response(['Logs' => $responseData, 'examination_log_id' => $exam->id]);
    }

    public function getExaminationHistory($code)
    {
        $exam = Examination::where('code', $code)->first();
        $user = Auth::user();
        $examinationLogs = ExaminationLog::where('examination_id', $exam->id)
            ->where('user_id', $user->id)
            ->get();
        return $this->response(['Logs' => $examinationLogs]);
    }

    public function getToeicExamHistories()
    {
        $user = Auth::user();
        $toeicData = ExaminationLog::where('user_id', $user->id)->paginate(self::PER_PAGE);
        $totalPage = $toeicData->lastPage();
        $toeicExaminationHistories = $toeicData->load('examination', 'examination.examination_type');

        return $this->response(['examHistories'=> $toeicExaminationHistories, 'totalPage' => $totalPage]);
    }

}
