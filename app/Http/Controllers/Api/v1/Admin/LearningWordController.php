<?php

namespace App\Http\Controllers\Api\v1\Admin;

use App\LearningWord;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use phpDocumentor\Reflection\DocBlock\Tags\Reference\Url;
use App\Helpers\FileHelper;

class LearningWordController extends Controller
{

    public function getLearningWords()
    {
        $keyword = request()->keyword;
        if(!empty($keyword)) {
            $learning_words = LearningWord::where('word', 'LIKE', "%{$keyword}%")
                ->orWhere('type', 'LIKE', "%{$keyword}%")
                ->orWhere('pronunciation', 'LIKE', "%{$keyword}%")
                ->orWhere('meaning', 'LIKE', "%{$keyword}%")
                ->orWhere('example', 'LIKE', "%{$keyword}%")
                ->paginate(self::PER_PAGE);
            return $this->response($learning_words);
        }
        return $this->response(LearningWord::paginate(self::PER_PAGE));
    }

    public function createOrUpdate(Request $request)
    {
        $requestData = $request->all();
        if(isset($requestData['id'])) {
            $learningWord = LearningWord::find($requestData['id']);
        }else {
            $learningWord = new LearningWord();
        }
        try {
            $learningWord->subject_id = $requestData['subject_id'];
            $learningWord->word = $requestData['word'];
            $learningWord->type = $requestData['type'];
            $learningWord->meaning = $requestData['meaning'];
            $learningWord->pronunciation = $requestData['pronunciation'];
            $learningWord->example = $requestData['example'];
            $learningWord->image = $requestData['image'];
            $learningWord->audio = $requestData['audio'];
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

    public function delete(Request $request)
    {
        $id = $request->all()['id'];
        $learningWord = LearningWord::find($id);
        if(!empty($learningWord->image)) {
            FileHelper::deleteFile($learningWord->image);
        }
        if(!empty($learningWord->audio)) {
            FileHelper::deleteFile($learningWord->audio);
        }
        $learningWord->delete();
        return $this->response($learningWord);
    }
}
