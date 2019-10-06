<?php

namespace App\Listeners;

use App\Events\Login;
use App\Http\Requests\LoginRequest;
use App\LoginHistory;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;

class LoginSuccessful
{
    protected $request;
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct(LoginRequest $request)
    {
        $this->request = $request;
    }

    /**
     * Handle the event.
     *
     * @param  object  $event
     * @return void
     */
    public function handle(Login $event)
    {
        $loginHistory = new LoginHistory();
        $data = [
            'user_id' => $event->user->id,
            'ip_address' => $this->request->ip(),
            'device' => $this->request->header('User-Agent')

        ];
        $loginHistory->fill($data);
        try{
            $loginHistory->save();
        }catch(\Exception $e) {
            echo $e->getMessage();
        }
    }
}
