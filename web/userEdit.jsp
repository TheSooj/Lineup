<%-- 
    Document   : userEdit
    Created on : Nov 7, 2017, 10:52:54 AM
    Author     : Johne
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Edit</title>
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

        <h1>Edit Employee</h1>

        <form action="updateUser">
            <label for="employeeID"> Employee ID:  </label><input type="text" name="employeeID" value="${employees.employeeID}" readonly>
            <label for="LastName">Last Name: </label></td><input type="text" name="lastName" value="${employees.lastName}">
            <label for="FirstName"> First Name:  </label></td><input type="text" name="firstName" value="${employees.firstName}">
            <label for="positionTitle"> Position Title:  </label><input type="text" name="positionTitle" value="${employees.positionTitle}">
            <label for="managerName"> Manager's Name:  </label><input type="text" name="managerName" value="${employees.managerName}">

            <br>

            <br>
            <input type="submit" name="edit" value="Edit Employee">
            <input type="submit" name="delete" value="Delete Employee">
        </form>
    </body>
</html>
