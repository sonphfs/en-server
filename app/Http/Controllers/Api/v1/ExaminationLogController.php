<?php

namespace App\Http\Controllers\Api\v1;

use App\Examination;
use App\ExaminationLog;
use App\Helpers\ExaminationLogHelper;
use App\ScoreConversion;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class ExaminationLogController extends Controller
{
    public function getExaminationResult($id)
    {
        $examinationResult = ExaminationLogHelper::getDetailExaminationResult($id);
        return $this->response($examinationResult);
    }

    public function getTestResult($id)
    {
        $examinationLog = ExaminationLog::find($id);
        $user = Auth::user();
        $exam = Examination::find($examinationLog->examination_id);
        $examLogDetail = ExaminationLogHelper::getDetailTestResult($id);

        if ($exam->subject_id) {
            $examIds = Examination::where('subject_id', $exam->subject_id)->get()->pluck('id')->toArray();
            $historiesExamlog = ExaminationLog::whereIn('examination_id', $examIds)
                ->where('user_id', $user->id)
                ->get();
            return $this->response(['exam_result' => $examLogDetail, 'exam_histories' => $historiesExamlog]);
        }else{
            $examLogDetail = ExaminationLogHelper::getDetailTestResult($id);
            $historiesExamlog = ExaminationLog::where('examination_id', $examinationLog->examination_id)
                ->where('user_id', $user->id)
                ->get();
            return $this->response(['exam_result' => $examLogDetail, 'exam_histories' => $historiesExamlog]);
        }

    }

    public function getScore($id)
    {
        $examinationLog = ExaminationLog::find($id);
        return $this->response($examinationLog);
    }
}
