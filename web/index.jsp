<%@page import="uts.wsd.Users"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>WSD</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div>Movie Store Main Page</div> 
        <% String filePath = application.getRealPath("WEB-INF/users.xml"); %>
        <jsp:useBean id="movieStoreApp" class="uts.wsd.MovieStoreApplication" scope="application">
        <jsp:setProperty name="movieStoreApp" property="filePath" value="<%=filePath%>"/>
            </jsp:useBean>
           Click here to login  <a href="login.jsp"> Login </a>
           Click here to register  <a href="register.jsp"> Register </a>
           <%  Users users = movieStoreApp.getUsers();
           out.print(users.getList());
           %>
    </body>
</html>
