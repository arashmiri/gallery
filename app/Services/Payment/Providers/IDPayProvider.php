<?php

namespace App\Services\Payment\Providers;

use App\Services\Basket\BasketService;
use App\Services\Payment\Contracts\PayableInterface;
use App\Services\Payment\Contracts\VerifaibleInterface;
use App\Services\Payment\Contracts\AbstractProviderInterface;

class IDPayProvider extends AbstractProviderInterface implements PayableInterface, VerifaibleInterface
{
    
    public function pay()
    {
        $params = array(
            'order_id' => $this->request->getOrderId(),
            'amount' => $this->request->getAmount(),
            'name' => $this->request->getUser()->name,
            'phone' => $this->request->getUser()->mobile,
            'mail' => $this->request->getUser()->email,
            'callback' => route('payment.callback'),
          );
          
          $ch = curl_init();
          curl_setopt($ch, CURLOPT_URL, 'https://api.idpay.ir/v1.1/payment');
          curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($params));
          curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
          curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            'Content-Type: application/json',
            'X-API-KEY: '. $this->request->getAPIKey() .'',
            'X-SANDBOX: 1'
          ));
          
          $result = curl_exec($ch);
          curl_close($ch);

          $result = json_decode($result, true);

          if(isset($result['error_code'])){
              throw new \InvalidArgumentException($result['error_message']);
          }

          return redirect()->away($result['link']);
    }
    
    public function verify()
    {
            $params = array(
                'id' => $this->request->getId(),
                'order_id' => $this->request->getOrderId()
            );
            
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, 'https://api.idpay.ir/v1.1/payment/verify');
            curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($params));
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
            curl_setopt($ch, CURLOPT_HTTPHEADER, array(
                'Content-Type: application/json',
                'X-API-KEY: '. $this->request->getAPIKey() .'',
                'X-SANDBOX: 1',
            ));
		  
            $result = curl_exec($ch);
            curl_close($ch);
            
            $result = json_decode($result, true);

            if (isset($result['error_message'])) {
                return[
                    'status' => false,
                    'statuscode' => $result['error_code'],
                    'msg' => $result['error_message']
                ];
            }

            if ($result['status'] == 100) {
                return[
                    'status' => true,
                    'statuscode' => $result['status'],
                    'data' => $result
                ];
            }
    }
}