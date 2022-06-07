@guest
    <?php return redirect()->route('home.index'); ?>
@endguest

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>

    {{ $user->name }}

    @foreach($user->products as $product) 
        {
            {{$product->source_url}}
            {{ "hi" }}
        }
    @endforeach

</body>
</html>