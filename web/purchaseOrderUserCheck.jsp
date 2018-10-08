<%-- 
    Document   : purchaseOrderUserCheck
    Created on : 07/10/2018, 9:13:10 PM
    Author     : William
--%>
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
        
        <% User user = (User) session.getAttribute("user");
            if (user != null) {
                response.sendRedirect("purchaseOrder.jsp");
            } else { %> 
            
                <div style="text-align: center;">
                    <form action="purchaseOrder.jsp" method="get">
                        <p>
                            <jsp:include page="login.jsp" />           
                            <div class="content">
                            You must be logged in before continuing with your purchase. 
                            Please log in at the top of the page.
                            <%
                                if (user != null) {
                                    response.sendRedirect("purchaseOrder.jsp");
                                }
                            %>
                        </p>                         
                    </form>
                </div>
            </div>
            <% }%>  
    </body>
</html>
