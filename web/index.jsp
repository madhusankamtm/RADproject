<!DOCTYPE html>
<!-- Website template by freewebsitetemplates.com -->
<html>
    <head>
        <meta charset="UTF-8">
        <title>Home - Leave managment System</title>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <!--[if IE]>
                <link rel="stylesheet" href="css/ie.css" type="text/css" charset="utf-8">
        <![endif]-->
    </head>
    <body>
      <% 
       
      
      %>

        <div id="page">
            <div id="header"><p>
                     <a href="index.html" id="logo"><img src="images/logo1.png" alt="LOGO" ></a>
                </p>
                <ul  id="navigation">

                    <li class="selected">
                        <a href="index.html" title="Home"></a>
                    </li>
                    <li>
                        <a href="requestform.jsp">Leave Request Form</a>
                    </li>

                    <li>
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

                <div id="adbox">
                    <img src="images/discussing.jpg" alt="Img" height="496" width="958">
                    <div class="details">
                        <h1>WELCOME TO XYZ COMPANY</h1>
                        <p>
                            Leave Managment System
                        </p>
                    </div>
                </div>
            </div>
            <div id="contents">
                <div>
                    <div id="headline">
                        <div class="body">
                            <h2>About</h2>
                            <p>
                                We Develop this web site for leave managment of employees in a company for proper way.
                                <br>When using this we can record all the leave details in correct and visible way.
                            </p>
                        </div>
                    </div>

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