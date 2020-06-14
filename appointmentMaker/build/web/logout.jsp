<%-- 
    Document   : logout
    Created on : 13 Jun, 2020, 3:00:16 PM
    Author     : vivek
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% session.invalidate();
            response.sendRedirect("index.jsp");
        %>
        <h1>Hello World!</h1>
    </body>
</html>
