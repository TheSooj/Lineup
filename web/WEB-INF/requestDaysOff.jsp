<%-- 
    Document   : requestDaysOff
    Created on : Oct 17, 2017, 10:26:17 AM
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
        <h1>Request Day(s) Off Form</h1>
        
        <!-- user will select an option for requesting days off or switching shifts -->
        <a href="LineUp?page=requestDaysOff"><input type="submit" name="requestDaysOff" value="Request Days Off"></a>
        <a href="LineUp?page=requestSwitchShifts"><input type="button" name="switch-shifts" value="Switch Shifts"></a>
        
        <form method="POST" action="">
            <table>
                <tr>
                <br>
                    <td>Request Type</td>
                        <td>
                            <select name="requestType" required>
                                <option value=""></option>
                                <option value="unpaid">Unpaid</option>
                                <option value="PTO">Pay Time Off</option>
                                <option value="sick">Sick Day</option>
                                <option value="vacation">Vacation</option>
                                <option value="holiday">Holiday</option>
                            </select>
                        </td>
                </tr>
                <tr>
                    <td><label for="req-start-date">Start Date:</label></td>
                    <td><input id="req-start-date" type="date" name="startDate" required></td>
                    <td><label for="req-end-date">End Date:</label></td>
                    <td><input id="req-end-date" type="date" name="endDate" required></td>
                </tr>
                <tr>
                    <td><label for="comment">Comment:</label></td>
                    <td><textarea id="comment" cols="30"></textarea></td>
                </tr>
            </table>
            <button type="submit">Submit</button>
            <button type="reset" value="reset">Reset</button>
        </form>
        
    </body>
</html>