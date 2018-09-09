<%@page import="uts.wsd.User"%>
<%@page import="uts.wsd.Users"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Movie Store Home Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div><h1>Movie Store Main Page</h1></div> 
        <% String filePath = application.getRealPath("WEB-INF/users.xml"); %>
        <jsp:useBean id="movieStoreApp" class="uts.wsd.MovieStoreApplication" scope="application">
        <jsp:setProperty name="movieStoreApp" property="filePath" value="<%=filePath%>"/>
            </jsp:useBean>

           
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
            
            <h2 style ="text-align: center;">Search for Movies</h2>
             <form action="loginAction.jsp" method="get">
            <table>                
                <tr><td>Movie Title</td><td><input type="text" name="title"/></td></tr>
                <tr><td>Genre</td><td><select name="genre">
                         <option value="Sci-Fi">Sci-Fi</option>
                        <option value="Action">Action</option>
                        <option value="Horror">Horror</option>
                        <option value="Comedy">Comedy</option>
                        <option value="Family">Family</option>
                </select></td></tr>
                <tr><td>Release Year</td><td><input type="text" name="year1"/> - <input type="text" name="year2"/></td></tr>
                <tr><td><input type="hidden" value="submitted" name="submitted"></td>
                    <td><input class="button" type="submit" value="Search"> 
                    </td>
                </tr>
            </table>
        </form>  
            
    </body>
</html>
