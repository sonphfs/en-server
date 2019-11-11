<?php

namespace App\Http\Controllers\Api\v1\Admin;

use App\Subject;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class SubjectController extends Controller
{
    public function getSubjects()
    {
        return $this->response(Subject::all());
    }

    public function create(Request $request)
    {
        $requestData = $request->all();
        try {
            $subject = new Subject();
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
            return $this->response('Create subject failed!', 422);
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

    public function delete($id)
    {
        $result = Subject::find($id)->delete();
        return $this->response($result);
    }
}
