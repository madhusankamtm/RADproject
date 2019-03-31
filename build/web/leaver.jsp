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
        <title>Feedback- Leave managment System</title>
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

            </div>
            <%
  
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/leavemanagment", "root", "");
                Statement stmt = con.createStatement();
               
                ResultSet rs = stmt.executeQuery("SELECT name,contactnumber,emailaddress,gender,comments FROM feedback"); 
                
            %>


<div id="adbox">
                    <font color="white">
                    <p align="center"><b>Feedback</b></p>
            <form action="leaver.jsp" method="POST">
                    <table border="1">

                <tr>
                    <th>Name</th>
                    <th>Contact</th>
                    <th>Email</th>    
                    <th>Gender</th>
                    <th>Comments</th>

                </tr>
                <% while (rs.next()) {%>  
                <tr>
                    <td><%= rs.getString(1)%></td>
                    <td><%= rs.getInt(2)%></td>
                    <td><%= rs.getString(3)%></td>
                    <td><%= rs.getString(4)%></td>
                    <td><%= rs.getString(5)%></td>
                    <td><input type="submit"  value="Deletet" name="acept" /></td>
                   
                        </tr>
                           
                   

                </tr>
                <%}%>
             
            </table>
            </form>
                 <%
                 String query2= "DELETE FROM feedback";
                 stmt.executeUpdate(query2);
                 
                 
                 
                 %>
                
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