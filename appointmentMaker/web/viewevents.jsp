<%-- 
    Document   : viewevents
    Created on : 14 Jun, 2020, 1:57:15 PM
    Author     : vivek
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="main.css">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


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
        
        
 <%!
Connection con;
PreparedStatement ps;
String email, password;
Statement st;

 %>       
        
<main role="main" class="container">
    <div class="row">
        <div class="col-md-8" id="content-schedule">
            
            
            <%
                String name=(String)session.getAttribute("user");  
                String[] monthNames = new String[]{"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
            try {
                    Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
                    email = request.getParameter("email");
                    con = DriverManager.getConnection("jdbc:ucanaccess://"+getServletContext().getRealPath("/")+"/mrcalender.accdb");
                    ps= con.prepareStatement("select * from events where email = ? and dateofevent >= NOW() order by ID");
                    ps.setString(1,name);
                    ResultSet rs = ps.executeQuery();
                    while(rs.next()){
                        Date d = rs.getDate("dateofevent");
                        String slot = rs.getString("slot");
                        if(slot.contains("9-10")){
                            slot = "09:00 - 10:00 am";
                        }
                        if(slot.contains("10-11")){
                            slot = "10:00 - 11:00 am";
                        }
                        if(slot.contains("11-12")){
                            slot = "11:00 - 12:00 pm";
                        }
                        if(slot.contains("12-1")){
                            slot = "12:00 - 01:00 pm";
                        }
                        if(slot.contains("1-2")){
                            slot = "01:00 - 02:00 pm";
                        }
                        if(slot.contains("2-3")){
                            slot = "02:00 - 03:00 pm";
                        }
                        if(slot.contains("3-4")){
                            slot = "03:00 - 04:00 pm";
                        }
                        if(slot.contains("4-5")){
                            slot = "04:00 - 05:00 pm";
                        }
                        if(slot.contains("5-6")){
                            slot = "05:00 - 06:00 pm";
                        }
                        if(slot.contains("6-7")){
                            slot = "06:00 - 07:00 pm";
                        }
                        if(slot.contains("7-8")){
                            slot = "07:00 - 08:00 pm";
                        }
                        %>
            
            
            <article class="media content-section">
                    <div class="media-body">
                    <div class="article-metadata">
                        <a class="mr-2" href="#"><%=rs.getString("contact")%></a>
                        <small class="text-muted"><%=monthNames[d.getMonth()]%> <%=d.getDate()%>, <%=(d.getYear()+1900)%></small>
                    </div>
                    <h2><p class="article-title"><%=rs.getString("title")%> scheduled at: <%=slot%></p></h2>
                    <p class="article-content"><%=rs.getString("body")%></p>
                </div>
            </article>
            
            
            
            
            <%
                        
                    }
            }catch(Exception e){
                out.print(e);
            }


            %>
            
            
            
            
        </div>
        
    </div>
</main>
    
    
    </body>
</html>
