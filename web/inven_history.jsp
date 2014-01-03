<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Item History</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
text-align: justify;">
        
        <%@ page import="javax.*" %>
        <%@ page import="java.*;" %>
        
        <%
            java.sql.Connection con;
            java.sql.ResultSet rs;
            java.sql.PreparedStatement ps;
            java.sql.PreparedStatement ps1;
           try{ 
               
         String s1=(String)request.getParameter("item_id");
         Class.forName("com.mysql.jdbc.Driver");
         con= java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/invenmanage?zeroDateTimeBehavior=convertToNull","root","12345");
                ps=con.prepareStatement("select * from items where item_id='"+s1+"'");
                rs=ps.executeQuery();
                while(rs.next())
                 {  %>
                 
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 Item Name: <font face="comic sans ms" color="purple"><%= rs.getString(3)%></font>
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 Present Quantity: <font face="comic sans ms" color="purple"><%= rs.getInt(4)%></font>
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 Last date of updation: <font face="comic sans ms" color="purple"><%= rs.getString(5)%></font>
                <% } %>
                <br><br><br><br>
               <% 
                ps1=con.prepareStatement("select * from sold_out_details where item_id='"+s1+"'");
                rs=ps1.executeQuery();
                 int count=0;
                while(rs.next())
                 {  count++;    %>
            <% if(count==1) { %>
            <table id="inventry" style="border-style: double; border-color:rgb(100, 20, 100); margin:3px; border-width:5px;" cellspacing=10px width="861" >
                        <thead style="text-align:center;">
            
                <tr>
                    <th style="padding:20px"><a style="font-size:20px">Sold To</a></th>
                    <th style="padding:20px"><a style="font-size:20px">Quantity</a></th>
                    <th style="padding:20px"><a style="font-size:20px">Date Of Sold</a></th>
                    <th></th>
                </tr>
            </thead>
            <tbody style="text-align:center;">
           <% } %>
    
        <tr>
           <td><a><%=rs.getString(3)%></a></td>
           <td><a><%=rs.getString(5)%></a></td>
           <td><a><%=rs.getString(4)%></a></td>
          
           
       </tr>
        <% }  %>
        </tbody></table>
        <br><br>

       <% if(count==0)
        { %>
        <font color="red" face="comic sans ms">No details are currently available.</font>
       <% }
        %>
        
        <% } catch(Exception e) {} %>
    </div>
</body>
</html>