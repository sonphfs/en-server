<?php

namespace App\Http\Controllers\Api\v1;

use App\LearningWord;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use phpDocumentor\Reflection\DocBlock\Tags\Reference\Url;

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

    public function delete($id)
    {
        $result = LearningWord::find($id)->delete();
        return $this->response($result);
    }
}
