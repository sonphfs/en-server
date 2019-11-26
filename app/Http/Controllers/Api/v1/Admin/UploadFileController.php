<?php

namespace App\Http\Controllers\Api\v1\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use File;

class UploadFileController extends Controller
{
    public function uploadImage(Request $request)
    {
        $type = $request->type;
        $object = $request->object;
        if ($type == self::FILE_IMAGE && $request->has('file')) {
            $file = $request->file('file');
            //Move Uploaded File
            switch ($object) {
                case self::QUESTION_OBJECT:
                    $destinationPath = self::QUESTION_UPLOAD_IMAGES_FOLDER;
                    break;
                case self::LEARNING_WORD_OBJECT:
                    $destinationPath = self::WORD_UPLOAD_IMAGES_FOLDER;
                    break;
                case self::SUBJECT_OBJECT:
                    $destinationPath = self::SUBJECT_UPLOAD_IMAGES_FOLDER;
                    break;
                case self::EXAMINATION_OBJECT:
                    $destinationPath = self::EXAMINATION_UPLOAD_IMAGES_FOLDER;
                    break;
                case self::USER_OBJECT:
                    $destinationPath = self::USER_UPLOAD_IMAGES_FOLDER;
                    break;
                case self::AVATAR_OBJECT:
                    $destinationPath = self::USER_AVATARS_FOLDER;
                    break;
                default:
                    break;
            }
            $result = $file->move($destinationPath, $file->getFileName() . '.' . $file->getClientOriginalExtension());
            $filePath = $result->getPathName();
            return $this->response(['typeFile' => self::FILE_IMAGE, 'filePath' => $filePath]);
        }
        if($type == self::FILE_AUDIO && $request->has('file')) {
            $file = $request->file('file');
            //Move Uploaded File
            switch ($object) {
                case self::QUESTION_OBJECT:
                    $destinationPath = self::QUESTION_UPLOAD_AUDIOS_FOLDER;
                    break;
                case self::LEARNING_WORD_OBJECT:
                    $destinationPath = self::WORD_UPLOAD_AUDIOS_FOLDER;
                    break;
                case self::EXAMINATION_OBJECT:
                    $destinationPath = self::EXAMINATION_UPLOAD_AUDIOS_FOLDER;
                    break;
                default:
                    break;
            }
            $result = $file->move($destinationPath, $file->getFileName() . '.' . $file->getClientOriginalExtension());
            $filePath = $result->getPathName();
            return $this->response(['typeFile' => self::FILE_AUDIO, 'filePath' => $filePath]);
        }
    }

    public function deleteFile(Request $request)
    {
        $filePath = $request->filePath;
        $requestData = $request->all();
        if (File::exists($filePath)) {
            unlink($filePath);
        }
    }
}
