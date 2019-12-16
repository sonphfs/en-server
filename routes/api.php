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
            Route::get('test/{subjectId}', 'LearningWordController@test');

            //examination
            Route::post('submit-examination', 'ExaminationController@submitExam');
            Route::get('examination/toeic-exam-histories', 'ExaminationController@getToeicExamHistories');
            Route::get('exam-log/{id}', 'ExaminationController@getExaminationHistory');
            Route::get('test-log/{id}', 'ExaminationLogController@getTestResult');
            Route::get('exam/get-total-score/{id}', 'ExaminationLogController@getScore');

            Route::get('learning-word/random', 'LearningWordController@random');

            Route::prefix('backend')->middleware(['isAdmin'])->namespace('Admin')->group(function() {
                Route::prefix('/users')->group(function(){
                    Route::get('/list', 'UserController@getUsers');
                    Route::post('/create', 'UserController@create');
                    Route::get('/show/{id}', 'UserController@show');
                    Route::post('/update/{id}', 'UserController@update');
                    Route::post('/delete', 'UserController@delete');
                });
                Route::prefix('examinations')->group(function(){
                    Route::get('/list', 'ExaminationController@getExaminations');
                    Route::post('/create-or-update', 'ExaminationController@createOrUpdate');
                    Route::get('/show/{code}', 'ExaminationController@show');
                    Route::post('/update/{code}', 'ExaminationController@update');
                    Route::post('/delete', 'ExaminationController@delete');
                    Route::post('/publish/{code}', 'ExaminationController@publish');
                    Route::get('/examination-types', 'ExaminationController@getExaminationTypes');
                    Route::get('/questions/{code}/{part}', 'ExaminationController@getQuestionByPart');
                    Route::post('/update-part', 'ExaminationController@updatePart');

                });
                Route::prefix('score')->group(function(){
                    Route::get('/score-table', 'ScoreController@getScoreTable');
                    Route::post('/import', 'ScoreController@importCsv');
                    Route::get('/export', 'ScoreController@exportCsv');
                });
                Route::prefix('lessons')->group(function(){
                    Route::get('/list', 'LessonController@getLessons');
                    Route::get('/list-by-unit-id/{unitId}', 'LessonController@getListByUnitId');
                    Route::post('/create', 'LessonController@create');
                    Route::get('/show/{id}', 'LessonController@show');
                    Route::post('/update/{id}', 'LessonController@update');
                    Route::post('/delete', 'LessonController@delete');
                });
                Route::prefix('units')->group(function(){
                    Route::get('/all', 'UnitController@getAll');
                    Route::get('/list', 'UnitController@getUnits');
                    Route::post('/create', 'UnitController@create');
                    Route::get('/show/{id}', 'UnitController@show');
                    Route::post('/update/{id}', 'UnitController@update');
                    Route::post('/delete', 'UnitController@delete');
                });
                Route::prefix('/learning_words')->group(function(){
                    Route::get('/list', 'LearningWordController@getLearningWords');
                    Route::get('/list-by-subject-id/{subjectId}', 'LearningWordController@getListBySubjectId');
                    Route::post('/create-or-update', 'LearningWordController@createOrUpdate');
                    Route::get('/show/{id}', 'LearningWordController@show');
                    Route::post('/update/{id}', 'LearningWordController@update');
                    Route::post('/delete', 'LearningWordController@delete');
                });
                Route::prefix('/subjects')->group(function(){
                    Route::get('/all', 'SubjectController@getAll');
                    Route::get('/list', 'SubjectController@getSubjects');
                    Route::post('/create-or-update', 'SubjectController@createOrUpdate');
                    Route::get('/show/{id}', 'SubjectController@show');
                    Route::post('/update/{id}', 'SubjectController@update');
                    Route::post('/delete', 'SubjectController@delete');
                });
                Route::prefix('/questions')->group(function(){
                    Route::get('/list', 'QuestionController@getQuestions');
                    Route::post('/create-or-update', 'QuestionController@createOrUpdate');
                    Route::get('/show/{id}', 'QuestionController@show');
                    Route::post('/update/{id}', 'QuestionController@update');
                    Route::post('/delete', 'QuestionController@delete');
                });
                Route::post('/files/upload', 'UploadFileController@uploadImage');
                Route::post('/files/delete', 'UploadFileController@deleteFile');
            });
        });
        Route::middleware('jwt.refresh')->get('/token/refresh', 'AuthController@refresh');
    });
});
