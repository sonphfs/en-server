<?php

namespace App\Http\Controllers\Api\v1;

use App\Examination;
use App\ExaminationQuestion;
use App\LearningWord;
use App\Question;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class LearningWordController extends Controller
{
    public function getLearingWords($subjectId)
    {
        return $this->response(LearningWord::where('subject_id', $subjectId)->get());
    }

    public function getAllLearningWords()
    {
        return $this->response(LearningWord::all());
    }

    public function create(Request $request)
    {
        $requestData = $request->all();
        $learningWord = new LearningWord();
        try {
            $learningWord->subject_id = $requestData['subject_id'];
            $learningWord->word = $requestData['word'];
            $learningWord->type = $requestData['type'];
            $learningWord->meaning = $requestData['meaning'];
            $learningWord->pronunciation = $requestData['pronunciation'];
            $learningWord->example = $requestData['example'];
            if ($request->file('image')) {
                $file = $request->file('image');
                //Move Uploaded File
                $destinationPath = 'uploads/learning_words/images';
                $result = $file->move($destinationPath, $file->getFileName() . '.' . $file->getClientOriginalExtension());
                $learningWord->image = $result->getPathName();
            }
            if ($request->file('audio')) {
                $file = $request->file('audio');
                //Move Uploaded File
                $destinationPath = 'uploads/learning_words/audios';
                $result = $file->move($destinationPath, $file->getFileName() . '.' . $file->getClientOriginalExtension());
                $learningWord->audio = $result->getPathName();
            }
            $result = $learningWord->save();
        } catch (\Exception $e) {
            return $this->response('Create Learning word failed!', 422);
        }
        return $this->response($result);
    }

    public function show($id)
    {
        return $this->response(LearningWord::findOrFail($id));
    }

    public function update(Request $request, $id)
    {
        $requestData = $request->all();
        $learningWord = LearningWord::findOrFail($id);
        try {
            $learningWord->subject_id = $requestData['subject_id'];
            $learningWord->word = $requestData['word'];
            $learningWord->type = $requestData['type'];
            $learningWord->meaning = $requestData['meaning'];
            $learningWord->pronunciation = $requestData['pronunciation'];
            $learningWord->example = $requestData['example'];
            if ($request->file('image')) {
                $file = $request->file('image');
                //Move Uploaded File
                $destinationPath = 'uploads/learning_words/images';
                $result = $file->move($destinationPath, $file->getFileName() . '.' . $file->getClientOriginalExtension());
                $learningWord->image = $result->getPathName();
            }
            if ($request->file('audio')) {
                $file = $request->file('audio');
                //Move Uploaded File
                $destinationPath = 'uploads/learning_words/audio';
                $result = $file->move($destinationPath, $file->getFileName() . '.' . $file->getClientOriginalExtension());
                $learningWord->audio = $result->getPathName();
            }
            $result = $learningWord->save();
        } catch (\Exception $e) {
            return $this->response('Create Learning word failed!', 422);
        }
        return $this->response($result);
    }

    public function test($subjectId)
    {
        try{
            $wordId = LearningWord::where('subject_id', 1)->get('id');
            $questions = Question::whereIn('word_id', $wordId)->distinct('word_id')->limit(5)->get();
            $exam = $this->_createExamination($questions, $subjectId);
            return $this->response($exam->load('questions'));
        }catch (\Exception $e){

        }
    }

    public function delete($id)
    {
        $result = LearningWord::find($id)->delete();
        return $this->response($result);
    }


    private function _createExamination($questions, $subject_id)
    {
        $exam = new Examination();
        $exam->user_id = Auth::user()->id;
        $exam->code = $this->_generateRandomString();
        $exam->title = 'TEST VOCABUNARY';
        $exam->type = 5;
        $exam->description = 'TEST VOCABUNARY';
        $exam->subject_id = $subject_id;
        $exam->status = 1;
        $exam->save();
        foreach ($questions as $question) {
            $examinationQuestion = new ExaminationQuestion();
            $examinationQuestion->examination_id = $exam->id;
            $examinationQuestion->question_id = $question->id;
            $examinationQuestion->save();
        }
        return $exam;
    }

    public function random()
    {
        return $this->response(LearningWord::all()->random(30));
    }
}
