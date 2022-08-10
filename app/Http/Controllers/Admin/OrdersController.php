<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Order;

class OrdersController extends Controller
{
    public function index()
    {
        $orders = Order::paginate(10);

        return view('admin.orders.index', compact('orders'));
    }
}
