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

<form action="{{route('login')}}" method="post">

  @csrf
  
  <h1 style="text-align:center;" >ورود</h1> <br>

  <div class="form-field">
    <input type="email" name="email" placeholder="ایمیل" required/>
  </div>
  
  <div class="form-field">
    <input type="password" name="password" placeholder="پسورد" required/>                         
  </div>
  
  <div class="form-field">
    <button class="btn" style="background-color: blue ;" type="submit"><a style="text-decoration:none; color:white" href="{{ route('authentication.register') }}">ایجاد حساب</a></button>
    <button class="btn" type="submit">ورود</button>
  </div>

</form>
<!-- partial -->
  
</body>
</html>
