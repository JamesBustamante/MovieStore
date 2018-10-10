<%-- 
    Document   : cancelAccount
    Created on : 10/10/2018, 1:26:20 AM
    Author     : Ciaran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cancel Account</title>
        <link rel="stylesheet" href="CSS/main.css">
    </head>
    <body>
        <jsp:include page="header.jsp"  flush="true"/><%-- The header page which is consistent across all pages--%>
        <div class="content" style="text-align: center"><%-- CSS class that contains all the elements of the page--%>
            <h2>Are you sure you wan't to remove your account?</h2>
            <%-- This form checks what button user clicks and directs user to another jsp page--%>
            <form action="cancelAccountAction.jsp" style="text-align: center">
                <table style="text-align: center">
                    <tr>
                        <td><input type="submit" name="yes" value="Yes"</td>
                        <td><input type="submit" name="no" value="No"</td>
                    </tr>
                </table>
            </form>
        </div>
        <jsp:include page="endNote.jsp"/>
    </body>
</html>
