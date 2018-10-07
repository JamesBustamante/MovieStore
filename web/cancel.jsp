<%-- 
    Document   : cancel
    Created on : 05/09/2018, 6:31:35 PM
    Author     : james
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cancel Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp"  flush="true"/>
        <div class="content">
            <form action="main.jsp" style="text-align: center">
                <h2>Are you sure you want to cancel this order?</h2>
                <input type="submit" value="Yes"/>                
                <input type="submit" value="No"/>
            </form>
        </div>
        <h1></h1>
    </body>
</html>
