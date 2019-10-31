<?php

namespace App\Http\Controllers\Api\v1;

use App\Contact;
use App\Http\Requests\ContactRequest;
use App\Mail\ExaminationResult;
use App\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Mail;

class ContactController extends Controller
{
    public function send(ContactRequest $request)
    {
        $requestData = $request->only(['first_name', 'last_name', 'subject', 'email', 'body']);
        $contact = new Contact();
        $contact->first_name = $requestData['first_name'];
        $contact->last_name = $requestData['last_name'];
        $contact->body = $requestData['body'];
        $contact->subject = $requestData['subject'];
        $contact->email = $requestData['email'];
        $contact->flag = 1;
        $contact->save();
        return $this->response([$contact]);
    }

    public function sendMail()
    {
        return Mail::to(User::find(1))->send(new ExaminationResult());
    }
}
