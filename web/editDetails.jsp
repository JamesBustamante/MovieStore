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
        <h2 style="text-align: center">Edit Account Details</h2>
        <form action="editDetails.jsp">
            <table>
                <tr>
                    <td>Email</td>
                    <td><input type="text" name="email" value="<%= user.getEmail()%>"></td>
                </tr>
                <input type="hidden" name="updated" value="updated">
            </table>
        </form>
        <%
            if(request.getParameter("update") != null){
                user.setEmail(request.getParameter("email"));
            }
        %>
    </body>
</html>
