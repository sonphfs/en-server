<?php

namespace App\Http\Controllers\Api\v1\Admin;

use App\Exports\ScoreConversionExport;
use App\ScoreConversion;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ScoreController extends Controller
{
    public function getScoreTable()
    {
        return $this->response(ScoreConversion::all());
    }

    public function importCsv(Request $request)
    {
        if($request->has('csv_file')){
            $destinationPath = 'enc/import/score';
            $fileCsv = $request->file('csv_file');
            $result = $fileCsv->move($destinationPath, 'score'.date('Ymd_His').'.' . $fileCsv->getClientOriginalExtension());
            $filePath = public_path($result->getPathname());
            $this->_saveData($filePath);
        }
    }

    public function exportCsv()
    {
        return (new ScoreConversionExport())->download('score.csv', 'Csv', ['Content-Type' => 'text/csv']);
    }

    private function _saveData($filePath)
    {
        $file = $filePath;
        $importData = $this->_csvToArray($file);
        $importDataLenght = count($importData);
        if($importDataLenght >= 100) {
            ScoreConversion::truncate();
            for ($i = 0; $i < $importDataLenght; $i++) {
                ScoreConversion::create($importData[$i]);
            }
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
