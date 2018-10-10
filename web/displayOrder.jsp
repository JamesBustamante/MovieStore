<%-- 
    Document   : displayOrder
    Created on : 14/09/2018, 2:49:30 AM
    Author     : Ciaran
--%>
<%@page import="uts.wsd.rest.HistoryService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<%@page import="uts.wsd.*"%>
<%@page import="java.util.*"%>

<%-- This bean takes the information from the xml file provided in the filepath--%>
<% String filePath1 = application.getRealPath("WEB-INF/history.xml"); %>
    <jsp:useBean id="historyApp" class="uts.wsd.HistoryApplication" scope="application">
        <jsp:setProperty name="historyApp" property="filePath" value="<%=filePath1%>"/>
    </jsp:useBean>

    <% 
    User user = (User)session.getAttribute("user");
    History history = historyApp.getHistory();
    ArrayList<Order> matches = history.getHistory();
    String id = user.getID();
    %>
    
    <%-- This loops through the entire xml file and uses orderHistory.xsl to transform it--%>
    <c:set var="xmltext">
        <history>
            <% for(Order order : matches) {%>
            <%if(id.equals(order.getID())) {%>
            <order>
                <orderID><%= order.getOrderID() %></orderID>
                <orderStatus><%= order.getOrderStatus() %></orderStatus>
                <!--This loops through every purchase on an order and displays it-->
                <%for(MoviePurchase purchase : order.getPurchases()){%>
                    <purchases>
                        <moviePurchase>
                            <title><%= purchase.getTitle()%></title>
                            <genre><%= purchase.getGenre()%></genre>
                            <releaseDate><%= purchase.getReleaseDate()%></releaseDate>
                            <price><%= purchase.getPrice()%></price>
                            <NoCopies><%= purchase.getNoCopies()%></NoCopies>
                        </moviePurchase>
                    </purchases>
                <%}%>                                
            </order>
            <%}%>
            <%}%>
        </history>
    </c:set>
<c:import url = "orderHistory.xsl" var = "xslt"/>
<x:transform xml = "${xmltext}" xslt = "${xslt}"></x:transform>