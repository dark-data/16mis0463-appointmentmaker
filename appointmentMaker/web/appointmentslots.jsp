<%-- 
    Document   : appointmentslots
    Created on : 14 Jun, 2020, 7:28:24 AM
    Author     : vivek
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" href="main.css">
    </head>
    <body>
        <%
        String user = (String)session.getAttribute("user");
    if(user != null && user.length()>0){
        
    }else{
        response.sendRedirect("index.jsp");
    }
    %>
      <header class="site-header">
        <nav class="navbar navbar-expand-md navbar-dark bg-steel fixed-top">
            <div class="container">
                <a class="navbar-brand mr-4" href="mainpage.jsp">google calendar events,</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggle" aria-controls="navbarToggle" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarToggle">
                    <div class="navbar-nav mr-auto">

                        <a class="nav-item nav-link" href="viewevents.jsp">other events</a>
                        <a class="nav-item nav-link" href="appointmentslots.jsp">appointment slots</a>

                    </div>
                    <!-- Navbar Right Side -->
                    <div class="navbar-nav">
                        <a class="nav-item nav-link" href="logout.jsp" id="signout_button">Log Out</a>
                        <a class="nav-item nav-link" href="logout.jsp" id="defaultlog" style="display:none;">Log Out</a>
                        
                    </div>
                </div>
            </div>
        </nav>
    </header>
      <div class="row mx-md-n5">
          <div class="col px-md-5"><div class="p-2 display-4 border bg-light text-primary">Choose your free slots and days.</div>
              
              
        <div class="container">

  <p>In form below, check the free slots and days.</p>
  <form method="post" action="updateslots">
      <h3>Days:</h3>
    <label class="btn btn-secondary active checkbox-inline">
      <input type="checkbox" name="days" value="sunday">Sunday
    </label>
    <label class="btn btn-secondary active checkbox-inline">
      <input type="checkbox" name="days" value="monday">Monday
    </label>
    <label class="btn btn-secondary active checkbox-inline">
      <input type="checkbox" name="days" value="tuesday">Tuesday
    </label>
    <label class="btn btn-secondary active checkbox-inline">
      <input type="checkbox" name="days" value="wednesday">Wednesday
    </label>
    <label class="btn btn-secondary active checkbox-inline">
      <input type="checkbox" name="days" value="thursday">Thursday
    </label>
    <label class="btn btn-secondary active checkbox-inline">
      <input type="checkbox" name="days" value="friday">Friday
    </label>
    <label class="btn btn-secondary active checkbox-inline">
      <input type="checkbox" name="days" value="saturday">Saturday
    </label>
      <br><br>
      
      <h3>Slots:</h3>
    <label class="btn btn-secondary active checkbox-inline">
      <input type="checkbox" name="slots" value="9-10">09:00 - 10:00 Am
    </label>
    <label class="btn btn-secondary active checkbox-inline">
      <input type="checkbox" name="slots" value="10-11">10:00 - 11:00 Am
    </label>
    <label class="btn btn-secondary active checkbox-inline">
      <input type="checkbox" name="slots" value="11-12">11:00 - 12:00 Pm
    </label>
    <label class="btn btn-secondary active checkbox-inline">
      <input type="checkbox" name="slots" value="12-1">12:00 - 01:00 Pm
    </label>
    <label class="btn btn-secondary active checkbox-inline">
      <input type="checkbox" name="slots" value="1-2">01:00 - 02:00 Pm
    </label>
    <label class="btn btn-secondary active checkbox-inline">
      <input type="checkbox" name="slots" value="2-3">02:00 - 03:00 Pm
    </label>
    <label class="btn btn-secondary active checkbox-inline">
      <input type="checkbox" name="slots" value="3-4">03:00 - 04:00 Pm
    </label>
    <label class="btn btn-secondary active checkbox-inline">
      <input type="checkbox" name="slots" value="4-5">04:00 - 05:00 Pm
    </label>
    <label class="btn btn-secondary active checkbox-inline">
      <input type="checkbox" name="slots" value="5-6">05:00 - 06:00 Pm
    </label>  
    <label class="btn btn-secondary active checkbox-inline">
      <input type="checkbox" name="slots" value="6-7">06:00 - 07:00 Pm
    </label>
    <label class="btn btn-secondary active checkbox-inline">
      <input type="checkbox" name="slots" value="7-8">07:00 - 08:00 Pm
    </label>
      
      <br><br><br>
      <input type="hidden" name="email" value="<%=session.getAttribute("user")%>">
      <input type="submit" class="btn btn-info" value="update">
      
  </form>
</div>      
              
          </div>
        
        
        <br>
        
        
      </div>
      
    
    </body>
</html>
