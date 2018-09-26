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
        <title>Checkout Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="/MovieStore/CSS/main.css">
    </head>
    <body>        
        <% String filePath = application.getRealPath("WEB-INF/movies.xml"); %>
        <jsp:useBean id="movieStoreUserApp" class="uts.wsd.MovieStoreUserApplication" scope="application">
        <jsp:setProperty name="movieStoreUserApp" property="filePath" value="<%=filePath%>"/>
            </jsp:useBean>        
        <jsp:include page="header.jsp" />
        
        <%
            String id = request.getParameter("id");            
            History history = new History();
            history.getOrderIDMatch(id);
        %>      
        
        <!--<form action="checkoutAction.jsp" method="get">
         
        </form>-->
        
        <div class="content">
            <table align ="center">
                <tr><td><input type="button" onclick="location.href='index.jsp'" value="Choose Another Movie"></td></tr>
                <!--<tr><td><input type="button" value="Purchase Order"></td></tr>-->
                <tr><td><input type="button" value="Cancel Order"></td></tr>
            </table>            
            <!-- Display the checkout orders -->
            <jsp:include page="displayCheckout.jsp" flush="true" />            
            
            <!-- Display the final order -->
            <jsp:include page="displayOrder.jsp" flush="true" />            
        </div>
        <jsp:include page="endNote.jsp" />
    </body>
</html>
