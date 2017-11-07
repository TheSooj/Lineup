<%-- 
    Document   : user
    Created on : Sep 26, 2017, 6:57:15 PM
    Author     : Chris
--%>

<%@page session="true" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users</title>
        <link rel="stylesheet" type="text/css" href="lineupstyle.css">
    </head>
    <body>
        <div class="topnav">
            <a href="LineUp">Home page link</a>
            <a href="LineUp?page=request">Request page link</a>
            <a href="LineUp?page=schedule">Schedule page link</a>
            <a class="active" href="LineUp?page=user">User page link</a>
            <div style="float:right"><a href="Logout">Logout</a></div>
        </div>
        <h1>User Maintenance Page</h1>
    <hl> Add User</hr>
         <td><label for="New Employee Name">New Employee name:</label></td>
       <input type="text" name="NewEmployeeName"><br>
        <button type="Add">Add New Employee</button>
        <hr>Remove User</hr>
        <td>Employee's Name</td>
                        <td>
                            <select name="listOfEmployees" required>
                                <c:foreach var="employees" items="${employees}">
                                    <!-- assumming that we have a variable name for the list of employees -->
                                    <option value="${employees.name}">${employees.name}</option>
                                </c:foreach>
                            </select>
                        </td>
                        <tr>
                        <br>
<button type="Remove">Remove Employee</button>
    </tr>
    </body>
</html>
