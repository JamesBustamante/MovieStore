<%-- 
    Document   : Welcome
    Created on : 01/09/2018, 4:48:26 PM
    Author     : Alex
--%>

<%@page import="java.util.Random"%>
<%@page import="uts.wsd.MovieStoreUserApplication"%>
<%@page import="uts.wsd.User"%>
<%@page import="uts.wsd.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/main.css">
        <title>Welcome Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp"  flush="true"/>

        <% String filePath = application.getRealPath("WEB-INF/users.xml");%>
        <jsp:useBean id="movieStoreUserApp" class="uts.wsd.MovieStoreUserApplication" scope="application">
            <jsp:setProperty name="movieStoreUserApp" property="filePath" value="<%=filePath%>"/>
        </jsp:useBean>

        <%!  boolean unique = false;%>
        
        <%  Users users = movieStoreUserApp.getUsers();
            User user = (User) session.getAttribute("user");
            String tos = (String) session.getAttribute("tos");

            if (user == null) {
                //out.print("FOund");
                unique = false;
            } else {
                users.addUser(user);
                movieStoreUserApp.updateXML(movieStoreUserApp.getUsers(), filePath);
                movieStoreUserApp.saveUsers();
                unique = true;
                //out.print(users.getList());
                //diaryApp.setFilePath(filePath);
            } %>

        <% if (tos == null) {  //Tos is either "check" or null
                //Shows one or the other
        %>
        <div class="content">
            <p> Sorry, you must agree to the Terms of Service. </p>
            <p>  Click <a href="register.jsp"> here </a> to go back. </p>
        </div>
        <% } else if (unique == true) { %>
        <div class="content">
            <p>  Registration Successful. Click <a href="index.jsp">here</a> to proceed to the main page. </p>
        </div>
    </body>
    <%
    } else {
    %>
    <p> Sorry, the email address you inputted has already been registered with the movie store </p>
    <p>  Click <a href="register.jsp"> here </a> to go back with a different email. </p>
    <% }%>
</body>
</html>
