<%-- 
    Document   : index
    Created on : 12 Jun, 2020, 9:28:27 PM
    Author     : vivek
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="809932328842-oulc60727tl7788rlbpefh08n53m1ojq.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  </head>
  <body>
      <div class="bg-info" style="float: right;"><h1 class="display-3 text-right text-white">&emsp;Appointment Maker &emsp;</h1><p class="text-white" align="right"><br> scehedule metting and event made easy with google calender Api.</p></div>
      
    <div class="content" style="width:40%;">
      <form class="text-center border border-light p-5" action="login">

          <p class="h4 mb-4">Sign in</p>

          <input name="username" type="email" id="defaultLoginFormEmail" class="form-control mb-4" placeholder="E-mail" required>

          <input type="password" name="password" id="defaultLoginFormPassword" class="form-control mb-4" placeholder="Password" required>

          <div class="d-flex justify-content-around">
              <div>
                  <div class="custom-control custom-checkbox">
                  </div>
              </div>
              <div>
                  <a href="">Forgot password?</a>
              </div>
          </div>

          <button class="btn btn-info btn-block my-4" type="submit">Sign in</button>

          <p>Not a member?
              <a href="signup.jsp" class="border-bottom border-success text-decoration-none">Register</a>
          </p>

          <p>or sign in with:</p>
          <center><div class="g-signin2" data-onsuccess="onSignIn"></div></center>
          
      </form>
    </div>
      

  <script>
      //google callback. This function will redirect to our login servlet
      function onSignIn(googleUser) {
         var profile = googleUser.getBasicProfile();
         console.log('ID: ' + profile.getId());
         console.log('Name: ' + profile.getName());
         console.log('Image URL: ' + profile.getImageUrl());
         console.log('Email: ' + profile.getEmail());
         console.log('id_token: ' + googleUser.getAuthResponse().id_token);

         //do not post all above info to the server because that is not secure.
         //just send the id_token

         var redirectUrl = 'signinbygoogle';

         //using jquery to post data dynamically
         var form = $('<form action="' + redirectUrl + '" method="post">' +
            '<input type="text" name="id_token" value="' +googleUser.getAuthResponse().id_token + '" />' +
            '<input type="text" name="email" value="' + profile.getEmail() + '" />' +
            '<input type="text" name="purl" value="' + profile.getImageUrl() + '" />' +
            '<input type="text" name="name" value="' + profile.getName() + '" />' +
                                                                '</form>');
         $('body').append(form);
         form.submit();
      }

   </script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
      
    
    <div><a href="https://www.termsfeed.com/live/c1022d2f-dec9-4572-a2fb-cacc43e8542d">privacy policy link</a></div>
  </body>
</html>
