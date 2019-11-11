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
use Exception;
use Illuminate\Support\Facades\Storage;

class ExaminationController extends Controller
{

    public function getExaminations()
    {
        return $this->response(Examination::all());
    }

    public function create(Request $request)
    {
        $exam = new Examination();
        $requestData = $request->all();
        if ($request->file('audio')) {
            $file = $request->file('audio');
            $name = time() . $file->getClientOriginalName();
            $filePath = 'images/examinations/' . $name;
            Storage::disk('s3')->put($filePath, file_get_contents($file));
            $exam->audio = $filePath;
        }
        try {
            $exam->title = $requestData['title'];
            $exam->description = $requestData['description'];
            $exam->type = $requestData['type'];
            $exam->code = $this->_generateRandomString();
            $exam->save();
            return $this->response($exam);
        }catch (Exception $e) {
            $this->response('Create new examination has failed!');
        }
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
