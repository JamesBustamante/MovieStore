<%@page import="uts.wsd.*" contentType="text/html" pageEncoding="UTF-8"%>
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
        <link rel="stylesheet" href="/MovieStore/CSS/main.css"> 
    </head>
    <body>
        
        <% String filePath = application.getRealPath("WEB-INF/users.xml"); %>
        <jsp:useBean id="movieStoreUserApp" class="uts.wsd.MovieStoreUserApplication" scope="application">
        <jsp:setProperty name="movieStoreUserApp" property="filePath" value="<%=filePath%>"/>
            </jsp:useBean>
        
        <jsp:useBean id="searchParam" 
                     class="uts.wsd.SearchParam" scope="application"> <!-- This bean calculates all the  years between what the user inputs -->
                     </jsp:useBean>
       
        
        <jsp:include page="header.jsp"  flush="true"/> <!-- Every Page MUST Have this header. We can customise this later on -->
           
            <%
            String year1Err = (String) session.getAttribute("year1Err");
            String year2Err = (String) session.getAttribute("year2Err");
            String exist = (String) session.getAttribute("existErr");
        %>
        
            <h2 style ="text-align: center;">Search for Movies</h2>
            <span><%=(exist != null ? exist : "")%></span>
             <form action="searchAction.jsp" method="get">
            <table>                
                <tr><td>Movie Title</td><td><input type="text" name="title"/></td></tr>
                <tr><td>Genre</td><td><select name="genre">
                         <option value="Any">Any</option>
                         <option value="Sci-Fi">Sci-Fi</option>
                        <option value="Action">Action</option>
                        <option value="Horror">Horror</option>
                        <option value="Comedy">Comedy</option>
                        <option value="Family">Family</option>
                </select></td></tr>
                <tr><td>Release Year</td><td><input type="text" name="year1" value="<%=(year1Err != null ? year1Err : "")%>"/> - <input type="text" name="year2" value="<%=(year2Err != null ? year2Err : "")%>"/></td></tr>
                <tr><td><input type="hidden" value="submitted" name="submitted"></td>
                    <td><input class="button" type="submit" value="Search"> 
                    </td>
                </tr>
            </table>
        </form>
                 <%
            if (request.getParameter("submitted") != null) {
                exist = year1Err = year2Err = null;

            }
            session.removeAttribute("year1Err"); //Invalidate Indivdual attributes rather than the enitre session
            session.removeAttribute("year2Err");
        %>
            
            <div style = "text-align: center;">
            <jsp:include page="displayMovies.jsp" flush="true" />
            </div>
            
    </body>
</html>
