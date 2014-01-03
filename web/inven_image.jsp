<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Item</title>

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
           int itemid=-1;
             String s1="";
            try{ 
               if(request.getAttribute("added")!=null)
               {
                   s1=(String)request.getAttribute("itemid");
               }
               else
               {
                   s1=(String)request.getParameter("itemid");
               }
               
               Class.forName("com.mysql.jdbc.Driver");
         
         con= java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/invenmanage?zeroDateTimeBehavior=convertToNull","root","12345");
                ps=con.prepareStatement("select * from items where item_id='"+s1+"'");
                rs=ps.executeQuery();
                int s2=0;
                while(rs.next())
                 {  
                     itemid=rs.getInt(1);
                    %>
                 
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 Item Name: <font face="comic sans ms" color="purple"><%= rs.getString(3)%></font>
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 Present Quantity: <font face="comic sans ms" color="purple"><%= rs.getInt(4)%></font>
                 <% s2=rs.getInt(4); %>
                  
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 Last date of updation: <font face="comic sans ms" color="purple"><%= rs.getString(5)%>
                <% } %></font>
                <br><br><br><br>
                <%
                
                ps=con.prepareStatement("select img_path,img_title from item_image where item_id='"+s1+"'");
               rs=ps.executeQuery();
                int flag=0;
                String username="";
                String name="";
                int count=0;
                %>
           
            <%
                if(request.getAttribute("added")!=null)
                    out.println("New item image has been added.");
                %>
                <br>
                <br>
                <br>
                <br>
                <br>
               <%
                while(rs.next())
                {   count++;
                    String path=rs.getString(1);
                    String path2="images/Database/"+path;
                    String title=rs.getString(2);
                    if(count==3) { 
                    %>
                    <br><br><br><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <% } else if(count==6) { 
                        count=1;
                    %>
                    <br><br><br><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        
                    <%  } else { %>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <% } %>
                    <img src=<%= path2 %> height="150" width="150" title=<%= title %> />
               
                   <%  } %>
                
        <br><br>
                <font size="15" face="comic sans ms" color="green">Add more...</font>
     <form name="form1" method="post" enctype="multipart/form-data" action="add_item_img.jsp">
<p>
<input type="file" name="ImageFile" id="ImageFile" accept="image/*" />
</p>
<p>
    <input type="text" name="title" required placeholder="Image Title" >
</p>
<input type="hidden" name="itemid" value="<%= itemid %>"/>
<p>
    <input type="submit" name="Upload" value="Add" />
</p>
</form>  
      <%   } catch(Exception e) {} %>
      
    </div>
</body>
</html>