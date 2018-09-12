<%-- 
    Document   : searchAction
    Created on : 12/09/2018, 8:57:59 PM
    Author     : james
--%>

<%@page import="uts.wsd.SearchParam"%>
<%@page import="uts.controller.Validator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Action Page</title>
    </head>
    <body>
        <jsp:useBean id="searchParam" 
                     class="uts.wsd.SearchParam" scope="application">
                     </jsp:useBean>
        <%
            searchParam.emptyYears();
            searchParam.emptyGenre();
            searchParam.emptyGenre();
            searchParam.setTitle("");
            searchParam.setGenre("");
            String title = request.getParameter("title");
            String year1 = request.getParameter("year1");
            String year2 = request.getParameter("year2");
            String genre = request.getParameter("genre");
            Validator v = new Validator();
            boolean valid = true;
            boolean emptyYears = false;
            boolean emptyYear = false;
            if ((year1.trim().isEmpty() && year2.trim().isEmpty())) {
                emptyYears = true;
            } else if (v.validateYear(year1) && year2.trim().isEmpty()) {
                emptyYear= true;
            }
            else if (!v.validateYear(year1)) {
                    session.setAttribute("year1Err", "Year is invalid");
                    response.sendRedirect("index.jsp");
                    valid = false;
                } else if (!v.validateYear(year2)) {
                    session.setAttribute("year2Err", "Year is invalid");
                    response.sendRedirect("index.jsp");
                    valid = false;
                } else if (Integer.parseInt(year1) > Integer.parseInt(year2) || (year1.equals("") && year2.equals(""))) {
                    session.setAttribute("year1Err", "Format is incorrect");
                    response.sendRedirect("index.jsp");
                    valid = false;
                }
              
            int min = 0;
            int max = 0;
                if (valid) {
           if (!emptyYears && !emptyYear) {
                min = Integer.parseInt(year1);
                max = Integer.parseInt(year2);
           }
            
            if (title != null) {
                searchParam.setTitle(title);
            }
            if (genre != null){
                searchParam.setGenre(genre);
            }
            if (!emptyYears && !emptyYear) {
            for (; min <= max; min++) {
                searchParam.addYear(String.valueOf(min));
            } 
            } else if (emptyYear) {
                searchParam.addYear(year1);
            }
            response.sendRedirect("index.jsp");
                }
                
                
        %>
    </body>
</html>
