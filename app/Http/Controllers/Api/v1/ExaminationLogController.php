<?php

namespace App\Http\Controllers\Api\v1;

use App\ExaminationLog;
use App\Helpers\ExaminationLogHelper;
use App\ScoreConversion;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ExaminationLogController extends Controller
{
    public function getExaminationResult($id)
    {
        $examinationResult = ExaminationLogHelper::getDetailExaminationResult($id);
        return $this->response($examinationResult);
    }
}
