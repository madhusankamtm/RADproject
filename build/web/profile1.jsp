<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<!-- Website template by freewebsitetemplates.com -->
<html>
    <head>
        <meta charset="UTF-8">
        <title>Leave managment System</title>
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

                    <li>
                        <a href="Leavestatus.jsp">Leave Status</a>
                    </li>
                    <li  class="selected">
                        <a href="profile1.jsp">Profile</a> 
                    </li>

                    <li class="last-child">
                        <a href="logout.jsp">Logout</a>
                    </li>


                </ul>

                <div id="adbox">
                    <font color="white">
                    <p align="center"><b>Employee Profile</b></p>

                    <%
                        String user = session.getAttribute("uid").toString();

                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/leavemanagment", "root", "");
                        Statement stmt = con.createStatement();
                        String query = "SELECT emp_name,password,emp_type,designation,department,dob,email,contact FROM new_employee WHERE User_ID = '"+user+"'";
                        ResultSet rs = stmt.executeQuery(query);
                        
                    %>
                   <form action="update.jsp" method="POST">
                    <table border="0" align="center">
                    <%while(rs.next()){%>
                         <tr><td>User ID:</td>
                                <td><input type="text" name="User_ID" value="<%=user%>" size="39"readonly="readonly" /></td>
                                </form> 
                            </tr>
                            <tr>
                                <td>Employee Name:</td>
                                <td><input type="text" name="Employee_Name" value="<%=rs.getString(1)%>" size="39" /></td>
                            </tr>


                        <td>Password:</td>
                        <td><input type="password" name="Password" value="<%=rs.getString(2)%>" style="width:255px;" /></td>
                        </tr>
                        <tr>
                            <td>Employee Type:</td>
                            <td>
                                <select name="Employee Type" style="width: 260px;" value="<%=rs.getString(3)%>">
                                    <option></option>
                                    <option>Accounts</option>
                                    <option>Clerical</option>
                                    <option>Management</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Designation:</td>
                            <td><select name="Designation" style="width: 260px;" value="<%=rs.getString(4)%>">
                                    <option></option>
                                    <option>Faculty</option>
                                    <option>Department</option>
                                </select></td>
                        </tr>
                        <tr>
                            <td>Department:</td>
                            <td><select name="Department" style="width: 260px;" value="<%=rs.getString(5)%>">
                                    <option></option>
                                    <option>CST</option>
                                    <option>SCT</option>
                                </select></td>
                        </tr>
                        <tr>
                            <td>Date of Birth:</td>
                            <td><input type="date" name="Date of Birth" value="<%=rs.getString(6)%>" size="39" /></td>
                        </tr>
                        <tr>
                            <td>Email:</td>
                            <td><input type="text" name="Email" value="<%=rs.getString(7)%>" size="39" /></td>
                        </tr>
                        <tr>								 
                            <td> Contact:</td>
                            <td><input type="text" name="Contact" value="<%=rs.getString(8)%>" size="39" /></td>
                        </tr>
                        
                     
                    </table>
                    
                    <table>
                        <tr>
                            <td style="padding-Left:588;"> <pre> 
                                                                            <input type="submit" value="Update" style="align-items: center">
                                        

                        </tr>
                          <%}%>  
                    </table>
</form>
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