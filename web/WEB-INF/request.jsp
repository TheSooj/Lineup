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
        <h1>Request Time Off</h1>
        
        <form method="POST" action="">
            <table>
                <tr>
                    <td>Request Type</td>
                        <td>
                            <select name="requestType">
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
                    <td><input id="req-start-date" type="date" name="startDate"></td>
                    <td><label for="req-end-date">End Date:</label></td>
                    <td><input id="req-end-date" type="date" name="endDate"></td>
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
