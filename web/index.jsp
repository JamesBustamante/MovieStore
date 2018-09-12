<%@page import="uts.wsd.Movies"%>
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
        
        <% String filePath = application.getRealPath("WEB-INF/users.xml"); %>
        <jsp:useBean id="movieStoreUserApp" class="uts.wsd.MovieStoreUserApplication" scope="application">
        <jsp:setProperty name="movieStoreUserApp" property="filePath" value="<%=filePath%>"/>
            </jsp:useBean>
        
        <% String filePath1 = application.getRealPath("WEB-INF/movies.xml"); %>
        <jsp:useBean id="movieApp" class="uts.wsd.MovieApplication" scope="application">
        <jsp:setProperty name="movieApp" property="filePath" value="<%=filePath1%>"/>
            </jsp:useBean>
        
        <jsp:include page="header.jsp" /> <!-- Every Page MUST Have this header. We can customise this later on -->
           
            
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
