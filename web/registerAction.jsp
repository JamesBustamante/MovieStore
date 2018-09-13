<%--
    Document   : registerAction
    Created on : Aug 14, 2018, 10:13:06 PM
    Author     : George
--%>

<%@page import="java.util.*"%>
<%@page import="uts.controller.*"%>
<%@page import="uts.wsd.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Action Page</title>
    </head>
    <body>
        
        

        <%
            
             int key = (new Random()).nextInt(9999);
            String id = "" + key;
           String fullName = request.getParameter("fullName");
           String email = request.getParameter("email");
           String password = request.getParameter("password");
           String gender = request.getParameter("gender");
           String phone = request.getParameter("phone");
           String address = request.getParameter("address");
           String tos = request.getParameter("tos");

//            Validator v = new Validator();

//            if (!v.validateName(fullName)) {
//                session.setAttribute("nameErr", "Name format is incorrect!");
//                    response.sendRedirect("register.jsp");
//                } else if (!v.validatePassword(password)) {
//                    session.setAttribute("passErr", "Password format is incorrect");
//                    response.sendRedirect("register.jsp");
//                } else if (!v.validateEmail(email)) {
//                    session.setAttribute("emailErr", "Email format is incorrect");
//                    response.sendRedirect("register.jsp");
//            } else {
                User user = new User(id, email, password, fullName, phone, address, gender);
                session.setAttribute("user", user);
                session.setAttribute("tos", tos);
                response.sendRedirect("welcome.jsp");
           // }
        %>
    </body>
</html>
