<%-- 
    Document   : feedback
    Created on : Nov 18, 2017, 9:15:25 PM
    Author     : DELL
--%>




<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>feedback</title>
    </head>
    <body>
        <%
            String name=request.getParameter("name");
            int contactnumber=request.getIntHeader("contactnumber");
            String emailaddress=request.getParameter("emailaddress");
            String gender=request.getParameter("gender");
            String comments=request.getParameter("comments");
           
             try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/leavemanagment", "root", "");
                Statement stmt = con.createStatement();
                String query = "INSERT INTO feedback(name,contactnumber,emailaddress,gender,comments)"
                        + "VALUES('" + name + "','" + contactnumber+ "','" + emailaddress + "','" + gender+ "','" + comments + "')";
                int a = stmt.executeUpdate(query);
                if (a > 0) {
                    out.println("<p>Sucessfully saved.Thank you for being with us...</p>");
                }
            } catch (Exception e) {
                out.println("<p> ERROR: " + e.getMessage() + "</p>");
            }           
  
            %>
    </body>
</html>
