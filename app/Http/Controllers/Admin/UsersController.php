<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\Users\CreateUser;
use App\Http\Requests\Admin\Users\UpdateRequest;
use App\Models\User;
use Illuminate\Http\Request;

class UsersController extends Controller
{
    public function all()
    {
        $users = User::paginate(10);

        return view('admin.users.all', compact('users'));
    }  

    public function create()
    {
        return view('admin.users.create');
    }  

    public function store(CreateUser $request)
    {
      $validatedData = $request->validated();

        $user = User::create([
            'name' => $validatedData['name'],
            'email' => $validatedData['email'],
            'mobile' => $validatedData['mobile'],
            'role' => $validatedData['role']
        ]);

        if (!$user) 
        {
            return redirect()->back()->with('error', 'هنگام ایجاد کاربر مشکلی پیش امده است');
        }

        return redirect()->route('admin.users.all')->with('success', 'کاربر با موفقیت ایجاد شد');
    }  

    public function edit($userID)
    {
        $user = User::find($userID);

        return view('admin.users.edit', compact('user'));
    }  

    public function update(UpdateRequest $request, $userID)
    {
        $validatedData = $request->validated();

        $user = User::find($userID);

        $user->name = $validatedData['name'];
        $user->email = $validatedData['email'];
        $user->mobile = $validatedData['mobile'];
        $user->role = $validatedData['role'];

        $user->save();

        if (!$user)
        {
            return redirect()->back()->with('error', 'هنگام به روز رسانی کاربر مشکلی پیش امده است');
        }

        return redirect()->route('admin.users.all')->with('success', 'کاربر با موفقیت به روز رسانی شد');
        
    }

    public function delete($userID)
    {
        $user = User::findOrFail($userID);

        $user-> delete();

        return redirect()->route('admin.users.all')->with('success', 'User deleted');
    }  
}
