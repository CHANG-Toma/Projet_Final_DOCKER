<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class SetBaseUrl
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle($request, Closure $next)
    {
        $host = $request->getSchemeAndHttpHost();

        if ($request->is('nginx1*')) {
            URL::forceRootUrl($host . '/nginx1');
        } elseif ($request->is('nginx2*')) {
            URL::forceRootUrl($host . '/nginx2');
        }

        return $next($request);
    }

}
