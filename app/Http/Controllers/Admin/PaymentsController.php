<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Payment;

class PaymentsController extends Controller
{
    public function index()
    {
        $payments = Payment::paginate(10);

        return view('admin.payments.index', compact('payments'));
    }
}
