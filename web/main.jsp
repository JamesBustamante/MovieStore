<%-- 
    Document   : main
    Created on : 05/09/2018, 6:31:03 PM
    Author     : james
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp"  flush="true"/>
        
        <form>
            <table>
                <tr><td><h1>Order History</h1></td>
                <td><h1><a href="cancel.jsp">Click here to cancel an order</a></h1></td></tr>
                <tr>
                    <td>
                        <div style = "text-align: center;">
                            <jsp:include page="displayOrder.jsp" flush="true" />
                        </div>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
