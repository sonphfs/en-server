<?php

namespace App\Http\Controllers\Api\v1\Admin;

use App\Subject;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Helpers\FileHelper;

class SubjectController extends Controller
{
    public function getAll(){
        return $this->response(Subject::all());
    }

    public function getSubjects()
    {
        $keyword = \request()->keyword;
        if(!empty($keyword)) {
            $subjects = Subject::where('name', 'LIKE', "%{$keyword}%")->orderBy('id', 'desc')->paginate(self::PER_PAGE);
            return $this->response($subjects);
        }
        return $this->response(Subject::paginate(self::PER_PAGE));
    }

    public function createOrUpdate(Request $request)
    {
        $requestData = $request->all();
        if(isset($request->id)) {
            $subject = Subject::find($request->id);
        }else{
            $subject = new Subject();
        }
        try {
            $subject->name = $requestData['name'];
            $subject->image = $requestData['image'];
            $result = $subject->save();
        } catch (\Exception $e) {
        }
        return $this->response($result);

    }

    public function show($id)
    {
        return $this->response(Subject::findOrFail($id));
    }

    public function update(Request $request, $id)
    {
        $requestData = $request->all();
        try {
            $subject = Subject::findOrFail($id);
            $subject->name = $requestData['name'];
            if ($request->hasFile('image')) {
                $file = $request->file('image');
                //Move Uploaded File
                $destinationPath = 'uploads/subjects';
                $result = $file->move($destinationPath, $file->getFileName() . '.' . $file->getClientOriginalExtension());
                $subject->image = $result->getPathName();
            }
            $result = $subject->save();
        } catch (\Exception $e) {
            return $this->response('Update subject failed!', 422);
        }
        return $this->response($result);
    }

    public function delete(Request $request)
    {
        $id = $request->all()['id'];
        $subject = Subject::find($id);
        if(!empty($subject->image)) {
            FileHelper::deleteFile($subject->image);
        }
        $subject->delete();
        return $this->response($subject);
    }
}
