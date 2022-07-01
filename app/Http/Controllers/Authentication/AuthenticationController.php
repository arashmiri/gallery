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
 
        return back()->with('fail' , 'نام کاربری یا رمز عبور اشتباه است');
    }

    public function register(Request $request)
    {
        try {

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

        } catch (\Throwable $th) {
            return redirect()->route('register')->with('fail', 'خطا در ثبت نام');
        }

        //return redirect()->route('register')->with('success', 'حساب شما با موفقیت ایجاد شد');
        session()->flash('success', 'حساب شما با موفقیت ایجاد شد'); return redirect()->route('login');
    }

    public function logout()
    {
        Auth::logout();

        Cookie::queue('basket' , null);
 
        return redirect()->route('home.index');
    }
}
