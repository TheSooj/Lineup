<%-- 
    Document   : userAdd
    Created on : Sep 26, 2017, 6:57:15 PM
    Author     : Sujan
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Add</title>
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
        <h1>Add Employee</h1>
        
        <br>

        <form action="addUser">
            <label for="lastName">Last Name: </label><input type="text" name="lastName"> <br>
            <label for="firstName"> First Name:  </label><input type="text" name="firstName"> <br>
            <label for="managerName"> Manger's Name:  </label><input type="text" name="managerName"> <br>
            <label for="positionTitle"> Position Title Name:  </label><input type="text" name="positionTitle"> <br>
            <br>
            <br>
            <input type="submit" name="addEmployee" value="Add Employee" />
        </form>
        <br>
        

    </body>
</html>