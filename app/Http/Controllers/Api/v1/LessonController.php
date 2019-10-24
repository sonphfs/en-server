<?php

namespace App\Http\Controllers\Api\v1;

use App\Lesson;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class LessonController extends Controller
{


    public function getLessons()
    {
        return $this->response(Lesson::all());
    }

    public function create(Request $request)
    {
        $requestData = $request->all();
        $lesson = new Lesson();
        try{
            $lesson->unit_id = $requestData['unit_id'];
            $lesson->title = $requestData['title'];
            if($request->hasFile('image')){
                $file = $request->file('image');
                //Move Uploaded File
                $destinationPath = 'uploads/lessons';
                $result = $file->move($destinationPath,$file->getFileName().'.'.$file->getClientOriginalExtension());
                $lesson->image = $result->getPathName();
            }
            $lesson->save();
        } catch (\Exception $e) {
            return $this->response('Create lesson failed!', 422);
        }
        return $this->response($requestData);
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
