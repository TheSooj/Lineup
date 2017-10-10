<%-- 
    Document   : home
    Created on : Sep 26, 2017, 6:35:25 PM
    Author     : Chris
--%>

<%@page session="true" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Line Up Home</title>
        <link rel="stylesheet" type="text/css" href="lineupstyle.css">
    </head>
    
        <div class="topnav">
            <a class="active" href="LineUp">Home page link</a>
            <a href="LineUp?page=request">Request page link</a>
            <a href="LineUp?page=schedule">Schedule page link</a>
            <a href="LineUp?page=user">User page link</a>
            <div style="float:right"><a href="Logout">Logout</a></div>
        </div>
        <h1>Hello World!</h1>
        <br>
        <h2>You're logged in as ${username}</h2>
        <div class="tab">
            <button class="tablinks" onclick="openCalendar(event, 'Day')" id="defaultOpen">Day</button>
            <button class="tablinks" onclick="openCalendar(event, 'Week')">Week</button>
            <button class="tablinks" onclick="openCalendar(event, 'Month')">Month</button>
        </div>
        <div id="Day" class="tabcontent">
            <h3>Today</h3>
            <p>Today Time Breakdown</p>
        </div>
        <div id="Week" class="tabcontent">
            <h3>This Week</h3>
            <p>Week Time Breakdown</p>
        </div>
        <div id="Month" class="tabcontent">
            <h3>This Month</h3>
            <p>Month Time Breakdown</p>
        </div>
        <script>
            function openCalendar(evt, Size){
                var i, tabcontent, tablinks;
                tabcontent = document.getElementsByClassName("tabcontent");
                for (i = 0; i < tabcontent.length; i++){
                    tabcontent[i].style.display = "none";
                }
                tablinks = document.getElementsByClassName("tablinks");
                for (i = 0; i < tablinks.length; i++){
                    tablinks[i].className = tablinks[i].className.replace(" active", "");
                }
                document.getElementById(Size).style.display = "block";
                evt.currentTarget.className += " active";
            }
            document.getElementById("defaultOpen").click();        
        </script>
    

