<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Category;
use App\Models\Product;
use App\Models\Order;
use Illuminate\Http\Request;

class AdminController extends Controller
{
    public function index()
    {
        $users = User::count();
        $products = Product::count();
        $orders = Order::count();
        $categories = Category::count();

        return view('admin.index', compact('users', 'products', 'orders', 'categories'));
    }
}
