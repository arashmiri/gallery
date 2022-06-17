<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Login Page with Background Image Example</title>
  <link rel="stylesheet" href="/css/auth.css">

</head>
<body>
<!-- partial:index.partial.html -->
<div id="bg"></div>

@include('errors.message')  

<form action="{{route('register')}}" method="post">

    @csrf

    <h1 style="text-align:center;" >ساخت حساب کاربری</h1> <br>

    <div class="form-field">
        <input type="name" name="name" placeholder="نام کاربری">
    </div>

    <div class="form-field">
        <input type="email" name="email" placeholder="ایمیل">
    </div>

    <div class="form-field">
        <input type="mobile" name="mobile" placeholder="موبایل">
    </div>
  
    <div class="form-field">
        <input type="password" name="password" placeholder="پسورد">                         
    </div>
  
    <div class="form-field">
        <button class="btn" style="background-color: blue ; " type="submit"><a style="text-decoration:none; color:white" href="{{ route('authentication.login') }}">بازگشت به صفحه ورود</a></button>
        <button class="btn" type="submit">ایجاد حساب</button>
    </div>
</form>
<!-- partial -->
  
</body>
</html>
