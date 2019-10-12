<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateQuestionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('questions', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('parent_id');
            $table->string('code');
            $table->integer('part')->nullable(true);
            $table->integer('no')->nullable(true);
            $table->string('paragraph',4096)->nullable(true);
            $table->string('content')->nullable(true);
            $table->string('image')->nullable(true);
            $table->string('answer_A')->nullable(true);
            $table->string('answer_B')->nullable(true);
            $table->string('answer_C')->nullable(true);
            $table->string('answer_D')->nullable(true);
            $table->string('correct_answer');
            $table->unsignedInteger('subject_id')->nullable(true);
            $table->unsignedInteger('lesson_id')->nullable(true);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('questions');
    }
}
