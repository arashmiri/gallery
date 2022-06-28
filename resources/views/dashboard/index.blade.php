<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/css/stylesheet2.css">
</head>
<body>
<div class="min-h-vh d-flex gap-2 flex-column justify-content-start align-items-center">
    <div class="d-flex w-100 py-3 px-4 bg-white-100 position-sticky top-0 z-10">
        <div class="'flex-grow-1 w-100">
            نام کاربری : {{ $user->name }} 
        </div>
        <div class="flex-grow-1 w-100 text-left">
        <a href="{{ route('home.index') }}">بازگشت به سایت</a>
        </div>
    </div>

    <div class="flex-grow-1 w-100 d-flex justify-content-center align-items-center" style="text-align: center">
        <div class="shadow-lg p-4 d-flex gap-3 flex-column bg-white-100 rounded-6 min-w-40">
            <div>
                <p class="p">لیست محصولات  </p>

            </div>
            <div class="d-flex gap-2 flex-column">
                @foreach($user->products as $product) 
                <div class="item-blue d-flex gap-3 align-items-center p-1 rounded-6">
                    <div class="w-4 d-flex align-items-center justify-content-center">
                        <img class="w-4 h-4 img-cover rounded-6" src="/{{ $product->thumbnail_url }}">
                    </div>
                    <div class="a">
                        <a href="{{ route('admin.products.download.source' , $product->id) }}">دانلود</a>
                    </div>
                </div>
                @endforeach
            </div>
        </div>
    </div>


</div>
</body>
</html>