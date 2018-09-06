<%-- 
    Document   : register
    Created on : 05/09/2018, 6:29:59 PM
    Author     : james
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Register</h1>
        <form action="registerAction.jsp" method="post">
        <table>
                <tr><td>Email</td><td><input size="16" type="text" name="email"></td></tr>
                 <tr><td>Full Name</td><td><input size="16" type="text" name="fullName"></td></tr>
                <tr><td>Password</td><td><input type="password" name="password"></td></tr>
                <tr><td>Gender</td><td><input type="radio" name="gender" value="male" checked> Male<br>
                <input type="radio" name="gender" value="female"> Female<br> </td></tr>
                  <tr><td>Phone Number</td><td><input size="16" type="text" name="phone"></td></tr>
                  <tr><td>Address</td><td><input size="16" type="text" name="address"></td></tr>
                <tr><td>Agree to TOS</td><td><input type="checkbox" name="tos" value="check"><br></td></tr>
                <tr><td></td><td><input type="submit" value="Register"> </td></tr>
        </table>   
    </form>
    </body>
</html>
