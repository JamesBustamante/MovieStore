<%-- 
    Document   : checkout
    Created on : 10/09/2018, 9:35:51 PM
    Author     : WILL
--%>
<%@page import="uts.wsd.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <!--Grabs parameters from previous page-->
    <%String title = request.getParameter("title");%>
    <%String genre = request.getParameter("genre");%>
    <%String releaseDate = request.getParameter("releaseDate");%>
    <%String price = request.getParameter("price");%>
    <%String NoCopies = request.getParameter("NoCopies");%>
    <%String id = request.getParameter("id");%>
    
    <body>
        <%=id%>
        <% String filePath = application.getRealPath("WEB-INF/users.xml"); %>
        <jsp:useBean id="movieStoreUserApp" class="uts.wsd.MovieStoreUserApplication" scope="application">
        <jsp:setProperty name="movieStoreUserApp" property="filePath" value="<%=filePath%>"/>
            </jsp:useBean>
        
        <jsp:include page="header.jsp" />
        
        <h1>Checkout</h1>
        <!-- test data to ensure 1 selected movie is carried onto checkout page -->
        <p><%=title%> | <%=genre%> | <%=price%></p>        
        
        <form action="checkoutAction.jsp" method="POST">
            <table>
                <tr>
                    <td>
                        <input type="submit" value="Purchase"><br>
                        <input type="submit" value="Add Another Movie">
                        <input type="submit" value="Remove Moive"> <!-- later incorporate X button inline with movie -->
                        <input type="submit" value="Delete Order">
                    </td>
                </tr>
            </table>            
        </form>
    </body>
</html>
