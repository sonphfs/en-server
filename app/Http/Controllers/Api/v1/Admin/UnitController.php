<?php

namespace App\Http\Controllers\Api\v1\Admin;

use App\Unit;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class UnitController extends Controller
{
    public function getUnits()
    {
        return $this->response(Unit::paginate(self::PER_PAGE));
    }

    public function create(Request $request)
    {
        $requestData = $request->all();
        $unit = new Unit();
        if ($requestData['parent_id'] == null) {
            $unit->parent_id = 0;
        } else {
            $unit->parent_id = $requestData['parent_id'];
        }
        $unit->name = $requestData['name'];
        $result = $unit->save();
        return $this->response($result);
    }

    public function show($id)
    {
        $unit = Unit::find($id);
        return $this->response($unit);
    }

    public function update(Request $request, $id)
    {
        $unit = Unit::find($id);
        $requestData = $request->all();
        if ($requestData['parent_id'] == null) {
            $unit->parent_id = 0;
        } else {
            $unit->parent_id = $requestData['parent_id'];
        }
        $unit->name = $requestData['name'];
        $result = $unit->update();
        return $this->response($result);
    }

    public function delete($id)
    {
        $result = Unit::find($id)->delete();
        return $this->response($result);
    }
}
