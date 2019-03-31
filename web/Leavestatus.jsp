<%-- 
    Document   : Leavestatus
    Created on : Nov 13, 2017, 10:03:45 PM
    Author     : Madhusanka
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

        <div id="page">
            <div id="header"><p>
                 <a href="index.html" id="logo"><img src="images/logo1.png" alt="LOGO" ></a>
                </p>
                <ul  id="navigation">

                    <li>
                        <a href="index.html" title="Home"></a>
                    </li>
                    <li>
                        <a href="requestform.jsp">Leave Request Form</a>
                    </li>

                    <li class="selected">
                        <a href="Leavestatus.jsp">Leave Status</a>
                    </li>
                    <li>
                        <a href="profile1.jsp">Profile</a> 
                    </li>

                    <%if(session.getAttribute("uid")!=null){%>
                    <li class="last-child">
                        <a href="logout.jsp">Logout</a>
                    </li>
                    <%}%>

                </ul>

            </div>
            <%

            String user = session.getAttribute("uid").toString();
                
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/leavemanagment", "root", "");
                Statement stmt = con.createStatement();
              
                ResultSet rs = stmt.executeQuery("SELECT emp_ID,emp_name,type_leave,leave_from,leave_to,acept FROM leave_approval WHERE emp_ID = '"+user+"' "); 
                
            %>


<div id="adbox">
                    <font color="white">
                    <p align="center"><b>Request Form</b></p>
            <table border="1">

                <tr>
                    <th>User ID</th>
                    <th>Employee Name</th>
                    <th>Type of Leave</th>  
                    <th>Leave From</th>
                    <th>Leave To</th>
                    <th>CEO</th>
                   


                </tr>
                <% while (rs.next()) {%>  
                <tr>
                    <td><%= rs.getString(1)%></td>
                    <td><%= rs.getString(2)%></td>
                    <td><%= rs.getString(3)%></td>
                    <td><%= rs.getString(4)%></td>
                    <td><%= rs.getString(5)%></td>
                    <td><%= rs.getString(6)%></td>
          
                
                    
                   

                </tr>
                <%}%>

            </table>

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