<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Inventory </title>
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
        <% String s1=(String)(session.getAttribute("logged_in_info_name")); %>
        <% int role=(Integer)(session.getAttribute("logged_in_info_role")); %>
        <%@ page import="javax.*" %>
        <%@ page import="java.*;" %>
        
        <%
            java.sql.Connection con;
            java.sql.ResultSet rs;
            java.sql.PreparedStatement ps;
            String status="Not Approved";
           try{ 
               if(request.getAttribute("error")!=null) {%>
               <font face="comic sans ms" color="green">You don't have enough stock. Last transaction was not processed.</font>
               <% }
                   
               Class.forName("com.mysql.jdbc.Driver");
                
                con= java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/invenmanage?zeroDateTimeBehavior=convertToNull","root","12345");
               if(role==0) 
                ps=con.prepareStatement("select * from items where user_id='"+s1+"'");
               else
                ps=con.prepareStatement("select * from items ");
                 
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
                    <% if(role==1) { %>
                    <th style="padding:20px"><a style="font-size:20px">User Name</a></th>
                    <% } %>
                    <th style="padding:20px"><a style="font-size:20px">Item Name</a></th>
                    <th style="padding:20px"><a style="font-size:20px">Quantity</a></th>
                    <th style="padding:20px"><a style="font-size:20px">Last Updated</a></th>
                    <th></th>
                </tr>
            </thead>
            <tbody style="text-align:center;">
           <% } %>
    
        <tr>
            <% if(role==1) { %>
            <td><a><%=rs.getString(2)%></a></td>
            <% } %>
           <td><a><%=rs.getString(3)%></a></td>
           <td><a><%=rs.getString(4)%></a></td>
           <td><a><%=rs.getString(5)%></a></td>
           <td><form action="inven_update" method="post">
                     <input type="hidden" value="<%=rs.getInt(1)%>" name="itemid">
                     <input type="submit" id="infoo" value=" Update item " name="<%=rs.getInt(1)%>">
           </form></td>
           <td><form action="inven_image.jsp" method="post">
                     <input type="hidden" value="<%=rs.getInt(1)%>" name="itemid">
                     <input type="submit" id="infoo" value=" Images " name="<%=rs.getInt(1)%>">
           </form></td>
              <td><form action="inven_history.jsp" method="post">
                     <input type="hidden" value="<%=rs.getInt(1)%>" name="item_id">
                     <input type="submit" id="infoo" value=" History " name="<%=rs.getInt(1)%>">
           </form></td>
           
       </tr>
        <% }  %>
        </tbody></table>
        <br><br>

       <% if(count==0)
        { %>
        <font color="red" face="comic sans ms">Currently you have no items.</font>
       <% }
        %>
        
        <% } catch(Exception e) {} %>
        <br><br><br><hr>
            <font color="purple" size="15" face="comic sans ms">ADD ITEMS</font>
        <form action="add_items" method="post">
            &nbsp;&nbsp;<font color="green" face="comic sans ms">Item Name: <input type="text" name="t1" required maxlength="30"></font>
            <br>
            &nbsp;&nbsp;<font color="green" face="comic sans ms">Initial Quantity: <input type="number" name="t2" required min="1" ></font>
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="submit" name="t3" value="Add">
            <input type="hidden" name="t4" value="<%= session.getAttribute("logged_in_info_name") %>">
          <% String s=(String)request.getAttribute("item_status");
              if(s == "added")
          { %>
          <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <font face="comic sans ms" color="purle">Item has been added.</font>
          <% request.removeAttribute("item_status"); } %>
        </form>
        
    </div>
    </body>
</html>
