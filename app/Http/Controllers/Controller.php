<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    const PER_PAGE = 10;

    const SHORT_TEST_QUESTION_NUM = 20;

    const SHORT_TEST = 1;
    const FULL_TEST = 2;
    const FULL_TEST_NEW_FORMAT = 3;

    const USER_AVATARS_FOLDER = 'enc/uploads/users/avatars/';
    const USER_UPLOAD_IMAGES_FOLDER = 'enc/uploads/users/images/';
    const USER_DEFAULT_AVATAR = 'enc/uploads/users/avatars/default-userAvatar.png';

    const FILE_AUDIO = 'AUDIO';
    const FILE_IMAGE = 'IMAGE';

    const EXAMINATION_UPLOAD_IMAGES_FOLDER = 'enc/uploads/examinations/images/';
    const EXAMINATION_UPLOAD_AUDIOS_FOLDER = 'enc/uploads/examinations/audios/';

    const QUESTION_UPLOAD_IMAGES_FOLDER = 'enc/uploads/questions/images/';
    const QUESTION_UPLOAD_AUDIOS_FOLDER = 'enc/uploads/questions/audios/';

    const WORD_UPLOAD_IMAGES_FOLDER = 'enc/uploads/words/images/';
    const WORD_UPLOAD_AUDIOS_FOLDER = 'enc/uploads/words/audios/';

    const SUBJECT_UPLOAD_IMAGES_FOLDER = 'enc/uploads/subjects/images/';

    const QUESTION_OBJECT = 'QUESTION';
    const EXAMINATION_OBJECT = 'EXAMINATION';
    const LEARNING_WORD_OBJECT = 'LEARNING_WORD';
    const SUBJECT_OBJECT = 'SUBJECT';
    const USER_OBJECT = 'USER';
    const AVATAR_OBJECT = 'USER_AVATAR';

    protected function response($data = [], $status = 200, $messages = '')
    {
        return response()->json([
            'result_data' => $data,
            'status' => $status,
            'messages' => $messages
        ]);
    }

    protected function _generateRandomString(int $length = 8)
    {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }
}
