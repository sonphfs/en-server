<?php

namespace App\Http\Controllers\Api\v1\Admin;

use App\Examination;
use App\ExaminationLog;
use App\ExaminationType;
use App\Helpers\QuestionHelper;
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
        $keyword = request()->keyword;
        if(!empty($keyword)) {
            $exams = Examination::with('examination_type')
                ->where('code', 'LIKE', "%{$keyword}%")
                ->orWhere('title', 'LIKE', "%{$keyword}%")
                ->orWhere('description', 'LIKE', "%{$keyword}%")
                ->paginate(self::PER_PAGE);
                return $this->response($exams);
        }
        return $this->response(Examination::with('examination_type')->paginate(self::PER_PAGE));
    }

    public function createOrUpdate(Request $request)
    {
        $requestData = $request->all();
        if(isset($requestData['code'])) {
            $exam = Examination::where('code', $requestData['code'])->first();
        }else {
            $exam = new Examination();
            $exam->code = $this->_generateRandomString();
        }
        try {
            $exam->title = $requestData['title'];
            $exam->audio = $requestData['audio'];
            $exam->description = $requestData['description'];
            $exam->type = $requestData['type'];
            $exam->status = 0;
            $exam->save();
            return $this->response($exam);
        }catch (Exception $e) {
            $this->response('Create new examination has failed!');
        }
    }

    public function show($code)
    {
        return $this->response(Examination::where('code', $code)->first()->load('questions'));
    }

    public function publish(Request $request, $code)
    {
        $status = $request->all()['status'];
        $examination = Examination::where('code', $code)->first();
        $examination->status = $status;
        $result  = $examination->save();
        if($result == true) {
            return $this->response(['updated' => true, 'status' => $status]);
        }
        return $this->response();
    }

    public function updatePart(Request $request)
    {
        $requestData = $request->all();
        $questions = $requestData['questions'];
        $exam = Examination::where('code', $requestData['code'])->first();
        if(!empty($exam)) {
            foreach ($questions as $question) {
                if(isset($question['isParent'])&& $question['isParent']==true ) {
                    $paragraph = QuestionHelper::createOrUpdateParagraph($exam, $question);
                }else{
                    $questionObj = QuestionHelper::createOrUpdateQuestion($question);
                    QuestionHelper::updatePivotData($exam->id, $questionObj->id);
                }
            }
        }
        return $this->response($questions);
    }

    public function getExaminationTypes()
    {
        return $this->response(ExaminationType::where('type', 'TOEIC_TEST')->get());
    }

    public function edit($code)
    {
        return $this->response(Examination::where('code', $code)->first()->load('examination_type'));
    }

    public function getQuestionByPart($code, $part)
    {
        $exam = Examination::where('code', $code)->first();
        $questions = $exam->questions->where('part', $part);
        return $this->response($questions);
    }

    public function update(Request $request, $id)
    {

    }

    public function delete(Request $request)
    {
        try {
            $code = $request->all()['code'];
            $exam = Examination::where('code', $code)->first();
            $exam->delete();
            if($exam->deleted_at != null)
                return $this->response($exam);
        }catch (\Exception $e) {
            return response()->json(['message' => 'Deleted fail!'], 400);

        }
    }
}
