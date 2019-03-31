<%-- 
    Document   : aprove
    Created on : Nov 20, 2017, 1:08:34 AM
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
        <title>JSP Page</title>
    </head>
    <body>
        <%
            
            String userid = request.getParameter("id");
            String ename = request.getParameter("ename");
            String etype = request.getParameter("etype");
            String designation = request.getParameter("designation");
            String department = request.getParameter("department");
            String typeleave = request.getParameter("typeleave");
            String leavefrom = request.getParameter("leavefrom");;
            String leaveto = request.getParameter("leaveto");
            int totdays = request.getIntHeader("tot");
            String acept = request.getParameter("acept");

          
            try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/leavemanagment", "root", "");
            Statement stmt = con.createStatement();
            String query1 = "select acept fom leaverequest";
          

            String query = "INSERT INTO leave_approval(emp_ID,emp_name,emp_type,designation,department,type_leave,leave_from,leave_to,total_days)"
                    + "VALUES('" + userid + "','" + ename + "','" + etype + "','" + designation + "','" + department + "','" + typeleave + "','" + leavefrom + "','" + leaveto + "','" + totdays + "')";
            int a = stmt.executeUpdate(query);
            if (a > 0) {
                out.println("<p>sucess</p>");
               

            }
            
            }catch(Exception e){
            out.println(""+e.getMessage());
            }

        %> 


    </body>
</html>
