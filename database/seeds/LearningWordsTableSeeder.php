<?php

use Illuminate\Database\Seeder;
use App\LearningWord as Word;

class LearningWordsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $jsonData = json_decode(Storage::get('data/learning_words.json'));
        foreach ($jsonData as $key => $item) {
            $word = new Word();
            $word->subject_id = $item->id;
            $word->word = $item->word;
            $word->type = $item->type;
            $word->meaning = $item->meaning;
            $word->pronunciation = "pronuncitation+".$key ;
            $word->audio = "audio+".$key;
            $word->image = "image+".$key;
            $word->example = "example+".$key;
            $word->save();
        }
    }
}
