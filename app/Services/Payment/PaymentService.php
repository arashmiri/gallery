<?php

namespace App\Services\Payment;

use App\Services\Payment\Contracts\RequestInterface;
use App\Services\Payment\Exceptions\ProviderNotFoundException;

class PaymentService
{
    public const IDPAY = 'IDPayProvider';

    public const ZARINPAL = 'ZarinpalProvider';

    private string $providerName;

    private RequestInterface $request;

    public function __construct(string $providerName, RequestInterface $request)
    {
        $this->providerName = $providerName;
        $this->request = $request;
    }

    private function findProvider()
    {
        $className = 'App\Services\Payment\Providers\\'.$this->providerName;

        if (! class_exists($className)) {
            throw new ProviderNotFoundException('درگاه پرداخت انتخاب شده پیدا نشد');
        }

        return new $className($this->request);
    }

    public function pay()
    {
        return $this->findProvider()->pay();
    }

    public function verify()
    {
        return $this->findProvider()->verify();
    }
}
