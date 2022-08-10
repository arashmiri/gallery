<?php

namespace App\Http\Controllers;

use App\Mail\sendOrderImages;
use App\Models\Order;
use App\Models\Payment;
use App\Models\Product;
use App\Models\User;
use App\Services\Payment\PaymentService;
use App\Services\Payment\Requests\IDPayRequest;
use App\Services\Payment\Requests\IDPayVerifyRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Facades\Mail;
use illuminate\support\Str;

class PaymentController extends Controller
{
    public function pay(Request $request)
    {

        // $user = User::firstOrCreate([
        //     'email' => $validatedData['email'],
        // ],[
        //     'name' => $validatedData['name'],
        //     'mobile' => $validatedData['mobile'],
        // ]);

        $user = Auth::user();

        try {
            $orderItems = json_decode(Cookie::get('basket'), true);

            if (count($orderItems) <= 0) {
                throw new \InvalidArgumentException('سبد خرید شما خالی است');
            }

            $products = Product::findMany(array_keys($orderItems));

            $productsPrice = $products->sum('price');

            $refCode = Str::random(30);

            $createdOrder = Order::create([
                'amount' => $productsPrice,
                'ref_code' => $refCode,
                'status' => 'unpaid',
                'user_id' => $user->id,
            ]);

            $orderItemsForCreatedOrder = $products->map(function ($product) {
                $currentProduct = $product->only(['id', 'price']);

                $currentProduct['product_id'] = $currentProduct['id'];

                unset($currentProduct['id']);

                return $currentProduct;
            });

            $createdOrder->orderItems()->createMany($orderItemsForCreatedOrder->toArray());

            $createdPayment = Payment::create([
                'getway' => 'idpay',
                'ref_code' => $refCode,
                'status' => 'unpaid',
                'order_id' => $createdOrder->id,
            ]);

            $idPayRequest = new IDPayRequest([
                'amount' => $productsPrice,
                'user' => $user,
                'orderId' => $refCode,
                'apiKey' => config('services.getway.IDPay.api_key'),
            ]);

            $paymentService = new PaymentService(PaymentService::IDPAY, $idPayRequest);

            return $paymentService->pay();
        } catch (\Exception $e) {
            return back()->with('failed', $e->getMessage());
        }
    }

    public function callback(Request $request)
    {
        $paymentInfo = $request->all();

        $IDPayVerifyRequest = new IDPayVerifyRequest([
            'id' => $paymentInfo['id'],
            'orderId' => $paymentInfo['order_id'],
            'apiKey' => config('services.getway.IDPay.api_key'),
        ]);

        $paymentService = new PaymentService(PaymentService::IDPAY, $IDPayVerifyRequest);

        $result = $paymentService->verify();

        if ($result['status'] == false) {
            //echo "status is false";
            return redirect()->route('home.index')->with('fail', 'پرداخت با مشکل مواجه شد');
        }

        $currentPayment = Payment::where('ref_code', $result['data']['order_id'])->first();

        $currentPayment->update([
            'status' => 'paid',
            'res_id' => $result['data']['track_id'],
        ]);

        $currentPayment->order->update([
            'status' => 'paid',
        ]);

        $currentUser = $currentPayment->order->user;

        $reservedImages = $currentPayment->order->orderItems->map(function ($orderItem) {
            return $orderItem->product->source_url;
        });

        Mail::to($currentUser)->send(new sendOrderImages($reservedImages->toArray(), $currentUser));

        //return redirect()->route('home.index')->with('success' , 'پرداخت شما با موفقیت انجام شد');
        return redirect()->route('payment.attach');
    }

    public function attach()
    {
        //dd(Auth::user());

        $user = \App\Models\User::find(Auth::user()->id);

        $basketItems = array_keys(json_decode(Cookie::get('basket'), true));

        $user->products()->attach($basketItems);

        Cookie::queue('basket', null);

        return redirect()->route('home.index')->with('success', 'پرداخت شما با موفقیت انجام شد');
    }
}
