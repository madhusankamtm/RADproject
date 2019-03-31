<%-- 
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
        <title>reject - Business Solution Web Template</title>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <!--[if IE]>
                <link rel="stylesheet" href="css/ie.css" type="text/css" charset="utf-8">
        <![endif]-->
    </head>
    <body>

        <%
            String id = request.getParameter("id");
            
            String abc = "reject";

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/leavemanagment", "root", "");
                Statement stmt = con.createStatement();
               
                 String query = "UPDATE leave_approval SET acept = '" + abc + "' WHERE emp_ID ='" + id + "'";
                int a = stmt.executeUpdate(query);

                if (a > 0) {
                    out.println("<p style='color:blue'>Sucessfully Rejected</p>");
                    String query1= "DELETE FROM leaverequest WHERE User_ID ='"+id+"'";
                   stmt.executeUpdate(query1);
                    } else {
                        out.println("<p style='color:blue'>Almost Done</p>");
                    }
                  

            } catch (Exception e) {
                out.println("<p> ERROR: " + e.getMessage() + "</p>");

            }

             
        %>

    </body>
</html>
