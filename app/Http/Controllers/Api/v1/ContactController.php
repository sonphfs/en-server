<?php

namespace App\Http\Controllers\Api\v1;

use App\Contact;
use App\Http\Requests\ContactRequest;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ContactController extends Controller
{
    public function send(ContactRequest $request)
    {
        $contact = new Contact();
        $contact->fill($request->data);
        $contact->save();

        return response()->json([$contact]);
    }
}
