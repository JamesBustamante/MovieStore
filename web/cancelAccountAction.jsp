<%-- 
    Document   : cancelAccountAction
    Created on : 10/10/2018, 1:34:42 AM
    Author     : Ciaran
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.wsd.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cancel Account</title>
        <link rel="stylesheet" href="CSS/main.css"
    </head>
    <%String filePath = application.getRealPath("WEB-INF/movies.xml");%>
    <jsp:useBean id="movieApp" class="uts.wsd.MovieApplication" scope="application">
        <jsp:setProperty name="movieApp" property="filePath" value="<%=filePath%>"/>
    </jsp:useBean>
    
    <%String filePath1 = application.getRealPath("WEB-INF/users.xml");%>
    <jsp:useBean id="userApp" class="uts.wsd.MovieStoreUserApplication" scope="application">
        <jsp:setProperty name="userApp" property="filePath" value="<%=filePath1%>"/>
    </jsp:useBean>
    
    <% String filePath2 = application.getRealPath("WEB-INF/history.xml");%>
    <jsp:useBean id="historyApp" class="uts.wsd.HistoryApplication" scope="application">
        <jsp:setProperty name="historyApp" property="filePath" value="<%=filePath2%>"/>
    </jsp:useBean>    
    
    <body>
        <jsp:include page="header.jsp"  flush="true"/>
        <%
            User user = (User)session.getAttribute("user");
            String id = user.getID();
        %>
        <%= id%> 
        
        <%
            Users users = userApp.getUsers();
            String email = users.getList().get(0).getEmail(); //Need to fix
        %>
        <%= email%>
        
        <%
            Movies movies = movieApp.getMovies();
            
            users.removeUser(user);
            userApp.updateXML(users, filePath1);
            
        %>
        
        <div class="content" style="text-align: center">
            
        </div>
        <jsp:include page="endNote.jsp"/>        
    </body>
</html>
