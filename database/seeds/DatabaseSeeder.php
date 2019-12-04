<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->call(UsersTableSeeder::class);
        $this->call(SubjectsTableSeeder::class);
        $this->call(LearningWordsTableSeeder::class);
        $this->call(ExaminationTableSeeder::class);
        $this->call(ScoreConversionTableSeeder::class);
        $this->call(ExaminationTypeTableSeeder::class);
//        $this->call(QuestionTableSeeder::class);
    }
}
