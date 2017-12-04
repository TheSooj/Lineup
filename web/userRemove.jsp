<%-- 
    Document   : userRemove
    Created on : Sep 26, 2017, 6:57:15 PM
    Author     : Sujan
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Remove</title>
        <link rel="stylesheet" type="text/css" href="css/lineupstyle.css">
    </head>
    <body>
        <div class="topnav">
            <a href="LineUp">Home page link</a>
            <a href="LineUp?page=request">Request page link</a>
            <a href="LineUp?page=schedule">Schedule page link</a>
            <a class="active" href="getUser">User page link</a>
            <div style="float:right"><a href="Logout">Logout</a></div>
        </div>
        <h1>Are You Sure You Want to Remove User?</h1><br>
        <br>

        <form action="removeUser" method="POST">
            <label for="employeeID"> Employee ID:  </label><input type="text" name="employeeID" value="${employees.employeeID}" readonly>
            <td><label for="LastName">Last Name: </label></td><input type="text" name="lastName" value="${employees.lastName}" readonly>
            <td><label for="FirstName"> First Name:  </label></td><input type="text" name="firstName" value="${employees.firstName}" readonly>
            <label for="managerName"> Manager's Name:  </label><input type="text" name="managerName" value="${employees.managerName}" readonly>


            <br>
            <input type="submit" name="delete" value="Delete Employee">
        </form>
    </body>
</html>
