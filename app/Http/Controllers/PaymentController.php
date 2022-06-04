<?php

namespace App\Http\Controllers;

use App\Http\Requests\payment\PayRequest;
use App\Mail\sendOrderImages;
use App\Models\User;
use App\Models\Payment;
use App\Models\Order;
use illuminate\support\Str;
use App\Models\Product;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Facades\Mail;
use App\Services\Payment\PaymentService;
use Illuminate\Http\Request;
use App\Services\Payment\Requests\IDPayRequest;
use App\Services\Payment\Requests\IDPayVerifyRequest;

class PaymentController extends Controller
{
    public function pay(PayRequest $request)
    {
        $validatedData = $request->validated();

        $user = User::firstOrCreate([
            'email' => $validatedData['email'],
        ],[
            'name' => $validatedData['name'],
            'mobile' => $validatedData['mobile'],
        ]);

        try{
            
            $orderItems = json_decode(Cookie::get('basket'), true);

            if(count($orderItems) <= 0){
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

            $orderItemsForCreatedOrder = $products->map(function($product){
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

        }catch(\Exception $e){
           return back()->with('failed', $e->getMessage());
        }
    }

    public function callback(Request $request)
    {
        $paymentInfo = $request->all();

        $IDPayVerifyRequest = new IDPayVerifyRequest([
            'id' => $paymentInfo['id'],
            'orderId' => $paymentInfo['order_id'],
            'apiKey' => config('services.getway.IDPay.api_key')
        ]);

        $paymentService = new PaymentService(PaymentService::IDPAY, $IDPayVerifyRequest);

        $result =  $paymentService->verify();

            if ($result['status'] == false) {
                //echo "status is false";
                return redirect()->route('home.index')->with('fail' , 'پرداخت با مشکل مواجه شد');
            }

            $currentPayment = Payment::where('ref_code', $result['data']['order_id'])->first();

            $currentPayment->update([
                'status' => 'paid',
                'res_id' => $result['data']['track_id']
            ]);
    
            $currentPayment->order->update([
                'status' => 'paid'
            ]);
            
            $currentUser = $currentPayment->order->user;

            $reservedImages = $currentPayment->order->orderItems->map(function($orderItem){
                return $orderItem->product->source_url;
            });

            Cookie::queue('basket', null);

            Mail::to($currentUser)->send(new sendOrderImages($reservedImages->toArray() , $currentUser));

            return redirect()->route('home.index')->with('success' , 'پرداخت شما با موفقیت انجام شد');

    }
}
