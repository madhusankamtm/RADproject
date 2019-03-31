++<%-- 
    Document   : login
    Created on : Nov 11, 2017, 11:12:25 PM
    Author     : Madhusanka
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
	<meta charset="UTF-8">
	<title>login - Business Solution Web Template</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
	<!--[if IE]>
		<link rel="stylesheet" href="css/ie.css" type="text/css" charset="utf-8">
	<![endif]-->
</head>
    <body>
                  
        <%
            String user_id = request.getParameter("User_ID");
            String password = request.getParameter("password");

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/leavemanagment", "root", "");
                Statement stmt = con.createStatement();
                String query = "SELECT * FROM new_employee WHERE User_ID='" + user_id + "' AND password='" + password + "'";
                ResultSet rs = stmt.executeQuery(query);

                if (rs.next()) {
                   session.setAttribute("uid",rs.getString("User_ID"));
                   response.sendRedirect("index.jsp");
                    
                }else{
                    out.println("<p style='color:blue'>Invalid Login</p>");
                }
            } catch (Exception e) {
                out.println("<p> ERROR: " + e.getMessage() + "</p>");

            }


        %>
        
    </body>
</html>
