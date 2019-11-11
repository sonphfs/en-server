<?php

namespace App\Http\Controllers\Api\v1\Admin;

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

    public function getExaminations()
    {
        return $this->response(Examination::all());
    }

    public function create()
    {

    }

    public function show($id)
    {

    }

    public function update(Request $request, $id)
    {

    }

    public function delete($id)
    {

    }
}
