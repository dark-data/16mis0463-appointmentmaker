<%-- 
    Document   : mainpage
    Created on : 13 Jun, 2020, 9:13:42 AM
    Author     : vivek
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    

<link rel="stylesheet" type="text/css" href="main.css">

        <title>event scheduler</title>


</head>
<body>
    <%
        String user = (String)session.getAttribute("user");
    if(user != null && user.length()>0){
        
    }else{
        response.sendRedirect("index.jsp");
    }
    %>
    
    
    <%!
Connection con;
PreparedStatement ps;
String email="";
String shareurl="";
Statement st;
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
                        
<%try {
        email=(String)session.getAttribute("user");
        
        Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
        email = request.getParameter("username");
        con = DriverManager.getConnection("jdbc:ucanaccess://"+getServletContext().getRealPath("/")+"/mrcalender.accdb");
        ps= con.prepareStatement("select * from appointment where email = ?");
        ps.setString(1,session.getAttribute("user")+"");

        ResultSet rs = ps.executeQuery();
        if(rs.next()){
            %><input type="text" value="<%="appointmentMaker/addevent.jsp?email="+session.getAttribute("user")%>"readonly><%
            
        }else{
            
        }
    }catch(SQLException e){
        out.print(e);
    }catch(Exception e){
        out.print(e);
    }
    
    %>
                    </div>
                    <!-- Navbar Right Side -->
                    <div class="navbar-nav">
                        <a class="nav-item nav-link" href="addevent.jsp?email=<%=session.getAttribute("user")%>">add event</a>
                        <a class="nav-item nav-link" href="logout.jsp" id="signout_button">Log Out</a>
                        <a class="nav-item nav-link" href="logout.jsp" id="defaultlog" style="display:none;">Log Out</a>
                        
                    </div>
                </div>
            </div>
        </nav>
    </header>
    
    <main role="main" class="container">
        <div class="row">
            
            
<div class="col-md-8" id="content-schedule">

<!--    <article class="media content-section">
        <div class="media-body">
            <div class="article-metadata">
                <a class="mr-2" href="#">vivek</a>
                <small class="text-muted">June 05, 2020</small>
            </div>
            <h2><a class="article-title" href="#">blog1</a></h2>
            <p class="article-content">firsr post content</p>
        </div>
    </article>
    
    <article class='media content-section'>
        <div class="media-body">
            <div class="article-metadata">
                <a class="mr-2" href="#">vivek</a>
                <small class="text-muted">June 05, 2020</small>
            </div>
            <h2><a class="article-title" href="#">blog1</a></h2>
            <p class="article-content">firsr post content</p>
        </div>
    </article>-->

    
    
</div>
            <div class="col-md-4">
                
            </div>
        </div>
      </main>
    <button id="authorize_button" style="display: none;">allow access to google calender</button>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
    
    
    
    

    <pre id="content" style="white-space: pre-wrap;"></pre>

    <script type="text/javascript">
        const monthNames = ["January", "February", "March", "April", "May", "June",
  "July", "August", "September", "October", "November", "December"
];
      // Client ID and API key from the Developer Console
      var CLIENT_ID = '184095135348-l8ul79t51s0mkub32dhc2lmcqbjrg4v4.apps.googleusercontent.com';
      var API_KEY = 'AIzaSyC6E-jfmFMioST0vxK9hGY-XNgMEt3tdUs';

      // Array of API discovery doc URLs for APIs used by the quickstart
      var DISCOVERY_DOCS = ["https://www.googleapis.com/discovery/v1/apis/calendar/v3/rest"];

      // Authorization scopes required by the API; multiple scopes can be
      // included, separated by spaces.
      var SCOPES = "https://www.googleapis.com/auth/calendar.readonly";

      var authorizeButton = document.getElementById('authorize_button');
      var signoutButton = document.getElementById('signout_button');
      
        var srcElement1 = document.getElementById('defaultlog');//logout button default
      /**
       *  On load, called to load the auth2 library and API client library.
       */
      function handleClientLoad() {
        gapi.load('client:auth2', initClient);
      }

      /**
       *  Initializes the API client library and sets up sign-in state
       *  listeners.
       */
      function initClient() {
        gapi.client.init({
          apiKey: API_KEY,
          clientId: CLIENT_ID,
          discoveryDocs: DISCOVERY_DOCS,
          scope: SCOPES
        }).then(function () {
          // Listen for sign-in state changes.
          gapi.auth2.getAuthInstance().isSignedIn.listen(updateSigninStatus);

          // Handle the initial sign-in state.
          updateSigninStatus(gapi.auth2.getAuthInstance().isSignedIn.get());
          authorizeButton.onclick = handleAuthClick;
          signoutButton.onclick = handleSignoutClick;
        }, function(error) {
          appendPre(JSON.stringify(error, null, 2));
        });
      }

      /**
       *  Called when the signed in status changes, to update the UI
       *  appropriately. After a sign-in, the API is called.
       */
      function updateSigninStatus(isSignedIn) {
        if (isSignedIn) {
          authorizeButton.style.display = 'none';
          srcElement1.style.display = 'none';
          signoutButton.style.display = 'block';
          listUpcomingEvents();
        } else {
            srcElement1.style.display = 'block';
            authorizeButton.style.display = 'block';
          signoutButton.style.display = 'none';
          
        }
      }

      /**
       *  Sign in the user upon button click.
       */
      function handleAuthClick(event) {
        gapi.auth2.getAuthInstance().signIn();
      }

      /**
       *  Sign out the user upon button click.
       */
      function handleSignoutClick(event) {
        gapi.auth2.getAuthInstance().signOut();
      }

      /**
       * Append a pre element to the body containing the given message
       * as its text node. Used to display the results of the API call.
       *
       * @param {string} message Text to be placed in pre element.
       */
      function appendPre(message) {
        var pre = document.getElementById('content-schedule');
        var textContent = document.createTextNode(message+'\n');
        pre.appendChild(textContent);
      }

      /**
       * Print the summary and start datetime/date of the next ten events in
       * the authorized user's calendar. If no events are found an
       * appropriate message is printed.
       */
      function listUpcomingEvents() {
        gapi.client.calendar.events.list({
          'calendarId': 'primary',
          'timeMin': (new Date()).toISOString(),
          'showDeleted': false,
          'singleEvents': true,
          'maxResults': 10,
          'orderBy': 'startTime'
        }).then(function(response) {
          var events = response.result.items;
          appendPre('Upcoming events:');

          if (events.length > 0) {
            for (i = 0; i < events.length; i++) {
              var event = events[i];
              var when =new Date(event.start.dateTime);
              if (!when) {
                when = event.start.date;
              }
              var line1 = event.description.split('\n')[0];
              var rem = event.description.replace(line1,'').replace("Need to make changes to this event?",'');
document.getElementById("content-schedule").innerHTML = "<article class='media content-section'><div class='media-body'><div class='article-metadata'><p class='mr-2'>"+event.summary+"</p><small class='text-muted'>"+when.getDate()+" "+monthNames[when.getMonth()]+', '+when.getFullYear()+"</small></div><h6><p class='article-title'>"+line1+"</p></h6><pclass='article-content'>"+rem+"</p></div></article>";
            }
          } else {
            appendPre('No upcoming events found.');
          }
        });
      }

    </script>

    <script async defer src="https://apis.google.com/js/api.js"
      onload="this.onload=function(){};handleClientLoad()"
      onreadystatechange="if (this.readyState === 'complete') this.onload()">
    </script>
    
</body>
</html>
