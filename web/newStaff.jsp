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
<!DOCTYPE html>
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

            String stf_name = request.getParameter("Staff_Name");
            String staff_id = request.getParameter("Staff_ID");
            String password = request.getParameter("Password");
            String stftype = request.getParameter("Staff_Type");
            String department = request.getParameter("Department");
            String dob = request.getParameter("Date of Birth");
            String contact = request.getParameter("Contact");

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/leavemanagment", "root", "");
                Statement stmt = con.createStatement();
                String query = "INSERT INTO new_staff(staff_ID,password,staff_name,staff_type,department,dob,phoneno )"
                        + "VALUES('" + staff_id + "','" + password + "','" + stf_name + "','" + stftype + "','" + department + "','" + dob + "','"+ contact + "')";
                int a = stmt.executeUpdate(query);
                if (a > 0) {
                    out.println("<p style='color:blue'>Sucessfully added</p>");
                    
                }else{
                 out.println("<p style='color:blue'>Incomplete</p>");
                }
                
            } catch (Exception e) {
                
            }
            
        %>
  <div id="page">
            <div id="header"><p>
                    <a href="index.html" id="logo"><img src="images/logo1.png" alt="LOGO" ></a>
                <ul id="navigation">

                    <li>
                        <a href="index.html" title="Home"></a>
                    </li>
                    <li class="selected">
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
                     
            <div id="contents">
                
                <div class="background">
                    <form action="newStaff.jsp" method="POST">
                        <table border="0" align="center">
                            <tbody>
                                <tr>
                                    <td>Staff Name:</td>
                                    <td><input type="text" name="Staff_Name" value="" size="40" /></td>
                                </tr>

                                <tr>
                                    <td>Staff ID:</td>
                                    <td><input type="text" name="Staff_ID" value="" size="40" /></td>
                                </tr>
                                <tr>
                                    <td>Password:</td>
                                    <td><input type="password" name="Password" value="" style="width:255px;" size="50" /></td>
                                </tr>
                                <tr>
                                    <td>Staff Type:</td>
                                    <td>
                                        <select name="Staff_Type" style="width: 260px;">
                                            <option>select</option>
                                            <option>Accounts</option>
                                            <option>Clerical</option>
                                            <option>Management</option>
                                        </select>
                                    </td>
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
                                    <td>Date of Birth:</td>
                                    <td><input type="date" name="Date of Birth" value="" size="50" /></td>
                                </tr>
                                <tr>								 
                                    <td> Contact:</td>
                                    <td><input type="text" name="Contact" value="" size="40" /></td>
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
            <div id="footer">
                <div class="connect">
                    <a href="http://www.google.com" target="_blank" class="facebook"></a> <a href="http://www.google.com" target="_blank" class="twitter"></a> <a href="http://www.google.com" target="_blank" class="googleplus"></a>
                </div>
                <p>
                    RAD Project; 2k17. All Rights Reserved.
                </p>
            </div>
        </div>
    </body>
</html>