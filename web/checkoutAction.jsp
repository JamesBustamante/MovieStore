<%-- 
    Document   : checkoutAction
    Created on : 11/09/2018, 9:37:07 PM
    Author     : WILL
--%>
<%@page import="uts.wsd.Order"%>
<%@page import="uts.wsd.Orders"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>    
    <body>
        <!--Grabs parameters from previous page-->
        <%String title = request.getParameter("title");%>
        <%String genre = request.getParameter("genre");%>
        <%String releaseDate = request.getParameter("releaseDate");%>
        <%String price = request.getParameter("price");%>
        <%String NoCopies = request.getParameter("NoCopies");%>

        <% String filePath = application.getRealPath("WEB-INF/history.xml");%>
        <jsp:useBean id="orderApp" class="uts.wsd.OrderApplication" scope="application">
            <jsp:setProperty name="orderApp" property="filePath" value="<%=filePath%>"/>
        </jsp:useBean>
        
        <%  
            int rndOrderID = 0; /**Random 3 digit number, to be coded still**/ 
            Order newOrder = new Order(rndOrderID, title, genre, releaseDate, price, NoCopies);
            Orders orders = orderApp.getOrder();
            orders.addOrder(newOrder); //Uses addOrder function to add new order.
            orderApp.updateXML(orders, filePath); //Saves the order in XML.
        %>
        
        
    </body>
</html>
