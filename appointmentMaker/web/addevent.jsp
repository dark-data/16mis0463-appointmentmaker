
<!DOCTYPE html>
<html lang="en">
    <%@page import="java.sql.*" %>
<head>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  <meta charset="utf-8">
  <title>FormDen Example</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>      <div class="bg-info bottom-fixed" style="float: right;"><a href="index.jsp" class="display-4 text-right text-white">&emsp;Appointment Maker &emsp;</a><p class="text-white" align="right"><br> scehedule metting and event made easy with google calender Api.</p></div>              

    <%!String result=null; %>
    
    
<% 
    
    if(request.getParameter("email")=="null" || request.getParameter("email")==null){
        //response.sendRedirect("index.jsp");
    }else{
        String email = request.getParameter("email");
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
                String days = rs.getString("days");
                String datepick="c";
                if(!days.contains("monday")){
                    datepick+="1,";
                }if(!days.contains("tuesday")){
                    datepick+="2,";
                }if(!days.contains("wednesday")){
                    datepick+="3,";
                }if(!days.contains("thursday")){
                    datepick+="4,";
                }if(!days.contains("friday")){
                    datepick+="5,";
                }if(!days.contains("saturday")){
                    datepick+="6,";
                }if(!days.contains("sunday")){
                    datepick+="0,";
                }
                
                if ((datepick != null) && (datepick.length() > 0)) {
                    result = datepick.substring(0, datepick.length() - 1);
                 }
            }else{
                response.sendRedirect("index.jsp?message=invalidurl");
            }
        }catch(Exception e){
            out.println(e);
        }
    }
%>
<!--formden.js communicates with FormDen server to validate fields and submit via AJAX -->
<script type="text/javascript" src="https://formden.com/static/cdn/formden.js"></script>

<!-- Special version of Bootstrap that is isolated to content wrapped in .bootstrap-iso -->
<link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />

<!--Font Awesome (added because you use icons in your prepend/append)-->
<link rel="stylesheet" href="https://formden.com/static/cdn/font-awesome/4.4.0/css/font-awesome.min.css" />

<!-- Inline CSS based on choices in "Settings" tab -->
<style>.bootstrap-iso .formden_header h2, .bootstrap-iso .formden_header p, .bootstrap-iso form{font-family: Arial, Helvetica, sans-serif; color: black}.bootstrap-iso form button, .bootstrap-iso form button:hover{color: white !important;} .asteriskField{color: red;}</style>

<!-- HTML Form (wrapped in a .bootstrap-iso div) -->
<div class="bootstrap-iso">
 <div class="container-fluid">
  <div class="row align-items-center">
   <div class="col-md-8 col-sm-6 col-xs-12">
       <form action="addslot.jsp" class="form-horizontal" method="post">
        <div class="form-group border-info col-md-8" style="padding-top: 30px;">
      <label class="control-label col-sm-2 requiredField" for="date">
       Date
       <span class="asteriskField">
        *
       </span>
      </label>
      <div class="col-sm-10">
       <div class="input-group">
        <div class="input-group-addon">
         <i class="fa fa-calendar">
         </i>
        </div>
        <input class="form-control" id="date" name="eventdate" placeholder="MM/DD/YYYY" type="text"/>
        <input type="hidden" name="email" value="<%              
               if(request.getParameter("email")=="null" || request.getParameter("email")==null){
                   out.print("noemail");
               }else{
                   out.print(request.getParameter("email"));
               }
               %>">
               
       </div>
      </div>
     </div>
     <div class="form-group">
      <div class="col-sm-10 col-sm-offset-2">
       <input name="_honey" style="display:none" type="text"/>
       <button class="btn btn-primary " name="submit" type="submit">
        next
       </button>
      </div>
     </div>
    </form>
   </div>
  </div>
 </div>
</div>


<!-- Extra JavaScript/CSS added manually in "Settings" tab -->
<!-- Include jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>

<!-- Include Date Range Picker -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>

<script>
	$(document).ready(function(){
		var date_input=$('input[name="eventdate"]'); //our date input has the name "date"
		var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
		date_input.datepicker({
			format: 'mm/dd/yyyy',
			container: container,
			todayHighlight: true,
			autoclose: true,
                        startDate: new Date(),
                        daysOfWeekDisabled: "<% if(result!=null && result.length()>0 ){out.print(result);}else{out.print("0,1,2,3,4,5,6");}%>"
		});
	});
</script>
<%
    if(!(result!=null && result.length()>0 )){
        %>

<div class="alert alert-warning alert-dismissible fade show fixed-bottom" role="alert">
            <strong>opps!</strong> the user has no appointment dates this week.
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>

<%
    }
%>
</body>

</html>