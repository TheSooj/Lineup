<%-- 
    Document   : userAdd
    Created on : Sep 26, 2017, 6:57:15 PM
    Author     : Sujan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Add</title>
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
    <hl> Add Employee</hr><br>
        <br>
        <td><label for="LastName">Last Name </label></td><input type="text" name="LastName">
        <td><label for="FirstName"> First Name  </label></td><input type="text" name="FirstName">
        <td><label for="MiddleName"> Middle Name </label></td><input type="text" name="MiddleName"><br>
        <br>
        <td><label for="Address"> Address </label></td> <br><input type="text" name="Address"><br>
        <td><label for="City">City </label><br></td><input type="text" name="City"><br>
        <td><label for="State"> State </label></td><br><select>
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
        <td><label for="Zip Code"> Zip Code</label></td><br><input type="text" name="ZipCode"><br>
        <br>
        <td><label for="PhoneNum">Phone Number </label></td><br><input type="text" name="PhoneNum"><br>
        <br>
        <br>
        <br>
        <td><label for="State"> Level </label></td><select>
            <option value =""></option>
            <option value ="Emp">Employee</option>
            <option value="MGMT">Manager</option>
            <option value="Owner">Owner</option>
            <option value ="SysAdmin">Admin</option>
        </select>
        <br>
        <br>

        <br>
        <button type="Add">Add New Employee</button>
        
</body>
</html>