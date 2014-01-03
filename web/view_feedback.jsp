<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Feedbacks</title>
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
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <font face="comic sans ms" color="green" size="29">New Feedback</font><br><br>
        <form action="feedback_read" method="post">
        <%
            java.sql.Connection con;
            java.sql.ResultSet rs;
            java.sql.PreparedStatement ps;
            String s1="No";
           try{ 
               Class.forName("com.mysql.jdbc.Driver");
                
               con= java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/invenmanage?zeroDateTimeBehavior=convertToNull","root","12345");
                ps=con.prepareStatement("select * from feedback where viewed='"+s1+"'");
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
                    <th style="padding:20px"><a style="font-size:20px">  </a></th>
                    <th style="padding:20px"><a style="font-size:20px">Type</a></th>
                    <th style="padding:20px"><a style="font-size:20px">User Id</a></th>
                    <th style="padding:20px"><a style="font-size:20px">Name</a></th>
                    <th style="padding:20px"><a style="font-size:20px">Feedback</a></th>
                 </tr>
            </thead>
            <tbody style="text-align:center;">
           <% } %>
    
        <tr>
            
           <td><input type="checkbox" name="feedback" value="<%=rs.getString(1)%>"/></td>
           <td><a><%=rs.getString(2)%></a></td>
           <td><a><%=rs.getString(3)%></a></td>
           <td><a><%=rs.getString(4)%></a></td>
           <td><a><%=rs.getString(5)%></a></td>
   
       </tr>
        <% }  %>
        </tbody></table>
        <br><br>
        
        <div align="center">
        <% if(count > 0) { %>
            <input type="submit" value="Mark selected feedback as read" name="mark read"></form>
           <% } %>
       <% if(count==0)
        { %>
        <a>Currently you have no new feedback.</a>
       <% }
        %>
        <br><br><br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <font face="comic sans ms" color="green" size="29">Old feedback</font><br><br>
        <form action="approve_selected" method="get">
        <%
            String ss1="Yes";
           Class.forName("com.mysql.jdbc.Driver");
                
               con= java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/invenmanage?zeroDateTimeBehavior=convertToNull","root","12345");
                /*Retreive for checking username already doesnt exit*/
                ps=con.prepareStatement("select * from feedback where viewed='"+ss1+"'");
                rs=ps.executeQuery();
                flag=0;
                username="";
                name="";
                count=0;
                %>
           
            <%
                while(rs.next())
                 {  count++;    %>
            <% if(count==1) { %>
            <table id="inventry" style="border-style: double; border-color:rgb(100, 20, 100); margin:3px; border-width:5px;" cellspacing=10px width="861" >
                        <thead style="text-align:center;">
            
                <tr>
                    <th style="padding:20px"><a style="font-size:20px">Type</a></th>
                    <th style="padding:20px"><a style="font-size:20px">User Id</a></th>
                    <th style="padding:20px"><a style="font-size:20px">Name</a></th>
                    <th style="padding:20px"><a style="font-size:20px">Feedback</a></th>
                 </tr>
            </thead>
            <tbody style="text-align:center;">
           <% } %>
    
        <tr>
            
           <td><a><%=rs.getString(2)%></a></td>
           <td><a><%=rs.getString(3)%></a></td>
           <td><a><%=rs.getString(4)%></a></td>
           <td><a><%=rs.getString(5)%></a></td>
   
       </tr>
        <% }  %>
        </tbody></table>
        <br><br>
        
        <div align="center">
       <% if(count==0)
       { %>
        <a>No old feedback.</a>
       <% } %>
       
                 
                 
       <%   }
                 
        catch(Exception e)
        {}
        %>
        </div>
    </div>
    </body>
</html>
