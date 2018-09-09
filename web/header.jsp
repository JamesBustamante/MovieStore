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
        <title>Import</title>
    </head>
    <body>
        <div><h1>Movie Store HQ</h1></div> 
        <% User user = (User)session.getAttribute("user"); 
                if (user != null) { 
        %>
        <div style="background: #eee; border: solid 1px #333; text-align: right; width: 100%;"> 
            You are logged in as <%= user.getfullName() %>  &#60;<%= user.getEmail() %>&#62;  </div>
           <p style ="text-align: right;"> My Account</p> <!-- This is the link that takes the user to their main page-->
         <% } else { %>
         <div style="background: #eee; border: solid 1px #333; text-align: right; width: 100%;"> 
            You are not logged in  </div>
            <p style ="text-align: right;"><a href="login.jsp">Login</a> | <a href="register.jsp"> Register </a> </p>
            <% } %>   
    </body>
</html>
