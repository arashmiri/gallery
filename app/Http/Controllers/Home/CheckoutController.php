<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cookie;

class CheckoutController extends Controller
{
    public function show()
    {
        $products = !is_null(Cookie::get('basket')) ?  json_decode(  Cookie::get('basket') , true) : [];

        $productPrice = array_sum(array_column($products, 'price'));

        //get authenticate user
        $user = Auth::user();

        return view('frontend.checkout' , compact('products', 'productPrice' , 'user'));
    }
}
