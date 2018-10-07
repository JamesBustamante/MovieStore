<%-- 
    Document   : loginAction
    Created on : 06/09/2018, 12:58:09 AM
    Author     : james
--%>
<%@page import="uts.wsd.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="CSS/main.css"> 
    </head>
    <body>
        <% String filePath = application.getRealPath("WEB-INF/users.xml"); %>
        <jsp:useBean id="movieStoreUserApp" class="uts.wsd.MovieStoreUserApplication" scope="application">
        <jsp:setProperty name="movieStoreUserApp" property="filePath" value="<%=filePath%>"/>
            </jsp:useBean>
        
          <jsp:useBean id="multiMovieOrder" 
                     class="uts.wsd.MultiMovieOrder" scope="session">
        </jsp:useBean>
        <jsp:useBean id="searchParam" 
                     class="uts.wsd.SearchParam" scope="application"> <!-- This bean calculates all the  years between what the user inputs -->
        </jsp:useBean>
           <% multiMovieOrder.movies.clear(); 
           searchParam.years.clear();
           %>
        
        <jsp:include page="header.jsp"  flush="true"/>

        <% 
            Users users = movieStoreUserApp.getUsers();
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            User user = users.login(email, password);
        %>

        <div class="content">
        <%
            if (user != null) {
                session.setAttribute("user", user);
        %>
            <p>Login successful. Click <a href="index.jsp">here</a> to return to the home page.</p>
        <%
            } else {
                session.setAttribute("existErr", "user does not exist!");
        %>
            <p>Password incorrect. Click <a href="login.jsp">here</a> to try again.</p>
            <% } %>
            </div>
            <jsp:include page="endNote.jsp" />
    </body>
</html>
