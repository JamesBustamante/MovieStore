<%-- 
    Document   : searchAction
    Created on : 12/09/2018, 8:57:59 PM
    Author     : james
--%>

<%@page import="uts.wsd.YearsCalc"%>
<%@page import="uts.controller.Validator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Action Page</title>
    </head>
    <body>
        <jsp:useBean id="yearsCalc" 
                     class="uts.wsd.YearsCalc" scope="application">
                     </jsp:useBean>
        <%
            String year1 = request.getParameter("year1");
            String year2 = request.getParameter("year2");
            Validator v = new Validator();
            try {
                if (!v.validateYear(year1)) {
                    session.setAttribute("year1Err", "Year is invalid");
                    response.sendRedirect("index.jsp");
                } else if (!v.validateYear(year2)) {
                    session.setAttribute("year2Err", "Year is invalid");
                    response.sendRedirect("index.jsp");
                } else if (Integer.parseInt(year1) > Integer.parseInt(year2)) {
                    session.setAttribute("year1Err", "Format is incorrect");
                    response.sendRedirect("index.jsp");
                }
            } catch (Exception e) {
                session.setAttribute("year1Err", "Format is incorrect");
                response.sendRedirect("index.jsp");
            }
            int min = Integer.parseInt(year1);
            int max = Integer.parseInt(year2);
            yearsCalc.emptyYears();
            
            for (; min <= max; min++) {
                yearsCalc.addYear(String.valueOf(min));
            }
                response.sendRedirect("index.jsp");

        %>
    </body>
</html>
