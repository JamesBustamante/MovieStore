<%-- 
    Document   : checkoutAction
    Created on : 11/09/2018, 9:37:07 PM
    Author     : WILL
--%>
<%@page import="java.util.Random"%>
<%@page import="uts.wsd.Order"%>
<%@page import="uts.wsd.History"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>    
    <body>
        <% String filePath = application.getRealPath("WEB-INF/history.xml");%>
        <jsp:useBean id="historyApp" class="uts.wsd.HistoryApplication" scope="application">
            <jsp:setProperty name="historyApp" property="filePath" value="<%=filePath%>"/>
        </jsp:useBean>
        
        <%  
           //int rndOrderID = (new Random()).nextInt(999); 
            
            
            
            //Order newOrder = new order();
            //History history = historyApp.getHistory();
            //history.addOrder(newOrder); //Uses addOrder function to add new order.
            //historyApp.updateXML(history, filePath); //Saves the order in XML.
        %>
        
        
    </body>
</html>
