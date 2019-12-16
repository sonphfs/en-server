<?php

namespace App\Http\Controllers\Api\v1;

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
        $examLogDetail = ExaminationLogHelper::getDetailTestResult($id);
         $user= Auth::user();
        $historiesExamlog = ExaminationLog::where('examination_id', $examinationLog->examination_id)
            ->where('user_id', $user->id)
            ->get();
        return $this->response(['exam_result' => $examLogDetail, 'exam_histories' => $historiesExamlog]);
    }
}
