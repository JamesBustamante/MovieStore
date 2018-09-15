<%-- 
    Document   : header
    Created on : 09/09/2018, 3:23:47 PM
    Author     : james
--%>

<%@page import="uts.wsd.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="/MovieStore/CSS/main.css"> 
        <title>Import</title>
    </head>
    <body>
        <div class="header"><h1>Movie Store HQ</h1></div>
        <% User user = (User)session.getAttribute("user"); 
                if (user != null) { 
        %>
        <div class="logincontent"> 
            <span style="text-align: center">You are logged in as <%= user.getfullName() %>  &#60;<%= user.getEmail() %>&#62;  <a href="main.jsp">My Account</a></span>
        </div><!-- This is the link that takes the user to their main page-->
         <% } else { %> 
            <div class="logincontent">
                <table>
                    <tbody>
                    <tr>
                        <td>You are not logged in </td><td><a href="login.jsp">Login</a> | <a href="register.jsp"> Register </a></td>
                    </tr>
                    </tbody>
                </table>
            </div>
                 <% } %>   
    </body>
</html>
