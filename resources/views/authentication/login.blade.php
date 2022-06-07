<!DOCTYPE HTML>
<html>  
<body>

@include('errors.message')  

<form action="{{route('login')}}" method="post">

    @csrf

    email: <input type="text" name="email"><br>

    password: <input type="text" name="password"><br>

    <input type="submit">

</form>

</body>
</html>