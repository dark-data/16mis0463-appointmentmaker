<%-- 
    Document   : addslot
    Created on : 13 Jun, 2020, 11:05:22 PM
    Author     : vivek
--%>
<%@page import="java.lang.*"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.rmi.CORBA.UtilDelegate"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
          <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="bg-info bottom-fixed" style="float: right;"><a href="index.jsp" class="display-4 text-right text-white">&emsp;Appointment Maker &emsp;</a><p class="text-white" align="right"><br> scehedule metting and event made easy with google calender Api.</p></div>              

        <%!
        private static java.sql.Date convertUtilToSql(java.util.Date uDate) {
            java.sql.Date sDate = new java.sql.Date(uDate.getTime());
            return sDate;
        }
        
        %>
        
        <%
    List<String> enable= new ArrayList<String>();// apointed free slot
    List<String> disable= new ArrayList<String>();//contain restof slots and booked free slots (avail=enable disable)
    if(request.getParameter("eventdate")=="null" || request.getParameter("eventdate")==null){

    }else{
        //book a slot
        String email = request.getParameter("email");
        String date = request.getParameter("eventdate");
        Connection con;
        PreparedStatement ps;
        try{
            Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
            email = request.getParameter("email");
            con = DriverManager.getConnection("jdbc:ucanaccess://"+getServletContext().getRealPath("/")+"/mrcalender.accdb");
            ps= con.prepareStatement("select * from appointment where email = ?");
            ps.setString(1,email);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                String days = rs.getString("slots");
                if(days.contains("9-10")){
                    enable.add("09:00 - 10:00 AM");
                }else{
                    disable.add("09:00 - 10:00 AM");
                }
                if(days.contains("10-11")){
                    enable.add("10:00 - 11:00 AM");
                }else{
                    disable.add("10:00 - 11:00 AM");
                }
                if(days.contains("11-12")){
                    enable.add("11:00 - 12:00 PM");
                }else{
                    disable.add("11:00 - 12:00 PM");
                }
                if(days.contains("12-1")){
                    enable.add("12:00 - 01:00 PM");
                }else{
                    disable.add("12:00 - 01:00 PM");
                }
                if(days.contains("1-2")){
                    enable.add("01:00 - 02:00 PM");
                }else{
                    disable.add("01:00 - 02:00 PM");
                }
                if(days.contains("2-3")){
                    enable.add("02:00 - 03:00 PM");
                }else{
                    disable.add("02:00 - 03:00 PM");
                }
                if(days.contains("3-4")){
                    enable.add("03:00 - 04:00 PM");
                }else{
                    disable.add("03:00 - 04:00 PM");
                }
                if(days.contains("4-5")){
                    enable.add("04:00 - 05:00 PM");
                }else{
                    disable.add("04:00 - 05:00 PM");
                }
                if(days.contains("5-6")){
                    enable.add("05:00 - 06:00 PM");
                }else{
                    disable.add("05:00 - 06:00 PM");
                }
                if(days.contains("6-7")){
                    enable.add("06:00 - 07:00 PM");
                }else{
                    disable.add("06:00 - 07:00 PM");
                }
                if(days.contains("7-8")){
                    enable.add("07:00 - 08:00 PM");
                }else{
                    disable.add("07:00 - 08:00 PM");
                }
                
            }
        }catch(Exception e){
            out.println(e);
        }
        
        // check in slot table
        
        try{
            String doe = request.getParameter("eventdate");
            Date dte = new Date((Integer.parseInt(doe.substring(6, 10))-1900), Integer.parseInt(doe.substring(0, 2)), Integer.parseInt(doe.substring(3, 5)));
            Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
            email = request.getParameter("email");
            con = DriverManager.getConnection("jdbc:ucanaccess://"+getServletContext().getRealPath("/")+"/mrcalender.accdb");
            ps= con.prepareStatement("select * from events where email = ? and cast(dateofevent as date) = ?");
            ps.setString(1,email);
            ps.setDate(2, dte);
            ResultSet rs = ps.executeQuery();
            //out.println(dte);
            while(rs.next()){
                String days = rs.getString("slots");
                if(days.contains("9-10")){
                    disable.add("09:00 - 10:00 AM");
                }
                if(days.contains("10-11")){
                    disable.add("10:00 - 11:00 AM");
                }
                if(days.contains("11-12")){
                    disable.add("11:00 - 12:00 PM");
                }
                if(days.contains("12-1")){
                    disable.add("12:00 - 01:00 PM");
                }
                if(days.contains("1-2")){
                    disable.add("01:00 - 02:00 PM");
                }
                if(days.contains("2-3")){
                    disable.add("02:00 - 03:00 PM");
                }
                if(days.contains("3-4")){
                    disable.add("03:00 - 04:00 PM");
                }
                if(days.contains("4-5")){
                    disable.add("04:00 - 05:00 PM");
                }
                if(days.contains("5-6")){
                    disable.add("05:00 - 06:00 PM");
                }
                if(days.contains("6-7")){
                    disable.add("06:00 - 07:00 PM");
                }
                if(days.contains("7-8")){
                    disable.add("07:00 - 08:00 PM");
                }
                
            }
        }catch(Exception e){
            out.println(e);
        }
        
        
        //remove enable if it is in disable
        if(!(disable.isEmpty())){
            for(int i=0;i<disable.size();i++){
                if(enable.contains(disable.get(i))){
                    enable.remove(disable.get(i));
                }
            }
        }
            %>
        
        <div class="container">
  <h1 class="display-4">choose your slot</h1><br>
  
  <form action="createevent" method="post">
  <h3>date of the event: <input type="text" name="eventdate" value="<%=request.getParameter("eventdate")%>" readonly>
      <input type="hidden" name="email" value="<%=request.getParameter("email")%>">
  </h3>
  <h3>Available slots</h3>
  
  <div class="d-flex justify-content-start">
    <div class="form-check">
      <label class="form-check-label" for="radio1">
          <input type="radio" class="form-check-input" id="radio1" name="optradio" value="9-10" <%if(enable.contains("09:00 - 10:00 AM")){}else{out.print("disabled");}%> required>09:00 - 10:00 AM
      </label>
    </div>
    <div class="form-check">
      <label class="form-check-label" for="radio1">
          <input type="radio" class="form-check-input" id="radio1" name="optradio" value="10-11" <%if(enable.contains("10:00 - 11:00 AM")){}else{out.print("disabled");}%>>10:00 - 11:00 AM
      </label>
    </div>
    <div class="form-check">
      <label class="form-check-label" for="radio1">
          <input type="radio" class="form-check-input" id="radio1" name="optradio" value="11-12" <%if(enable.contains("11:00 - 12:00 PM")){}else{out.print("disabled");}%>>11:00 - 12:00 PM
      </label>
    </div>
    <div class="form-check">
      <label class="form-check-label" for="radio1">
          <input type="radio" class="form-check-input" id="radio1" name="optradio" value="12-1" <%if(enable.contains("12:00 - 01:00 PM")){}else{out.print("disabled");}%>>12:00 - 01:00 PM
      </label>
    </div>
    <div class="form-check">
      <label class="form-check-label" for="radio1">
          <input type="radio" class="form-check-input" id="radio1" name="optradio" value="1-2" <%if(enable.contains("01:00 - 02:00 PM")){}else{out.print("disabled");}%>>01:00 - 02:00 PM
      </label>
    </div>  
    <div class="form-check">
      <label class="form-check-label" for="radio1">
          <input type="radio" class="form-check-input" id="radio1" name="optradio" value="2-3" <%if(enable.contains("02:00 - 03:00 PM")){}else{out.print("disabled");}%>>02:00 - 03:00 PM
      </label>
    </div>  
    <div class="form-check">
      <label class="form-check-label" for="radio1">
          <input type="radio" class="form-check-input" id="radio1" name="optradio" value="3-4" <%if(enable.contains("03:00 - 04:00 PM")){}else{out.print("disabled");}%>>03:00 - 04:00 PM
      </label>
    </div>  
    <div class="form-check">
      <label class="form-check-label" for="radio1">
          <input type="radio" class="form-check-input" id="radio1" name="optradio" value="4-5" <%if(enable.contains("04:00 - 05:00 PM")){}else{out.print("disabled");}%>>04:00 - 05:00 PM
      </label>
    </div>  
    <div class="form-check">
      <label class="form-check-label" for="radio1">
          <input type="radio" class="form-check-input" id="radio1" name="optradio" value="5-6" <%if(enable.contains("05:00 - 06:00 PM")){}else{out.print("disabled");}%>>05:00 - 06:00 PM
      </label>
    </div>  
    <div class="form-check">
      <label class="form-check-label" for="radio1">
          <input type="radio" class="form-check-input" id="radio1" name="optradio" value="6-7" <%if(enable.contains("06:00 - 07:00 PM")){}else{out.print("disabled");}%>>06:00 - 07:00 PM
      </label>
    </div>  
    <div class="form-check">
      <label class="form-check-label" for="radio1">
          <input type="radio" class="form-check-input" id="radio1" name="optradio" value="7-8" <%if(enable.contains("07:00 - 08:00 PM")){}else{out.print("disabled");}%>>07:00 - 08:00 PM
      </label>
    </div>  
      </div>
      <br>
      <div class="d-flex justify-content-start">
          <div>
            <h4>title:</h4><input class="form-control" type="text" name="title" value=""required><h4>body</h4>
            <textarea name="body"class="form-control form-control-lg" required></textarea><h4>contact</h4>
            <input type="text" class="form-control" name="contact" value="" required>
          </div>
      </div><br>
    <input type="submit" class="btn btn-primary">
  </form>
</div>
            
        <%    
            if(enable.isEmpty()){
                
                %>
        
        <div class="alert alert-warning alert-dismissible fade show fixed-bottom" role="alert">
            <strong>opps!</strong> no slots available currently.
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        
        <%
                
            }
        
    }
%>
                
<!--<div class="container">
    <h1 class="display-4">choose your slot</h1><br>
  <h3>date of the event: <input type="text" name="eventdate" value="" readonly></h3>
  <h3>Available slots</h3>
  <form action="/action_page.php">
      
    <div class="form-check">
      <label class="form-check-label checkbox-inline" for="radio1">
        <input type="radio" class="form-check-input" id="radio1" name="optradio" value="option1" checked>Option 1
      </label>
    </div>
      
    <div class="form-check">
      <label class="form-check-label checkbox-inline" for="radio2">
        <input type="radio" class="form-check-input" id="radio2" name="optradio" value="option2">Option 2
      </label>
    </div>
      
    <div class="form-check">
      <label class="form-check-label">
        <input type="radio" class="form-check-input" disabled>Option 3
      </label>
    </div>
      <br>
    <button type="submit" class="btn btn-primary">Submit</button>
  </form>
</div>-->

        
    </body>
</html>
