<?php


namespace App\Helpers;


use App\Examination;

class ExaminationHelper
{
    public static function all()
    {
        return Examination::all();
    }
}