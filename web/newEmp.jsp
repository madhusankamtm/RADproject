
<%-- 
    Document   : newEmp
    Created on : Nov 12, 2017, 5:37:59 PM
    Author     : Madhusanka
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>newEmp - Leave managment System</title>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <!--[if IE]>
                <link rel="stylesheet" href="css/ie.css" type="text/css" charset="utf-8">
        <![endif]-->
    </head>
    
    <body>
        <%

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
                String query = "INSERT INTO new_employee (User_ID,emp_name,password,emp_type,designation,department,dob,email,contact)"
                        + "VALUES('" + user_id + "','" + emp_name + "','" + password + "','" + emptype + "','" + designation + "','" + department + "','" + dob + "','" + email + "','" + contact + "')";
                int a = stmt.executeUpdate(query);
                if (a > 0) {
                    out.println("<p style='color:blue'>Sucessfully added</p>");
                   
                }
                
            } catch (Exception e) {
                out.println("<p> ERROR: " + e.getMessage() + "</p>");
            }
            
        %>
    </body>
</html>
