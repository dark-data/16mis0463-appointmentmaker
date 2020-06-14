<%-- 
    Document   : signup
    Created on : 13 Jun, 2020, 9:58:41 AM
    Author     : vivek
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>sign up</title>
         <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="809932328842-oulc60727tl7788rlbpefh08n53m1ojq.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
   
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <body>
        <div class="bg-info" style="float: right;"><h1 class="display-3 text-right text-white">&emsp;Appointment Maker &emsp;</h1><p class="text-white" align="right"><br> scehedule metting and event made easy with google calender Api.</p></div>
        <div class="content" style="width:40%;">
      <form class="text-center border border-light p-5" action="register">

          <p class="h4 mb-4">Sign up</p>
          <input type="fullname" name="fname" id="defaultLoginFormEmail" class="form-control mb-4" placeholder="Full name" required>
          
          <input type="email" name="email" id="defaultLoginFormEmail" class="form-control mb-4" placeholder="E-mail" required>

          <input type="password" name="password" id="defaultLoginFormPassword" class="form-control mb-4" placeholder="Password" required>


          <button class="btn btn-info btn-block my-4" type="submit">create account</button>

          <p>already have an account?
              <a href="index.jsp" class="border-bottom border-success text-decoration-none">log in</a>
          </p>

          <p>or sign in with:</p>
          <center><div class="g-signin2 mx-2" data-onsuccess="onSignIn" data-theme="dark"></div></center>
          
      </form>
    </div>
      

      
      
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
    </body>
</html>
