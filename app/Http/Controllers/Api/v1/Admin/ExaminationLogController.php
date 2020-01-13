<?php

namespace App\Http\Controllers\Api\v1\Admin;

use App\ExaminationLog;
use App\ScoreConversion;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ExaminationLogController extends Controller
{
    public function histories()
    {
        $histories = ExaminationLog::with('user', 'examination', 'examination.examination_type', 'examination.subject')->paginate(self::PER_PAGE);
        return $this->response($histories);
    }
}
