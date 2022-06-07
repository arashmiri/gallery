<!DOCTYPE HTML>
<html>  
<body>

@include('errors.message')  

<form action="{{route('register')}}" method="post">

    @csrf

    name: <input type="text" name="name"><br>

    email: <input type="text" name="email"><br>

    password: <input type="text" name="password"><br>

    <input type="submit">

</form>

</body>
</html>