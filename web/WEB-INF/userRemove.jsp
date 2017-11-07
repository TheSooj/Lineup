<%-- 
    Document   : userRemove
    Created on : Sep 26, 2017, 6:57:15 PM
    Author     : Sujan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Remove</title>
    </head>
    <body>
        <hr>Remove User</hr><br>
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
        <tr>
        <br>
        <br>
        <button type="Remove">Remove Employee</button>
        <hr> View/Edit Employee Information</hr><br>
        <td>
            <br>
            <select name="listOfEmployees" required>
                <c:foreach var="employees" items="${employees}">
                    <!-- assumming that we have a variable name for the list of employees -->
                    <option value="${employees.name}">${employees.name}</option>
                </c:foreach>
            </select>
        </td>
        <tr>
        <br>
        <br>
        <button type="ViewEdit">View/Edit Employee</button>
    </tr>
    </body>
</html>
