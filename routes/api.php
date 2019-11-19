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
        Route::get('mail', function (){
            return view('mails.toeic_result');
        });
        Route::get('get-exam/{code}', 'ExaminationController@getExam');
        Route::get('get-list-exam', 'ExaminationController@getList');
        Route::post('send-contact', 'ContactController@send');
        Route::get('send', 'ContactController@sendMail');
        Route::post('signup', 'AuthController@register');
        Route::post('login', 'AuthController@login');
        Route::get('exam-log', 'ExaminationController@getExaminationHistory');
        Route::get('examination-result/{id}', 'ExaminationLogController@getExaminationResult');
        //subject
        Route::get('/subjects', 'SubjectController@getSubjects');
        Route::get('/list-word/{id}', 'LearningWordController@getLearingWords');
        Route::group(['middleware' => 'jwt.auth'], function () {

            //user
            Route::get('/user/infos', 'AuthController@user');
            Route::post('/user/update-profile', 'UserController@updateProfile');
            Route::post('/user/change-password', 'UserController@changePassword');
            Route::post('logout', 'AuthController@logout');

            //examination
            Route::post('submit-examination', 'ExaminationController@submitExam');

            Route::prefix('backend')->middleware(['isAdmin'])->namespace('Admin')->group(function() {
                Route::prefix('/users')->group(function(){
                    Route::get('/list', 'UserController@getUsers');
                    Route::get('/create', 'UserController@create');
                    Route::get('/show/{id}', 'UserController@show');
                    Route::get('/update/{id}', 'UserController@update');
                    Route::get('/delete/{id}', 'UserController@delete');
                });
                Route::prefix('examinations')->group(function(){
                    Route::get('/list', 'ExaminationController@getExaminations');
                    Route::post('/create', 'ExaminationController@create');
                    Route::get('/show/{code}', 'ExaminationController@show');
                    Route::post('/update/{code}', 'ExaminationController@update');
                    Route::get('/delete/{code}', 'ExaminationController@delete');
                    Route::post('/publish/{code}', 'ExaminationController@publish');
                    Route::get('/examination-types', 'ExaminationController@getExaminationTypes');
                    Route::get('/questions/{code}/{part}', 'ExaminationController@getQuestionByPart');
                    Route::post('/update-part', 'ExaminationController@updatePart');

                });
                Route::prefix('lessons')->group(function(){
                    Route::get('/list', 'LessonController@getLessons');
                    Route::post('/create', 'LessonController@create');
                    Route::get('/show/{id}', 'LessonController@show');
                    Route::post('/update/{id}', 'LessonController@update');
                    Route::get('/delete/{id}', 'LessonController@delete');
                });
                Route::prefix('units')->group(function(){
                    Route::get('/list', 'UnitController@getUnits');
                    Route::post('/create', 'UnitController@create');
                    Route::get('/show/{id}', 'UnitController@show');
                    Route::post('/update/{id}', 'UnitController@update');
                    Route::get('/delete/{id}', 'UnitController@delete');
                });
                Route::prefix('/learning_words')->group(function(){
                    Route::get('/list', 'LearningWordController@getAllLearningWords');
                    Route::post('/create', 'LearningWordController@create');
                    Route::get('/show/{id}', 'LearningWordController@show');
                    Route::post('/update/{id}', 'LearningWordController@update');
                    Route::post('/delete/{id}', 'LearningWordController@delete');
                });
            });
        });
        Route::middleware('jwt.refresh')->get('/token/refresh', 'AuthController@refresh');
    });
});
