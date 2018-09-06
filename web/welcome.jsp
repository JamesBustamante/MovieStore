<%-- 
    Document   : Welcome
    Created on : 01/09/2018, 4:48:26 PM
    Author     : Alex
--%>

<%@page import="java.util.Random"%>
<%@page import="uts.wsd.MovieStoreApplication"%>
<%@page import="uts.wsd.User"%>
<%@page import="uts.wsd.Users"%>
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
        
         <%!  boolean unique = false; %>
         <%  Users users = movieStoreApp.getUsers();
        User user = (User) session.getAttribute("user");
        String tos = (String) session.getAttribute("tos");
                   
                    if (user == null) {
                    out.print("FOund");
                    unique = false;
                    } else {
                        users.addUser(user);
                        movieStoreApp.updateXML(movieStoreApp.getUsers(), filePath);
                        movieStoreApp.saveUsers();
                        unique = true; 
                        out.print(users.getList());
                        //diaryApp.setFilePath(filePath);
           %>
           <% } %>
           
           <% if (tos == null ) {  //Tos is either "check" or null
                                                    //Shows one or the other
             %>
    <body>
                <p> Sorry, you must agree to the Terms of Service. </p>
                <p>  Click <a href="register.jsp"> here </a> to go back. </p>
                </body>
            </body>
            <% } else if (unique == true) { %>
            <p>  Click <a href="index.jsp"> here </a> to proceed to the main page. </p>
            </body>
                <%
                    } else {
                    %>
                    <p> Sorry, the email address you inputted has already been registered with the movie store </p>
                    <p>  Click <a href="register.jsp"> here </a> to go back with a different email. </p>
                    <% } %>
        
    </body>
</html>
