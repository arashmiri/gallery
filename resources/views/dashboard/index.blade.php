<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/css/stylesheet2.css">
</head>
<body>
<div class="min-h-vh d-flex justify-content-center align-items-center">
    <div class="shadow-lg p-4 d-flex gap-3 flex-column bg-white-100 rounded-6 min-w-40">
        <div>
            <p>نام کاربری: {{ $user->name }}  </p>
        </div>
        <div class="d-flex gap-2 flex-column">

            @foreach($user->products as $product) 

                <div class="item-blue d-flex gap-3 align-items-center p-1 rounded-6">
                    <div class="w-4 d-flex align-items-center justify-content-center">
                        <img class="w-4 h-4 img-cover rounded-6" src="/{{ $product->thumbnail_url }}">
                    </div>
                    <div class="">
                        <a href="{{ route('admin.products.download.source' , $product->id) }}" class="btn btn-default btn-icons" title="لینک دانلود"><i class="fa fa-link"></i>لینک دانلود</a>
                    </div>
                </div>
                
            @endforeach


            {{-- <div class="item-blue d-flex gap-3 align-items-center p-1 rounded-6">
                <div class="w-4 d-flex align-items-center justify-content-center">
                    <img class="w-4 h-4 img-cover rounded-6" src="imgs/3.jpg">
                </div>
                <div class="">
                    <a href="#">مشاهده جزئیات محصول کلیک کنید.</a>
                </div>
            </div>
            <div class="item-blue d-flex gap-3 align-items-center p-1 rounded-6">
                <div class="w-4 d-flex align-items-center justify-content-center">
                    <img class="w-4 h-4 img-cover rounded-6" src="imgs/4.jpg">
                </div>
                <div class="">
                    <a href="#">مشاهده جزئیات محصول کلیک کنید.</a>
                </div>
            </div>
            <div class="item-blue d-flex gap-3 align-items-center p-1 rounded-6">
                <div class="w-4 d-flex align-items-center justify-content-center">
                    <img class="w-4 h-4 img-cover rounded-6" src="imgs/5.jpg">
                </div>
                <div class="">
                    <a href="#">مشاهده جزئیات محصول کلیک کنید.</a>
                </div>
            </div> --}}
        </div>
    </div>
</div>
</body>
</html>