<?php

use Illuminate\Database\Seeder;

class QuestionTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->_createDataSeed();
    }

    private function _createDataSeed()
    {
        $jsonData = json_decode(Storage::get('data/questions.json'));
        foreach ($jsonData as $key => $item) {
            $this->_createQuestionDataSeed($key, $item, 'word');
            $this->_createQuestionDataSeed($key, $item, 'lesson');
        }
    }

    private function _createQuestionDataSeed($key, $question, $type = 'word')
    {
        $newQuestion = new \App\Question();
        if($type == 'word') {
            $newQuestion->word_id = $key;
        }
        if($type == 'lesson') {
            $newQuestion->lesson_id = $key;
        }
        $newQuestion->code = $this->_generateRandomString();
        $newQuestion->content = $question->content;
        $newQuestion->answer_A = $question->answer_A;
        $newQuestion->answer_B = $question->answer_B;
        $newQuestion->answer_C = $question->answer_C;
        $newQuestion->answer_D = $question->answer_D;
        $newQuestion->correct_answer = $question->correct_answer;
        $newQuestion->image = $question->image;
        $newQuestion->save();


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
