<?php

use Illuminate\Database\Seeder;
use App\ScoreConversion;

class ScoreConversionTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $data = ScoreConversion::all();
        if (!count($data)) {
            $this->_createDataSeed();
        }
    }

    private function _createDataSeed()
    {
        $file = storage_path('app/data/score.csv');
        $importData = $this->_csvToArray($file);

        for ($i = 0; $i < count($importData); $i++) {
            ScoreConversion::create($importData[$i]);
        }

        return 'Jobi done or what ever';
    }

    private function _csvToArray($filename = '', $delimiter = ',')
    {
        if (!file_exists($filename) || !is_readable($filename))
            return false;
        $header = null;
        $data = array();
        if (($handle = fopen($filename, 'r')) !== false) {
            while (($row = fgetcsv($handle, 1000, $delimiter)) !== false) {
                if (!$header)
                    $header = $row;
                else
                    $data[] = array_combine($header, $row);
            }
            fclose($handle);
        }

        return $data;
    }
}
