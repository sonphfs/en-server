<?php


namespace App\Helpers;


use App\LearningWord;

class LearningWordHelper
{
    public static function all()
    {
        return LearningWord::all();
    }
}