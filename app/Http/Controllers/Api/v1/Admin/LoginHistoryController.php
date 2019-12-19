<?php

namespace App\Http\Controllers\Api\v1\Admin;

use App\LoginHistory;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class LoginHistoryController extends Controller
{
    public function getList()
    {
        $keyword = "";
        $keyword = request()->keyword;
        $histories = LoginHistory::join('users', 'users.id', '=', 'login_histories.user_id')
            ->orWhere('users.username', 'LIKE', "%{$keyword}%")
            ->orWhere('users.email', 'LIKE', "%{$keyword}%")
            ->orWhere('users.phone', 'LIKE', "%{$keyword}%")
            ->orderBy('login_histories.created_at', 'DESC')->paginate(self::PER_PAGE);
        return $this->response($histories);
    }
}
