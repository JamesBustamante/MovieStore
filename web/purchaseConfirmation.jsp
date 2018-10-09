<%-- 
    Document   : purchaseConfirmation
    Created on : 29/09/2018, 11:38:33 PM
    Author     : William
--%>


<%@page import="uts.wsd.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/main.css"> 
        <title>Import</title>
    </head>
    <body>
        <% String filePath = application.getRealPath("WEB-INF/users.xml");%>
        <% String filePath1 = application.getRealPath("WEB-INF/history.xml");%>
        <jsp:useBean id="movieStoreUserApp" class="uts.wsd.MovieStoreUserApplication" scope="application">
            <jsp:setProperty name="movieStoreUserApp" property="filePath" value="<%=filePath%>"/>
        </jsp:useBean>
        <jsp:useBean id="historyApp" class="uts.wsd.HistoryApplication" scope="application">
            <jsp:setProperty name="historyApp" property="filePath" value="<%=filePath1%>"/>
        </jsp:useBean>
        <jsp:useBean id="multiMovieOrder" 
                     class="uts.wsd.MultiMovieOrder" scope="session">
        </jsp:useBean>
        <jsp:include page="header.jsp" /> 

        <div class="content">
            <p>  
                <% multiMovieOrder.movies.clear();
                ArrayList<MoviePurchase> tempMoviePurchaseAL = new ArrayList<MoviePurchase>();
                User user = (User) session.getAttribute("user");
                ArrayList<Order> orders = historyApp.getHistory().getHistory();
                //ArrayList<MoviePurchase> movies = historyApp.getHistory().getHistory();
                Order newOrder = new Order("ffm", tempMoviePurchaseAL, "sd", "dd", "test", "dd", "dd", "Submitted");
                History history = historyApp.getHistory();
                history.addOrder(newOrder); //Uses addOrder function to add new order.
                historyApp.updateXML(history, filePath1); //Saves the order in XML.
                for (Order order : orders) {
                    out.print("   orderid: " + order.getOrderID());
                    out.print("   id: " + order.getFullName());
                    out.print("   movies " + order.getPurchases().size());
                }

                %>
            </p>
            <div style="text-align: center;">
                <h1>Order Purchase Successful!</h1>
                <p>Your order purchase was successful. Click <a href="index.jsp"> here</a> to return to the main page.</p>
            </div>
        </div>
        <jsp:include page="endNote.jsp" />
    </body>
</html>
