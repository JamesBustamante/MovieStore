<%-- 
    Document   : displayOrder
    Created on : 14/09/2018, 2:49:30 AM
    Author     : Ciaran
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<%@page import="uts.wsd.*"%>
<%@page import="java.util.*"%>

<% String filePath1 = application.getRealPath("WEB-INF/history.xml"); %>
    <jsp:useBean id="historyApp" class="uts.wsd.HistoryApplication" scope="application">
        <jsp:setProperty name="historyApp" property="filePath" value="<%=filePath1%>"/>
    </jsp:useBean>

    <% 
    History history = historyApp.getHistory();
    String email = request.getParameter("email");
    ArrayList<Order> matches = history.getHistory();
    %>
    
    <c:set var="xmltext">
        <history>
            <% for(Order order : matches) {%>
            <order>              
                <orderID><%= order.getOrderID() %></orderID>
                <!--This loops through every purchase on an order and displays it-->
                <% //for(MoviePurchase purchase : order.getPurchases()){%>
                <% //}%>
                <ID><%= order.getID() %></ID>
                <email><%= order.getEmail() %></email>
                <fullName><%= order.getFullName() %></fullName>
                <paymentMethod><%= order.getPaymentMethod() %></paymentMethod>
                <salesTotal><%= order.getSalesTotal()%></salesTotal>
                <orderStatus><%= order.getOrderStatus()%></orderStatus>
            </order>
            <%}%>
        </history>
    </c:set>
    <p><%= email%></p>
<c:import url = "orderHistory.xsl" var = "xslt"/>
<x:transform xml = "${xmltext}" xslt = "${xslt}"></x:transform>