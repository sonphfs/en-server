<?php

namespace App\Mail;

use App\ExaminationLog;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Support\Facades\Auth;

class ExaminationResult extends Mailable
{
    use Queueable, SerializesModels;

    public $examinationResult;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($examinationResult)
    {
        $this->examinationResult = $examinationResult;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->view('mails.toeic_result');
    }
}
