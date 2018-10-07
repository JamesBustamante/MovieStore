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
        <link rel="stylesheet" href="CSS/main.css">
    </head>
    <body>        
        <% String filePath = application.getRealPath("WEB-INF/movies.xml");%>
        <jsp:useBean id="movieStoreUserApp" class="uts.wsd.MovieStoreUserApplication" scope="application">
            <jsp:setProperty name="movieStoreUserApp" property="filePath" value="<%=filePath%>"/>
        </jsp:useBean>        
        <jsp:include page="header.jsp" />
        
        <jsp:useBean id="multiMovieOrder" 
                     class="uts.wsd.MultiMovieOrder" scope="session">
        </jsp:useBean>

        <div class="content">
            <div style="text-align: center;">
                <table>   
                    <!-- Display the checkout orders -->
                    <jsp:include page="displayCheckout.jsp" flush="true" />
                    <input type="button" onclick="location.href = 'index.jsp'" value="Choose Another Movie">              
                    <input type="button" value="Cancel Order">
                    <form action="purchaseOrder.jsp" method="get"> <!--Creates the button to purchase the order.-->
                        <input type="hidden" name="id" value="{title}"/>
                        <input type="submit" value="Purchase Order" name="purchaseOrder"/>
                    </form>
                </table>    
            </div>
        </div>
        <jsp:include page="endNote.jsp" />
    </body>
</html>
