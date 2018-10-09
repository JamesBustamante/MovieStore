<%-- 
    Document   : purchaseOrderCheck
    Created on : 09/10/2018, 8:39:49 PM
    Author     : William
--%>
<%@page import="uts.controller.Validator"%>
<%@page import="java.util.*"%>
<%@page import="uts.wsd.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Purchase Order Check Page</title>
    </head>
    <body>
        <%
            String[] noCopies = request.getParameterValues("noCopies");

            Validator v = new Validator();
            int i = 0;
            for (String copy : noCopies) {
                if (!v.validateQuantity(copy)) {
                    session.setAttribute("quantityErr", "Quantity format incorrect, only numbers allowed!");
                    response.sendRedirect("purchaseOrder.jsp");
                    i++;
                }                 
                else if (noCopies.length == i) {
                    response.sendRedirect("checkoutAction.jsp");
                }
            }            
        %>
    </body>
</html>
