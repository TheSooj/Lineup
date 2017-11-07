<%-- 
    Document   : schedule
    Created on : Sep 26, 2017, 6:55:19 PM
    Author     : Chris
--%>

<%@page session="true" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Schedule</title>
        <link rel="stylesheet" type="text/css" href="lineupstyle.css">
    </head>
    <body>
        <div class="topnav">
            <a href="LineUp">Home page link</a>
            <a href="LineUp?page=request">Request page link</a>
            <a class="active" href="LineUp?page=schedule">Schedule page link</a>
            <a href="LineUp?page=user">User page link</a>
            <div style="float:right"><a href="Logout">Logout</a></div>
        </div>
        <h1>Schedule</h1>
        <hr>Schedule User</hr><br>
        <td>Employee's Name</td>
            <tr>
                <select name="listOfEmployees" required>
                    <c:foreach var="employees" items="${employees}">
                        <!-- assumming that we have a variable name for the list of employees -->
                        <option value="${employees.name}">${employees.name}</option>
                    </c:foreach>
                </select>
                </tr>
                <tr>
                    <td><label for="req-switch-date">On Date:</label></td>
                    <td><input id="req-switch-date" type="date" name="switchDate" required></td>
                </tr>
                <tr>
                    <td><label for="req-start-time">Start Time:</label></td>
                    <td><input id="req-start-time" type="time" name="startTime" required></td>
                    <td><label for="req-end-time">End Time:</label></td>
                    <td><input id="req-end-time" type="time" name="endTime" required></td>
                </tr>
                <tr>
                    <button type="Remove">Enter Schedule</button><br>
                </tr>
            </tr>
    </body>
</html>
