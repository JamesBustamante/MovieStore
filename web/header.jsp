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
        <div class="header"><h1>Movie Store HQ</h1>
        <% User user = (User)session.getAttribute("user"); 
                if (user != null) { 
        %>
        <div> 
            You are logged in as <%= user.getfullName() %>  &#60;<%= user.getEmail() %>&#62;  </div>
            <p style ="text-align: right;"> <a href="main.jsp">My Account</a><!-- This is the link that takes the user to their main page-->
         <% } else { %>
         <div > 
             <p style ="text-align: right; color: #ffffff">You are not logged in</p>  </div>
            <p style ="text-align: right;"><a href="login.jsp">Login</a> | <a href="register.jsp"> Register </a> </p>
            <% } %>   
            </div> 
    </body>
</html>
