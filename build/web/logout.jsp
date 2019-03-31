<%-- 
    Document   : logout
    Created on : Nov 17, 2017, 11:03:17 PM
    Author     : Madhusanka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        session.invalidate();
        response.sendRedirect("index.html");
        %>
    </body>
</html>
