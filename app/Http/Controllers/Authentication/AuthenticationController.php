<?php

namespace App\Http\Controllers\Authentication;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Facades\Hash;

class AuthenticationController extends Controller
{
    public function login(Request $request)
    {
        $credentials = $request->validate([
            'email' => ['required', 'email'],
            'password' => ['required'],
        ]);
 
        if (Auth::attempt($credentials)) {
            $request->session()->regenerate();
            
            Cookie::queue('basket' , null);

            return redirect()->route('home.index');
        }
 
        return back()->withErrors([
            'email' => 'The provided credentials do not match our records.',
        ])->onlyInput('email');
    }

    public function register(Request $request)
    {
        $credentials = $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'mobile' => ['required', 'string' , 'max:11'],
            'password' => ['required', 'string',],
        ]);
 
        $user = User::create([
            'name' => $credentials['name'],
            'email' => $credentials['email'],
            'mobile' => $credentials['mobile'],
            'password' => Hash::make($credentials['password'])
        ]);
 
        $token = $user->createToken('MyApp')->accessToken;
 
        //return response()->json(['token' => $token], 200);

        return redirect()->route('register')->with('success', 'You are registered successfully.');
    }

    public function logout()
    {
        Auth::logout();

        Cookie::queue('basket' , null);
 
        return redirect()->route('home.index');
    }
}
