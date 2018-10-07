<%-- 
    Document   : editDetails
    Created on : 03/10/2018, 1:37:33 AM
    Author     : Ciaran
--%>

<%@page import="uts.wsd.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        User user = (User)session.getAttribute("user");
        //Account page (when logged in): users can edit and update their details, 
        //data is updated in users.xml (+2), users can cancel their account with OMS , 
        //submitted orders by this user are cancelled but stored in history.xml, purchased movies 
        //are returned (+4) 


    %>
    
    <body style="text-align: center">
        <h2 style="text-align: center">Account Details</h2>
        <form action="editDetails.jsp">
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
                </tr>
                <input type="hidden" name="updated" value="updated">
            </table>
                <div style="text-align: center">
                <input type="submit" value="Save Changes"/>
                </div>
        </form>
        <%
            if(request.getParameter("updated") != null){
                user.setEmail(request.getParameter("email"));
                %><p>Changes Saved</p><%                
            }
            
            
        %>
    </body>
</html>
