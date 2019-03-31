<%-- 
    Document   : leave_approval
    Created on : Nov 13, 2017, 11:15:45 PM
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
        <title>Leave approval- Leave managment System</title>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <!--[if IE]>
                <link rel="stylesheet" href="css/ie.css" type="text/css" charset="utf-8">
        <![endif]-->
    </head>
    <body>
        <div id="page">
            <div id="header"><p>
                     <a href="index.html" id="logo"><img src="images/logo1.png" alt="LOGO" ></a>
                </p>
                <ul  id="navigation">

                    <li>
                        <a href="index.html" title="Home"></a>
                    </li>
                    <li>
                        <a href="leave_approval.jsp">Leave Request</a>
                    </li>
                    <li >
                        <a href="newStaff.jsp">Create New Staff </a>
                    </li>
                     <li >
                        <a href="leaver.jsp">Feedback </a>
                    </li>

                    <%if (session.getAttribute("uid") != null) {%>
                    <li class="last-child">
                    <a href="index.html">Logout</a> </li>
                    <%}else{%>
                    
                     <%}%>

                </ul>

                <%

                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/leavemanagment", "root", "");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT User_ID,emp_name,Emp_type,Designation,Department,type_of_leave,date_request,leave_from,leave_to,total_days FROM leaverequest");


                %>


                <div id="adbox">
                    <font color="white">
                    <p align="center"><b>Leave Request</b></p>
                    
                    <table border="0">
                         <% if (rs.next()) {%> 
                        <tr><th><td>User ID </td><td><input type="text" name="id" value="<%= rs.getString(1)%>"disabled="disabled" size="30" /></td></th>
                            <tr><th><td>Employee Name</td><td><input type="text" name="ename" value="<%= rs.getString(2)%>"disabled="disabled" size="30" /></td></th>
                            <tr><th><td>Employee Type</td><td><input type="text" name="etype" value="<%= rs.getString(3)%>"disabled="disabled" size="30" /></td></th>
                            <tr><th><td>Designation</td><td><input type="text" name="designation" value="<%= rs.getString(4)%>"disabled="disabled" size="30" /></td></th>
                            <tr><th><td>Department</td><td><input type="text" name="department" value="<%= rs.getString(5)%>"disabled="disabled" size="30" /></td></th>
                            <tr><th><td>Type of leave</td><td><input type="text" name="typeleave" value="<%= rs.getString(6)%>"disabled="disabled" size="30" /></td></th>
                            <tr><th><td>Date Request</td><td><input type="text" name="daterequ" value="<%= rs.getString(7)%>"disabled="disabled" size="30" /></td></th>
                            <tr><th><td>Leave From</td><td><input type="text" name="leavefrom" value="<%= rs.getString(8)%>"disabled="disabled" size="30" /></td></th>
                            <tr><th><td>Leave To</td> <td><input type="text" name="leaveto" value="<%= rs.getString(9)%>"disabled="disabled" size="30" /></td></th>
                            <tr><th><td>Total Days</td><td><input type="text" name="tot" value="<%= rs.getString(10)%>"disabled="disabled" size="30" /></td></th> 
                            <tr><th><td></td></th> </tr>

                        <tr><th>
                             <td></td>
                            <td> 
                        
                                <a href ="accept.jsp?id=<%= rs.getString(1)%>"><input type="submit"  value="Accept" name="acept" /></a>
                                <a href ="reject.jsp?id=<%= rs.getString(1)%>"><input type="submit" value="Reject" name="reject" /></a></td> 
                                 
                          <th>   
                        </tr>
                           
                        </form>
                      
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
           userid = rs.getString(1);
            ename = rs.getString(2);
            etype = rs.getString(3);
            designation =rs.getString(4);
            department = rs.getString(5);
            typeleave = rs.getString(6);
            leavefrom = rs.getString(8);
            leaveto = rs.getString(9);
            totdays =rs.getInt(10);
           
            String query = "INSERT INTO leave_approval(emp_ID,emp_name,emp_type,designation,department,type_leave,leave_from,leave_to,total_days)"
                    + "VALUES('" + userid + "','" + ename + "','" + etype + "','" + designation + "','" + department + "','" + typeleave + "','" + leavefrom + "','" + leaveto + "','" + totdays + "')";
            int a = stmt.executeUpdate(query);
            if (a > 0) {
            
           }

        %>
                      
               <%}%>        
                    </table>
               


                    
                </div>
            </div>

            <div id="footer">
                <div class="connect">
                    <a href="http://freewebsitetemplates.com/go/facebook/" target="_blank" class="facebook"></a> <a href="http://freewebsitetemplates.com/go/twitter/" target="_blank" class="twitter"></a> <a href="http://freewebsitetemplates.com/go/googleplus/" target="_blank" class="googleplus"></a>
                </div>
                <p>
                    RAD Project; 2k17. All Rights Reserved.
                </p>

            </div>

        </div>
    </body>
</html>