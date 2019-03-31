<%-- 
    Document   : update
    Created on : Nov 19, 2017, 1:50:36 PM
    Author     : Madhusanka
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Page</title>
    </head>
    <body>
        <%
            String user = session.getAttribute("uid").toString();
            
            String emp_name = request.getParameter("Employee_Name");
            String user_id = request.getParameter("User_ID");
            String password = request.getParameter("Password");
            String emptype = request.getParameter("Employee Type");
            String designation = request.getParameter("Designation");
            String department = request.getParameter("Department");
            String dob = request.getParameter("Date of Birth");
            String email = request.getParameter("Email");
            String contact = request.getParameter("Contact");

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/leavemanagment", "root", "");
                Statement stmt = con.createStatement();
                String query = "UPDATE new_employee SET User_ID = '"+user_id+"',emp_name='"+emp_name+"',password='"+password+"',emp_type='"+emptype+"',designation='"+designation+"',department='"+department+"',dob='"+dob+"',email='"+email+"',contact='"+contact+"' WHERE User_ID='"+user+"'";
                int a = stmt.executeUpdate(query);
                if (a > 0) {
                    out.println("<p style='color:blue'>Sucessfully Updated</p>");
                    
                }
                
            } catch (Exception e) {
                out.println("<p> ERROR: " + e.getMessage() + "</p>");
            }
             
        %>
        
    </body>
</html>
