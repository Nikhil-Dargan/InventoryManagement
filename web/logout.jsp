<%-- 
    Document   : logout
    Created on : Oct 17, 2013, 1:04:39 AM
    Author     : nikhil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            RequestDispatcher rd=request.getRequestDispatcher("/index.jsp");
        session.removeAttribute("logged_in_info_name");
        session.removeAttribute("logged_in");
        session.removeAttribute("logged_in_info_role");
        session.removeAttribute("logged_in_info_img");
        
        rd.forward(request, response);
        %>
        <h1>Hello World!</h1>
    </body>
</html>
