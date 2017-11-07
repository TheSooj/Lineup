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
    <hl> Add User</hr><br>
        <br>
        <td><label for="Employee Name">Employee name:</label></td><br>
       <input type="text" name="NewEmployeeName"><br>
       <td><label for="Address"> Address:</label></td> <br><input type="text" name="Address"><br><br>
       <td><label for="City">City:</label></td><br><input type="text" name="City"><br>
       <td><label for="State">State:</label></td><br><select>
           <option value =""></option>
	<option value="AL">Alabama</option>
	<option value="AK">Alaska</option>
	<option value="AZ">Arizona</option>
	<option value="AR">Arkansas</option>
	<option value="CA">California</option>
	<option value="CO">Colorado</option>
	<option value="CT">Connecticut</option>
	<option value="DE">Delaware</option>
	<option value="DC">District Of Columbia</option>
	<option value="FL">Florida</option>
	<option value="GA">Georgia</option>
	<option value="HI">Hawaii</option>
	<option value="ID">Idaho</option>
	<option value="IL">Illinois</option>
	<option value="IN">Indiana</option>
	<option value="IA">Iowa</option>
	<option value="KS">Kansas</option>
	<option value="KY">Kentucky</option>
	<option value="LA">Louisiana</option>
	<option value="ME">Maine</option>
	<option value="MD">Maryland</option>
	<option value="MA">Massachusetts</option>
	<option value="MI">Michigan</option>
	<option value="MN">Minnesota</option>
	<option value="MS">Mississippi</option>
	<option value="MO">Missouri</option>
	<option value="MT">Montana</option>
	<option value="NE">Nebraska</option>
	<option value="NV">Nevada</option>
	<option value="NH">New Hampshire</option>
	<option value="NJ">New Jersey</option>
	<option value="NM">New Mexico</option>
	<option value="NY">New York</option>
	<option value="NC">North Carolina</option>
	<option value="ND">North Dakota</option>
	<option value="OH">Ohio</option>
	<option value="OK">Oklahoma</option>
	<option value="OR">Oregon</option>
	<option value="PA">Pennsylvania</option>
	<option value="RI">Rhode Island</option>
	<option value="SC">South Carolina</option>
	<option value="SD">South Dakota</option>
	<option value="TN">Tennessee</option>
	<option value="TX">Texas</option>
	<option value="UT">Utah</option>
	<option value="VT">Vermont</option>
	<option value="VA">Virginia</option>
	<option value="WA">Washington</option>
	<option value="WV">West Virginia</option>
	<option value="WI">Wisconsin</option>
	<option value="WY">Wyoming</option>
</select>				
       <br>			
       <td><label for="PhoneNum">Phone Number:</label></td><br><input type="text" name="PhoneNum"><br>
       
       <br>
        <button type="Add">Add New Employee</button>
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
