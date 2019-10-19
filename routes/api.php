<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::prefix('v1')->middleware(['cors'])->group(function() {
    Route::namespace('Api\v1')->group(function (){
        Route::get('check', function (){
            return '{"status" : "OK!"}';
        });
        Route::get('get-exam/{code}', 'ExaminationController@getExam');
        Route::post('send-contact', 'ContactController@send');
        Route::post('signup', 'AuthController@register');
        Route::post('login', 'AuthController@login');
        Route::get('exam-log', 'ExaminationController@getExaminationHistory');
        Route::group(['middleware' => 'jwt.auth'], function () {
            Route::post('submit-examination', 'ExaminationController@submitExam');
            Route::get('auth', 'AuthController@user');
            Route::post('/user/update-profile', 'UserController@updateProfile');
            Route::post('/user/change-password', 'UserController@changePassword');
            Route::get('examination-result/{id}', 'ExaminationLogController@getExaminationResult');
            Route::post('logout', 'AuthController@logout');
        });
        Route::middleware('jwt.refresh')->get('/token/refresh', 'AuthController@refresh');
    });
});
