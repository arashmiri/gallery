@guest
    <?php return redirect()->route('home.index'); ?>
@endguest

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Welcome to Dashboard {{ $user->name }}</title>
</head>
<body>

    {{ $user->name }}

    @foreach($user->products as $product) 
        {
            <div class="col-md-4">
                <a href="{{ route('admin.products.download.source' , $product->id) }}" class="btn btn-default btn-icons" title="لینک دانلود"><i class="fa fa-link"></i>لینک دانلود</a>
            </div>
        }
    @endforeach

</body>
</html>