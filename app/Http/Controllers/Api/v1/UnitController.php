<?php

namespace App\Http\Controllers\Api\v1;

use App\Unit;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class UnitController extends Controller
{
    public function getUnits()
    {
        return $this->response(Unit::all());
    }
}
