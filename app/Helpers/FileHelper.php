<?php


namespace App\Helpers;
use File;

class FileHelper
{
    public static function deleteFile($filePath)
    {
        if (File::exists($filePath)) {
            unlink($filePath);
        }
    }

}
