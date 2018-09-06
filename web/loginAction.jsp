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
    </head>
    <body>
        <% String filePath = application.getRealPath("WEB-INF/users.xml"); %>
        <jsp:useBean id="movieStoreApp" class="uts.wsd.MovieStoreApplication" scope="application">
        <jsp:setProperty name="movieStoreApp" property="filePath" value="<%=filePath%>"/>
            </jsp:useBean>

        <% 
            Users users = movieStoreApp.getUsers();
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            User user = users.login(email, password);
        %>

        <%
            if (user != null) {
                session.setAttribute("user", user);
        %>
            <p>Login successful. Click <a href="index.jsp">here</a> to return to the main page.</p>
        <%
            } else {
                session.setAttribute("existErr", "user does not exist!");
        %>
            <p>Password incorrect. Click <a href="login.jsp">here</a> to try again.</p>
            <% } %>
    </body>
</html>
