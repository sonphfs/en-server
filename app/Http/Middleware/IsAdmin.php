<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class IsAdmin
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $roles = Auth::user()->roles;
        foreach ($roles as $role) {
            if($role['name'] == 'ROOT' || $role['name'] == 'ADMIN') {
                return $next($request);
            }
        }
        return response()->json([
            'message' => 'Permission denied!'
        ], 401);
    }
}
