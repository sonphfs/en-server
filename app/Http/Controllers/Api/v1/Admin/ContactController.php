<?php

namespace App\Http\Controllers\Api\v1\Admin;

use App\Contact;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ContactController extends Controller
{
    public function getList()
    {
        $keyword = "";
        $keyword = request()->keyword;
        $contacts = Contact::where('first_name', 'LIKE', "%{$keyword}%")
            ->orWhere('first_name', 'LIKE', "%{$keyword}%")
            ->orWhere('email', 'LIKE', "%{$keyword}%")
            ->orWhere('subject', 'LIKE', "%{$keyword}%")
            ->orWhere('body', 'LIKE', "%{$keyword}%")
            ->orderBy('created_at', 'DESC')->paginate(self::PER_PAGE);
        return $this->response($contacts);
    }

    public function update($id)
    {
        $contact = Contact::find($id);
        $contact->flag = 1;
        $contact->save();
        return $this->response(['updated' => $contact->flag]);
    }

    public function delete(Request $request)
    {
        try {
            $id = $request->all()['id'];
            $contact = Contact::find($id);
            $contact->delete();
            if($contact->deleted_at != null)
                return $this->response($contact);
        }catch (\Exception $e) {
        }
    }
}
