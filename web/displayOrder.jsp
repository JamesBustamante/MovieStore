<%-- 
    Document   : displayOrder
    Created on : 14/09/2018, 2:49:30 AM
    Author     : Ciaran
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<%@page import="uts.wsd.*"%>
<%@page import="java.util.*"%>

<% String filePath1 = application.getRealPath("WEB-INF/history.xml");%>
    <jsp:useBean id="historyApp" class="uts.wsd.HistoryApplication" scope="application">
        <jsp:setProperty name="historyApp" property="filePath" value="<%=filePath1%>"/>
    </jsp:useBean>

    <% 
    History history = historyApp.getHistory();
    String id = request.getParameter("id");
    ArrayList<Order> matches = history.getHistory();

    int rndOrderID = (new Random()).nextInt(999);
    %>
    
    <c:set var="xmltext">
        <h2>WORKING</h2>
        <history>
            <order>
                <orderID><%= matches.get(0).getID()%></orderID>
            </order>
        </history>
    </c:set>
<c:import url = "orderHistory.xsl" var = "xslt"/>
<x:transform xml = "${xmltext}" xslt = "${xslt}"></x:transform>