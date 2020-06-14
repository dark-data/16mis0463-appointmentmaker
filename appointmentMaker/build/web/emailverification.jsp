<%-- 
    Document   : emailverification
    Created on : 13 Jun, 2020, 11:10:15 AM
    Author     : vivek
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OTP verification</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <body>
        <center>
            <h1 class="font-weight-light" style="padding: 30px 30px;">Verify e-mail</h1>
        <form method="post" action="verifyotp">
        <div class="w-25 p-3 input-group mb-3">
            <input type="text" name="otp" class="form-control" placeholder="Enter Otp" aria-label="Recipient's username" aria-describedby="basic-addon2" required>
            <div class="input-group-append">
                <%
                    String email = request.getParameter("email");
                    %><input type="hidden" name="email" value="<%=email %>">
                <input type="submit" class="input-group-text" id="basic-addon2" value=" verify ">
            </div>
        </div>
        </form>
            </center>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
