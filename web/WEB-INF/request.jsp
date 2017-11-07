<%-- 
    Document   : request
    Created on : Sep 26, 2017, 6:30:17 PM
    Author     : Chris
--%>

<%@page session="true" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Requests</title>
        <link rel="stylesheet" type="text/css" href="lineupstyle.css">
    </head>
    <body>
        <div class="topnav">
            <a href="LineUp">Home page link</a>
            <a class="active" href="LineUp?page=request">Request page link</a>
            <a href="LineUp?page=schedule">Schedule page link</a>
            <a href="LineUp?page=user">User page link</a>
            <div style="float:right"><a href="Logout">Logout</a></div>
        </div>
        <h1>Select a Request</h1>
        
        <!-- user will select an option for requesting days off or switching shifts -->
        <a href="LineUp?page=requestDaysOff"><input type="submit" name="requestDaysOff" value="Request Days Off"></a>
        <a href="LineUp?page=requestSwitchShifts"><input type="submit" name="switch-shifts" value="Switch Shifts"></a>
        
    </body>
</html>
