<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>About Us</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="style.css">
<link rel="icon" href="images/favicon.ico" type="image/png" />
<link rel="shortcut icon" href="images/favicon.ico" type="image/png" /> 

</head>
<body >

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
        <% if(session.getAttribute("logged_in") == null) { %>     
        <li><a href="signup.jsp" class="current">Sign Up</a>
	</li>
        <% } %>
	</ul>
</header>
</div>
        <br><br>
    <div 
style="margin: 17px 32px 17px 32px; 
border: 1px solid #9b977b; 
background-color: #cfcdc0; 
padding: 8px 8px 17px 8px; 
font-size: 16px; 
text-align: justify;"><pre>
WHO WE ARE :
A team of dedicated operatives who initiate strategic partnerships with businesses and with setting up distribution network and 
managing products online.


WHAT WE AIM FOR :
Our process allows our team and your team work together effectively to create a successful store. We will follow the direction
of the Advanced Internet and do the necessary adjustments so that, together we can! WE are the one to asdress if you are
looking for long term partners aimed at increasing sales in your store . YOUR SUCCESS IS OUR SUCCESS .

Your business is a complex machine and your online store is just a part of it. Stores require regular maintenance and updates.
Let us take the technical aspect and help you focus on other things you need to do to grow your business.


WHAT WE CAN DO :
i)   Establishment and Management of Stores :       
                                                Management of the store is the first step in doing business in the virtual 
                                                world. Like physical shops, online store requires both management and control
                                                all the time.

ii)  Building products catalog  :
                                    Many businesses from different fields must b presented CATALOGUE so that they can be managed
                                    properly and efficiently. 

iii)  Creative Content Development  : 
                                        Helps you manage your products with creativity and tidiness.

iv)   Support Center and Customer Service   :
                                                Service and support gives answer to user's every question and problem. Service 
                                                and support to our employees allows us to store channels to expand engagement
                                                with customers, improve the quality of customer service, and reduce operating
                                                costs of operating support and service to their customers.

v )  Inventory management software interfacing  : 
                                                    This provides a complete solution for monitoring, tracking and control of
                                                    all business management activities in a friendly and comfortable environmant.
                                                    This process provide control and  management from anywhere, anytime.

        </pre>
</div>
</body>
</html>