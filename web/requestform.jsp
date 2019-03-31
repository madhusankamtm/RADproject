<%-- 
    Document   : requestform
    Created on : Nov 13, 2017, 6:37:30 PM
    Author     : Madhusanka
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Website template by freewebsitetemplates.com -->
<html>
    <head>
        <meta charset="UTF-8">
        <title>Leave Request - Leave managment System</title>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <!--[if IE]>
                <link rel="stylesheet" href="css/ie.css" type="text/css" charset="utf-8">
        <![endif]-->
    </head>
    <body>
        <% String user = session.getAttribute("uid").toString();%>


        <div id="page">
            <div id="header"><p>
                     <a href="index.html" id="logo"><img src="images/logo1.png" alt="LOGO" ></a> 
                </p>
                <ul  id="navigation">

                    <li>
                        <a href="index.html" title="Home"></a>
                    </li>
                    <li class="selected">
                        <a href="requestform.jsp">Leave Request Form</a>
                    </li>

                    <li>
                        <a href="Leavestatus.jsp">Leave Status</a>
                    </li>
                    <li>
                        <a href="profile1.jsp">Profile</a> 
                    </li>

                    <%if (session.getAttribute("uid") != null) {%>
                    <li class="last-child">
                        <a href="logout.jsp">Logout</a>
                    </li>
                    <%}%>

                </ul>

                <div id="adbox">
                    <font color="white">
                    <p align="center"><b>Request Form</b></p>


                    <form action="requestform.jsp" method="POST">

                        <table border="0" align="center">
                            <tbody>
                                <tr>
                                    <td>User ID:</td>
                                    <td><input type="text" name="User_ID" value="<%=user%>" size="35" readonly="readonly" /></td>
                                </tr>
                                <tr>
                                    <td>Employee Name:</td>
                                    <td><input type="text" name="Emp_name" value="" size="35" /></td>
                                </tr>

                                <tr>
                                    <td>Type of Leave:</td>
                                    <td><input type="text" name="Type_of_Leave" value="" size="35" /></td>
                                </tr>

                                <tr>
                                    <td>Employee Type:</td>
                                    <td>
                                        <select name="Employee_Type" style="width: 260px;">
                                            <option>select</option>
                                            <option>Accounts</option>
                                            <option>Clerical</option>
                                            <option>Management</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Designation:</td>
                                    <td><select name="Designation" style="width: 260px;">
                                            <option>select</option>
                                            <option>Faculty</option>
                                            <option>Department</option>
                                        </select></td>
                                </tr>
                                <tr>
                                    <td>Department:</td>
                                    <td><select name="Department" style="width: 260px;">
                                            <option>Select</option>
                                            <option>CST</option>
                                            <option>SCT</option>
                                        </select></td>
                                </tr>
                                <tr>
                                    <td>Leave From:</td>
                                    <td><input type="date" name="Leave_from" value="" style="width:255px;" /></td>
                                </tr>
                                <tr>
                                    <td>Leave To:</td>
                                    <td><input type="date" name="Leave_to" value="" style="width:255px;" /></td>
                                </tr>
                                <tr>
                                    <td>Total Days:</td>
                                    <td><input type="text" name="Tot_date" value="" style="width:255px;" /></td>
                                </tr>



                            </tbody>
                        </table>
                        <table>
                            <tr>
                                <td style="padding-Left:588;"> <pre> 
                                                                <input type="submit" value="Register">    <input type="reset" value="Reset"></pre>   </td>         

                            </tr> 
                        </table>
                    </form>

                </div>
            </div>
            <%

                String emp_name = request.getParameter("Emp_name");
                String type_of_leave = request.getParameter("Type_of_Leave");
                String emp_type = request.getParameter("Employee_Type");
                String designation = request.getParameter("Designation");
                String department = request.getParameter("Department");
                String leave_from = request.getParameter("Leave_from");
                String leave_to = request.getParameter("Leave_to");
                String tot_days = request.getParameter("Tot_date");

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/leavemanagment", "root", "");
                    Statement stmt = con.createStatement();
                    String query = "INSERT INTO leaverequest (User_ID,emp_name,type_of_leave,Emp_type,Designation,Department,date_request,leave_from,leave_to,total_days)"
                            + "VALUES ('" + user + "','" + emp_name + "','" + type_of_leave + "','" + emp_type + "','" + designation + "','" + department + "',now(),'" + leave_from + "','" + leave_to + "','" + tot_days + "')";
                    int a = stmt.executeUpdate(query);
                    if (a > 0) {
                        out.println("<p style='color:blue'>Sucessfully Request the leave</p>");
                    } else {
                        out.println("<p style='color:blue'>Invalid User ID or Password </p>");
                    }
                } catch (Exception e) {
                    
                }

            %> 

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