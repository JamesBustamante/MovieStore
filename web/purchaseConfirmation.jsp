<%-- 
    Document   : purchaseConfirmation
    Created on : 29/09/2018, 11:38:33 PM
    Author     : WILL
--%>

<%@page import="uts.wsd.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="uts.wsd.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/main.css"> 
        <title>Import</title>
    </head>
    <body>

          <jsp:useBean id="multiMovieOrder" 
                     class="uts.wsd.MultiMovieOrder" scope="session">
        </jsp:useBean>
        
         <% String filePath1 = application.getRealPath("WEB-INF/history.xml");%>

        <jsp:useBean id="historyApp" class="uts.wsd.HistoryApplication" scope="application">
            <jsp:setProperty name="historyApp" property="filePath" value="<%=filePath1%>"/>
        </jsp:useBean>
         
         <% String filePath = application.getRealPath("WEB-INF/users.xml");%>
        <jsp:useBean id="movieStoreUserApp" class="uts.wsd.MovieStoreUserApplication" scope="application">
            <jsp:setProperty name="movieStoreUserApp" property="filePath" value="<%=filePath%>"/>
        </jsp:useBean>

        

        <div class="content">
            <p>  <% multiMovieOrder.movies.clear(); 
          
            User user = (User) session.getAttribute("user");
            out.print("test");
              ArrayList<Order> orders = historyApp.getHistory().getHistory();
              for (Order order : orders) {
                  out.print(order.getOrderID() + "   " + order.getFullName());
              }

          %></p>
            <div style="text-align: center;">
                <h1>Order Purchase Successful!</h1>
                <p>Your order purchase was successful. Click <a href="index.jsp"> here</a> to return to the main page.</p>
            </div>
        </div>
        <jsp:include page="endNote.jsp" />
    </body>
</html>
