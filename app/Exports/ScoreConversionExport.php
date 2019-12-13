<?php


namespace App\Exports;

use App\ScoreConversion;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\Exportable;

class ScoreConversionExport implements FromCollection
{
    use Exportable;

    public function collection()
    {
        return ScoreConversion::get(['num', 'listening_score', 'reading_score']);
    }

}
