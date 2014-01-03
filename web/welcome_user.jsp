<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="style.css">
<link rel="icon" href="images/favicon.ico" type="image/png" />
<link rel="shortcut icon" href="images/favicon.ico" type="image/png" /> 

</head>
<body >

<%  
    try {
        RequestDispatcher rd=request.getRequestDispatcher("/index.jsp");
        String s1=(String)request.getAttribute("name");
    Integer s2=(Integer)request.getAttribute("role");
    String s3=(String)request.getAttribute("img");
    
    session.setAttribute("logged_in_info_name", s1);
    session.setAttribute("logged_in","true");
    session.setAttribute("logged_in_info_role", s2);
    session.setAttribute("logged_in_info_img",s3);
    rd.forward(request, response);
    out.println(s1);
    } catch(Exception e) {}
  %>

</body>
</html>
