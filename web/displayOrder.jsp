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

<jsp:useBean id="orderApp" class="uts.wsd.OrderApplication" scope="application">
    <jsp:setProperty name="orderApp" property="filePath" value="<%=filePath1%>"/>
</jsp:useBean>

<% Orders orders = orderApp.getOrder();
ArrayList<Order> matches = orders.getList();%>

<c:set var="xmltext">
    <%for (Order order : matches){ %>
    <order>
        <orderID><%= order.getOrderID()%></orderID>
<!--        More information about the order needs to go here.
        Do we display the orders by User ID? or are we displaying the ID based off user id?-->
    </order>
</c:set>

<!--Need to do XSLT--> 
