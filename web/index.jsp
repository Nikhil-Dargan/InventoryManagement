<html>
<head>
    <title>NSU - Inventory Management Portal</title>
<link rel="stylesheet" href="style.css">

<link rel="icon" href="images/favicon.ico" type="image/png" />
<link rel="shortcut icon" href="images/favicon.ico" type="image/png" /> 

</head>
<body>
<div id="container" > 
<div class="extra_wrap"> 
<header>
<div style="float:top">
<img src="images/logo.jpg" style="width:700px;height:150px">
</div>
    <div style="float:right; float: top">
        <% if(session.getAttribute("logged_in") != null) {    
         String img_path=(String)session.getAttribute("logged_in_info_img");
            request.setAttribute("check",img_path);
            String img_path_2="images/Database/"+img_path;
            %>
            <a href="profile_pic.jsp" ><img src=<%= img_path_2 %>  alt="img" width="30" height="30" /></a>
         
   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<font color="orange" ><%= session.getAttribute("logged_in_info_name") %></font>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    
<a href="change_pass.jsp">Change password</a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="logout.jsp">Logout</a>
<% } %>
</div>
<br><br><br>
<div> 
	<ul class="sf-menu"> 
	<li><a href="index.jsp" class="current">Home</a>
</li>
<li><a >Contact Us</a>
<ul>		<li>
<a href="feedback.jsp">feedback</a></li>
		<li><a href="complaint.jsp">complaint</a></li>
		</ul>
	</li>
	<li><a href="about_us.jsp">About Us</a>
	</li>	
        <% if(session.getAttribute("logged_in") == null) { %>     
	<li><a href="signup.jsp">Sign up</a>
	</li>
        <% } %>
	</ul>
</div>
</header>
</div>
     
<div class="carousel"> 
                <a id="prev2" href="#"></a> <a id="next2" href="#"></a> 
                <div class="slider"  id="s4" style="width:70%;float:left" > 
                      <div class="slide" > 
                          <img src="images/slideshow/1.jpg" width="500" height="200"/> 
                      </div> 
                      <div class="slide"> 
                      	
                          <img src="images/slideshow/2.jpg" alt=""  width="500" height="200"/> 
                      </div> 
<div class="slide"> 
                     
                          <img src="images/slideshow/3.jpg" alt=""  width="500" height="200"/> 
                      </div> 
<div class="slide"> 
                      	
                          <img src="images/slideshow/4.jpg" alt=""  width="500" height="200"/> 
                      </div>
<div class="slide"> 
                      	
                          <img src="images/slideshow/5.jpg" alt=""  width="500" height="200"/> 
                      </div>
<div class="slide"> 
                      	
                          <img src="images/slideshow/6.jpg" alt=""  width="500" height="200"/> 
                      </div>
                    
	</div>
    
    <% if(session.getAttribute("logged_in") == null) { %>
<nav style="background-color:white; width:29%;float:right; height:150px;border:5px dashed #a0f;">
    <br/>
    <form action="signin" method="post">
<div class="inp">
<input class="field2" style="width:250px" type="text" name="t1" placeholder="User Id">
</div>
<div class="inp">
<input class="field2" style="width:250px" type="password" name="t2" placeholder="Password">
</div>
<div class="inp">
<input type="submit" style="width:100px;height:30px;background-color:#9950ff;" value="login">
</div>
</form>
<% String ss=(String)request.getAttribute("wrong_pass"); 
    if(ss != null) { %>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <font color="red">Wrong username and/or password.</font>
    <% } %>
    <br/>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="forgotpass.jsp">Forgot your password?</a>
</nav>
    <% } %>
</div>

    <br/><br/><br/><br/><br/><br/><br/>
    <br/><br/><br/><br/><br/>
    <hr>
    <% if(session.getAttribute("logged_in") != null) { 
        Integer aa=(Integer)session.getAttribute("logged_in_info_role");
        if(aa == 0 ) { %>
    <font color="black" >Manage Inventory</font><br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="inven_manage.jsp" >Manage Inventory</a>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <a href="delete_acc.jsp" >Delete Account</a>
            
        <% } else { %>
    <font color="black" >Manage Inventory</font>
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
                <a href="inven_manage.jsp">Manage Inventory</a>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="delete_acc.jsp">Delete Account</a>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="approve_users.jsp">Approve Users</a>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="add_admin.jsp">Add admin</a>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="delete_users.jsp">Delete Users</a>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="view_feedback.jsp">View feedbacks</a>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="view_complaint.jsp">View complaints</a>
                  
            <% } }%>
    <br>
    <div class="field2" style="float: end">
        <%! int visiter_count=1; %>
    <font color="orange" >Visiter No: <%= visiter_count++ %></font></div>

        <script src="js/libs/jquery-1.5.js"></script> 
	<script type="text/javascript" src="js/jquery.validate.pack.js"></script> 
	<script type="text/javascript" src="js/jquery.cycle.all.latest.js"></script> 

	<script type="text/javascript" src="js/script2.js"></script> 

	<script src="js/script.js"></script> 
	<!-- end concatenated and minified scripts--> 

</body></html>
