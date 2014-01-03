<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Add Admin</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="style.css">
    
<link rel="icon" href="images/favicon.ico" type="image/png" />
<link rel="shortcut icon" href="images/favicon.ico" type="image/png" /> 
    
<script>

    function validate()
    {
        var x=document.getElementById("t7").value;
        var y=document.getElementById("t8").value;
        if(x != y)
        {
            alert("Password doesn't match");
            return false;
        }
    }
</script>
    
    
    </head>
    <body>
<div class="extra_Wrap">
<header>
<div class="extra_wrap"> 
<header>
<div style="float:top">
<img src="images/logo.jpg" style="width:700px;height:150px">
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

<ul class="sf-menu"> 
	<li><a href="index.jsp" class="current">Home</a>
	</li>
	<li><a >Contact Us</a>
		<ul>	
		<li><a href="feedback.html">feedback</a></li>
		<li><a href="complaint.html">complaint</a></li>
		</ul>
	</li>
	<li>
		<a href="about_us.jsp">About Us</a>
	</li>	
	</ul>

</header>        
</div>
<% try { 
    String s=(String)request.getAttribute("status"); %>
<div id="signup">

        <form action="add_admin" method="post"  name="registration" onsubmit="return validate()">
      
                
        <% if (s != null) { %> 
            <div class="inp">Name: <input type="text" name="t1" value="${name}" required maxlength="30" style="width:250px;" class="field2"></div> 
        <%  } else { %>    
            <div class="inp">Name: <input type="text" name="t1" required maxlength="30" style="width:250px;" class="field2"></div>
        <%  } %>
        <% if( s != null) { %>
            <div class="inp">Username: <input type="text" name="t2" title="aaa" placeholder="Try another Username" required maxlength="30"></div>
        <%  } else { %>        
            <div class="inp">Username: <input type="text" name="t2" title="aaa" placeholder="Desired Username" required maxlength="30"></div>
        <% } %>
            <div class="inp"><input type="radio" name="t3" value="Male" checked  style="width:30px;" class="field2">Male   <input type="radio" name="t3" value="Female"  style="width:30px;" class="field2">Female</div>
        <% if (s != null) { %> 
                <div class="inp">DOB: <input type="date" name="t5" required value="${dob}" style="width:250px;" class="field2"></div>
        <% } else { %>    
            <div class="inp">DOB: <input type="date" name="t5" required style="width:250px;" class="field2"></div>
        <% } %>
        <% if (s != null) { %> 
            <div class="inp">Email: <input type="email" name="t6" required maxlength="30" value="${email}" style="width:250px;" class="field2"></div>
        <% } else { %>    
            <div class="inp">Email: <input type="email" name="t6" required maxlength="30" style="width:250px;" class="field2"></div>
        <% } %>
            <div class="inp">Password: <input type="password" id="t7" name="t7" required maxlength="30" minlength="" style="width:250px;" class="field2"></div>
            <div class="inp">Confirm Password: <input type="password" id="t8" name="t8" required maxlength="30" oninput="return checkValues();" style="width:250px;" class="field2"></div>
            <div class="inp">Secret Ques: <select name="t9" required   style="width:350px;" class="field2">
                 
                <option selected>What is your middle name?</option>
                <option>What is your pet's name?</option>
                <option>What is your favorite teachers name?</option>
                <option>What is your mother's maiden name?</option>
                <option>What was your favorite place as a child?</option>
                </select>
            </div>
            <div class="inp">Answer:<input type="text" name="t10" required maxlength="200"  style="width:250px;" class="field2"></div>
           <!-- <div class="inp">Choose image:<input type="file" name="img" accept="image/gif,image/jpeg"></div> -->
           
           <div class="inp"><pre><br>  <input type="reset" value="Reset">     <input type="submit" value="Add Admin" ></pre></div>
           <br><br><font face="arial" size="5" color="blue">Details marked with red are compulsary.</font>
            
        </form>
 <% } catch(Exception e) {} %>
</div>

    
        <script src="js/libs/jquery-1.5.js"></script> 
	<script type="text/javascript" src="js/jquery.validate.pack.js"></script> 
	<script type="text/javascript" src="js/jquery.cycle.all.latest.js"></script> 

	<script type="text/javascript" src="js/script2.js"></script> 

	<script src="js/script.js"></script> 
	<!-- end concatenated and minified scripts--> 


       </body>
</html>