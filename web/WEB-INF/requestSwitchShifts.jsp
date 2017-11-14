<%-- 
    Document   : requestSwitchShifts
    Created on : Oct 17, 2017, 10:26:52 AM
    Author     : Johne
--%>

<%@page session="true" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Requests</title>
        <link rel="stylesheet" type="text/css" href="css/lineupstyle.css">
    </head>
    <body>
        <div class="topnav">
            <a href="LineUp">Home page link</a>
            <a class="active" href="LineUp?page=request">Request page link</a>
            <a href="LineUp?page=schedule">Schedule page link</a>
            <a href="getUser">User page link</a>
            <div style="float:right"><a href="Logout">Logout</a></div>
        </div>
        <h1>Switch Shifts Form</h1>
        
        <!-- user will select an option for requesting days off or switching shifts -->
        <a href="LineUp?page=requestDaysOff"><input type="submit" name="requestDaysOff" value="Request Days Off"></a>
        <a href="LineUp?page=requestSwitchShifts"><input type="button" name="switch-shifts" value="Switch Shifts"></a>
        
        <form method="POST" action="">
            <table>
                <tr>
                <br>
                    <td>Employee's Name</td>
                        <td>
                            <select name="listOfEmployees" required>
                                <c:foreach var="employees" items="${employees}">
                                    <!-- assumming that we have a variable name for the list of employees -->
                                    <option value="${employees.name}">${employees.name}</option>
                                </c:foreach>
                            </select>
                        </td>
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
                    <td><br><br>Switching With: </td>
                        <td>
                            <br><br><select name="listOfEmployees" required>
                                <c:foreach var="employees" items="${employees}">
                                    <!-- assumming that we have a variable name for employee names -->
                                    <option value="${employees.name}">${employees.name}</option>
                                </c:foreach>
                            </select>
                        </td>
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
                    <td><label for="comment">Comments:</label></td>
                    <td><textarea id="comment" cols="30"></textarea></td>
                </tr>
            </table>
            <button type="submit">Submit</button>
            <button type="reset" value="reset">Reset</button>
        </form>
    </body>
</html>
