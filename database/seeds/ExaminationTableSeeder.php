<?php

use App\ExaminationQuestion;
use App\Question;
use App\Examination;
use Illuminate\Database\Seeder;

class ExaminationTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $examinations = Examination::all();
        if(!count($examinations)) {
            $this->_createDataSeed();
        }
    }

    private function _createDataSeed() {
        $jsonData = json_decode(Storage::get('/data/examinations.json'));
        foreach ($jsonData as $item) {
            $exam = new Examination();
            $exam->code = $this->_generateRandomString(8);
            $exam->title = $item->title;
            $exam->type = $item->type;
            $exam->description = $item->description;
            $exam->audio = $item->audio;
            $exam->save();
            foreach ($item->questions as $question) {
                $newQuestion = new Question();
                $newQuestion->part = $question->part;
                $newQuestion->code = $this->_generateRandomString(8);
                $newQuestion->no = $question->no;
                $newQuestion->content = $question->content;
                $newQuestion->image = $question->image;
                $newQuestion->data = $question->data;
                $newQuestion->save();
                $examinationQuestion = new ExaminationQuestion();
                $examinationQuestion->examination_id = $exam->id;
                $examinationQuestion->question_id = $newQuestion->id;
                $examinationQuestion->save();
            }
        }
    }

    private function _generateRandomString(int $length = 8)
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
