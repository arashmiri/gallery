<?php

namespace App\Services\Payment\Contracts;

abstract class AbstractProviderInterface
{

    protected RequestInterface $request;

    public function __construct(RequestInterface $request)
    {
        $this->request = $request;
    }
}