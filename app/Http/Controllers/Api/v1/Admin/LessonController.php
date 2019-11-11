<?php

namespace App\Http\Controllers\Api\v1\Admin;

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
        return $this->response(Lesson::findOrFail($id));
    }

    public function update(Request $request, $id)
    {
        $requestData = $request->all();
        try{
            $lesson = Lesson::findOrFail($id);
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
            return $this->response('Update lesson failed!', 422);
        }
        return $this->response($requestData);
    }

    public function delete($id)
    {
        $result = Lesson::findOrFail($id);
        return $this->response($result);
    }
}
