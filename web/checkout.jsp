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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <!--Grabs parameters from previous page-->
    <%
    //String title = request.getParameter("title");
    //String genre = request.getParameter("genre");
    //String releaseDate = request.getParameter("releaseDate");
    //String price = request.getParameter("price");
    //String NoCopies = request.getParameter("NoCopies");
    //String id = request.getParameter("id");
    
    //This gives the name of the movie selected. You can then find all the other info
    //associated with that movie by doing a for loop that matches the movie title
    %>
    
    
    <body>
        
        <% String filePath = application.getRealPath("WEB-INF/users.xml"); %>
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
        
        <div style = "text-align: center;">
            <jsp:include page="displayOrder.jsp" flush="true" />
        </div>
        <jsp:include page="endNote.jsp" />
    </body>
</html>
