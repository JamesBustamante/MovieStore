<%-- 
    Document   : editDetails
    Created on : 03/10/2018, 1:37:33 AM
    Author     : Ciaran
--%>

<%@page import="uts.wsd.Users"%>
<%@page import="uts.wsd.User"%>
<%@page import="uts.wsd.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%-- This bean takes the information from the xml file provided in the filepath--%>
    <%String filePath = application.getRealPath("WEB-INF/users.xml");%>
    <jsp:useBean id="movieStoreUserApp" class="uts.wsd.MovieStoreUserApplication" scope="application">
        <jsp:setProperty name="userApp" property="filePath" value="<%=filePath%>"/>
    </jsp:useBean>
    <%
        //Gets the user object of the currently logged in user
        User user = (User)session.getAttribute("user");
        //Users users = userApp.getUsers();
        //Account page (when logged in): users can edit and update their details, 
        //data is updated in users.xml (+2), users can cancel their account with OMS , 
        //submitted orders by this user are cancelled but stored in history.xml, purchased movies 
        //are returned (+4) 


    %>
    <body style="text-align: center">
        <h2 style="text-align: center">Account Details</h2>
        <%-- This form takes the information entered in to the fields and updates them--%>
        <form action="editDetails.jsp" method="POST">
            <table class="content p table">
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="name" value="<%= user.getfullName()%>"></td>
                    <td>Password</td>
                    <td><input type="password" name="password" value="<%= user.getPassword()%>"></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="text" name="email" value="<%= user.getEmail()%>"></td>
                    <td>Address</td>
                    <td><input size="16" type="text" name="address" value="<%= user.getAddress()%>"></td>                    
                </tr>
                <tr>
                    <td>Phone Number</td>
                    <td><input size="16" type="text" name="phone" value="<%= user.getPhone()%>"></td>
                    <td><input type="hidden" name="updated" value="updated"/></td>
                    <td><input type="submit" value="Save Changes"/></td>
                    <input type="hidden" name="updated" value="updated"/>
                </tr>
                
            </table>
        </form>
        <div style="text-align: left">
            <%-- This form allows the user to remove their account from the system--%>
            <form action="cancelAccount.jsp">
                <input type="submit" name="cancel" value="X Remove Account X"/>
            </form>
        </div>                     
        <% //This handles the details that are updated
            if(request.getParameter("updated") != null){
                user.setEmail(request.getParameter("email"));
                user.setFullName(request.getParameter("name"));
                user.setPassword(request.getParameter("password"));
                user.setAddress(request.getParameter("address"));
                user.setPhone(request.getParameter("phone"));
                Users users = movieStoreUserApp.getUsers();
                users.getIDUser(user.getID()).setEmail(request.getParameter("email"));
                users.getIDUser(user.getID()).setFullName(request.getParameter("name"));
                users.getIDUser(user.getID()).setPassword(request.getParameter("password"));
                users.getIDUser(user.getID()).setAddress(request.getParameter("address"));
                users.getIDUser(user.getID()).setPhone(request.getParameter("phone"));
                movieStoreUserApp.updateXML(users, filePath);
                

                %><p>Changes Saved</p><%                
            }   
        %>         
    </body>
</html>
