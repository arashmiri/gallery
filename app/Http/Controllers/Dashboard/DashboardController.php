<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class DashboardController extends Controller
{
    public function index()
    {
        //$user = \App\Models\User::find(1);
        $user = \App\Models\User::find(Auth::user()->id);

        return view('dashboard.index', compact('user'));
    }
}
