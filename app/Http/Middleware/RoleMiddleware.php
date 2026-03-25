<?php
namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class RoleMiddleware
{
    public function handle(Request $request, Closure $next, ...$roles)
    {
        if (!auth()->check()) {
            return redirect('/login');
        }

        if (!auth()->user()->role || !in_array(auth()->user()->role->name, $roles)) {
            return redirect('/dashboard')->with('error', 'Acceso denegado: No tienes los permisos necesarios.');
        }

        return $next($request);
    }
}
