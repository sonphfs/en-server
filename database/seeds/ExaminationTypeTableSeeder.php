<?php

use Illuminate\Database\Seeder;

class ExaminationTypeTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $examType = \App\ExaminationType::all();
        if(!count($examType)) {
            $this->_createDataSeed();
        }
    }

    private function _createDataSeed()
    {
        $jsonData = json_decode(Storage::get('data/examination_types.json'));
        foreach($jsonData as $item) {
            $examType = new \App\ExaminationType();
            $examType->name = $item->name;
            $examType->type = $item->type;
            $examType->save();
        }
    }
}
