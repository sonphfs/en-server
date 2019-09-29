<?php

use Illuminate\Database\Seeder;
use App\Subject;

class SubjectsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $jsonData = json_decode(Storage::get('data/subjects.json'));
        foreach($jsonData as $item) {
            $subject = new Subject();
            $subject->name = $item->name;
            $subject->save();
        }
    }
}
