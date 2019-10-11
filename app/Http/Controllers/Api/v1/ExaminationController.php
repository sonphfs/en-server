<?php

namespace App\Http\Controllers\Api\v1;

use App\Examination;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ExaminationController extends Controller
{
    public function getExam()
    {
        return Examination::find(1)->load('questions');
    }
}
