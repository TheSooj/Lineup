<%-- 
    Document   : user
    Created on : Nov 7, 2017, 10:52:36 AM
    Author     : Johne
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users</title>
        <link rel="stylesheet" type="text/css" href="css/lineupstyle.css">
        <style>
            
        </style>
    </head>
    <body>
        <div class="topnav">
            <a href="LineUp">Home page link</a>
            <a href="LineUp?page=request">Request page link</a>
            <a href="LineUp?page=schedule">Schedule page link</a>
            <a class="active" href="getUser">User page link</a>
            <div style="float:right"><a href="Logout">Logout</a></div>
        </div>
        
        <!-- errMsg will display if an issue occurs with connecting to the Database -->
        <p>${errMsg}</p>
        
        <h1>User Maintenance Page</h1>
        
        <form action="userAdd.jsp">
            <input type="submit" value="Add Employee" />
        </form>
        
        <h2>List of Staffs</h2>
        
        <table>
            <!-- Combined the employee's first name and last name.
                Some of the employee names and manager names are 
                from a random name generator website. 
            
                Future plan: might have to display the list of 
                managers and system admins separately. Might have 
                to create a remove employee servlet and edit employee
                servlet  
            -->
            <tr>
                <th>Employee ID</th>
                <th>Employee First Name</th>
                <th>Position Title</th>
                <th>Employee Manager's Name</th>
            </tr>
            
            <c:forEach var="employees" items="${Employees}">
            <tr>
                <td>${employees.employeeID}</td>
                <td>${employees.firstName} ${employees.lastName}</td>
                <td>${employees.positionTitle}</td>
                <td>${employees.managerName}</td>
                <td><a href="updateUser?employeeID=${employees.employeeID}">Edit</a></td>
                <td><a href="removeUser?employeeID=${employees.employeeID}">Remove</a></td>
            </tr>
            </c:forEach>
        </table>
    </body>
</html>
