<?php

namespace App\Services\Basket;

use Illuminate\Support\Facades\Cookie;

class BasketService
{
    public static function getBasket()
    {
        return dd(json_decode(Cookie::get('basket'), true));
    }
}