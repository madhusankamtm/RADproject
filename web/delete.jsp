<%-- 
    Document   : delete
    Created on : Nov 19, 2017, 9:05:41 AM
    Author     : Madhusanka
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Leave accept or reject</title>
    </head>
    <body>
        <div id="page">
        <%
           
            String id = request.getParameter("id");
            

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/leavemanagment", "root", "");
                Statement stmt = con.createStatement();
                String query1  = "SELECT * FROM leaverequest";
                ResultSet rs= stmt.executeQuery(query1);
                
                if(rs.next()){
                String query = "DELETE FROM leaverequest WHERE User_ID ='"+id+"'";
                stmt.executeUpdate(query);

                out.println("<p style='color:blue'>Sucessfully</p>");
               }
            } catch (Exception e) {
                out.println("<p> ERROR: " + e.getMessage() + "</p>");

            }

        %>
      </div>  
    </body>
</html>
