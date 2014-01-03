<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Approve Users</title>
        <link rel="stylesheet" href="style.css">
<link rel="icon" href="images/favicon.ico" type="image/png" />
<link rel="shortcut icon" href="images/favicon.ico" type="image/png" /> 

    </head>
    <body>
        <div class="extra_Wrap">
    <header>
        <div class="extra_wrap"> 
<header>
<div style="float:top">
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
background-color: #cfcdc0; 
padding: 8px 8px 17px 8px; 
font-size: 16px; 
text-align: justify;">
        <% session.getAttribute("logged_in_info_name"); %>
        <%@ page import="javax.*" %>
        <%@ page import="java.*;" %>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <font face="comic sans ms" color="green" size="29">List of Users</font><br><br>
        <form action="delete_users" method="post">
        <%
            if(request.getAttribute("deleted") != null)
            {
                out.println("               Selected users have been deleted\n\n");
            }
            java.sql.Connection con;
            java.sql.ResultSet rs;
            java.sql.PreparedStatement ps;
            String status="Not Approved";
           try{  Class.forName("com.mysql.jdbc.Driver");
               con= java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/invenmanage?zeroDateTimeBehavior=convertToNull","root","12345");
                /*Retreive for checking username already doesnt exit*/
                ps=con.prepareStatement("select user_id,name,gender,dob,email,secret_ques,answer from user where role=0");
                rs=ps.executeQuery();
                int flag=0;
                String username="";
                String name="";
                int count=0;
                %>
           
            <%
                while(rs.next())
                 {  count++;    %>
            <% if(count==1) { %>
            <table id="inventry" style="border-style: double; border-color:rgb(100, 20, 100); margin:3px; border-width:5px;" cellspacing=10px width="861" >
                        <thead style="text-align:center;">
            
                <tr>
                    <th style="padding:20px"><a style="font-size:20px"> </a></th>
                    <th style="padding:20px"><a style="font-size:20px">User Id</a></th>
                    <th style="padding:20px"><a style="font-size:20px">Name</a></th>
                    <th style="padding:20px"><a style="font-size:20px">Gender</a></th>
                    <th style="padding:20px"><a style="font-size:20px">Date Of Birth</a></th>
                    <th style="padding:20px"><a style="font-size:20px">Email id</a></th>
                </tr>
            </thead>
            <tbody style="text-align:center;">
           <% } %>
    
        <tr>
            
           <td><input type="checkbox" name="users" value="<%=rs.getString(1)%>"/></td>
           <td><a><%=rs.getString(1)%></a> </td>
           <td><a><%=rs.getString(2)%></a></td>
           <td><a><%=rs.getString(3)%></a></td>
           <td><a><%=rs.getString(4)%></a></td>
           <td><a><%=rs.getString(5)%></a></td>
   
       </tr>
        <% }  %>
        </tbody></table>
        <br><br>
        
        <% if(count > 1) { %>
            <input type="submit" value="Delete selected users" name="delete_selected"></form>
           
        <% } 
        if(count==0)
        { %>
        <a>Currently you have no users.</a>
       <% }
        %>
        <br><br><br>
         
                 
                 
        <%  }
                 
        catch(Exception e)
        {}
        %>
        </div>
    </div>
    </body>
</html>
