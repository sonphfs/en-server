<?php

namespace App\Http\Controllers\Api\v1;

use App\ExaminationLog;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ExaminationLogController extends Controller
{
    public function getExaminationResult($id)
    {
        $examinationLog = ExaminationLog::find($id)->load('questions');
        return $this->response($examinationLog);
    }
}
