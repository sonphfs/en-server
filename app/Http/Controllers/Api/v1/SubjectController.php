<?php

namespace App\Http\Controllers\Api\v1;

use App\Subject;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class SubjectController extends Controller
{
    public function getSubjects()
    {
        $perPage = 9;
        return $this->response(Subject::paginate($perPage));
    }

}
