<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Pic</title>
        <link rel="stylesheet" href="style.css">
<link rel="icon" href="images/favicon.ico" type="image/png" />
<link rel="shortcut icon" href="images/favicon.ico" type="image/png" /> 

    </head>
    <body>
        <div class="extra_Wrap">
    <header>
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
<!--<div class="r">--> 
<br><br><br>
<ul class="sf-menu"> 
	<li><a href="index.jsp" class="current">Home</a>
	</li>
	<li><a>Contact Us</a>
		<ul>	
		<li><a href="feedback.jsp">feedback</a></li>
		<li><a href="complaint.jsp">complaint</a></li>
		</ul>
	</li>
	<li>
		<a href="about_us.jsp">About Us</a>
	</li>	
	</ul>
</header>
</div>
        <br><br>
    <div 
style="margin: 17px 32px 17px 32px; 
border: 1px solid #9b977b; 
background-color: #ffcdc0; 
padding: 8px 8px 17px 8px; 
font-size: 16px; 
text-align: justify;">
        <% 
            
        
            String img_path=(String)session.getAttribute("logged_in_info_img");
            request.setAttribute("check",img_path);
            String img_path_2="images/Database/"+img_path;
            
            if(img_path != null)
            { %>
          <img src=<%= img_path_2 %>  width="300" height="300" />
         <% } %>
          <form name="form1" method="post" enctype="multipart/form-data" action="add_update_dp.jsp">
<p>
<input type="file" name="ImageFile" id="ImageFile" accept="image/*" />
</p>
<p>
<input type="submit" name="Add new / Change" value="Change" />
</p>
</form>        
        
</div>
        
</body>
</html>