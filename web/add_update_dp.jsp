<%@page import="java.sql.DriverManager"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="java.util.*, java.io.*" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.File"%>
<%@ page contentType="text/html;charset=UTF-8" %>
 
<%
try
{
        String img_path="";
        RequestDispatcher rd=request.getRequestDispatcher("/profile_pic.jsp");
        String ImageFile="";
        String itemName = "";
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        List items = null;
         items = upload.parseRequest(request);

 
    Iterator itr = items.iterator();    
    while (itr.hasNext())
    {
        FileItem item = (FileItem) itr.next();
        if (item.isFormField())
        {
            String name = item.getFieldName();
            String value = item.getString();
            
            if(name.equals("ImageFile"))
            {
                ImageFile=value;
            }

        }
        else
        {

            itemName = item.getName();
           
            File savedFile= new File(config.getServletContext().getRealPath("/images/Database/DP_")+itemName);
            img_path= config.getServletContext().getRealPath("/images/Database/DP_")+itemName;
            out.println(img_path);
            img_path="DP_"+itemName;
            out.println(img_path);
            item.write(savedFile);
        }
        String userid=(String)session.getAttribute("logged_in_info_name");
        java.sql.Connection con;
            java.sql.ResultSet rs;
            java.sql.Statement st;
                    Class.forName("com.mysql.jdbc.Driver");
                con= DriverManager.getConnection("jdbc:mysql://localhost:3306/invenmanage?zeroDateTimeBehavior=convertToNull","root","12345");
                st=con.createStatement();
                        int x=st.executeUpdate("update user set img_path='"+img_path+"' where user_id='"+userid+"'");
                        if(x==0)
                            out.println("error..try again");
                        else
                        {
                            session.removeAttribute("logged_in_info_img");
                            session.setAttribute("logged_in_info_img",img_path);
                            rd.forward(request,response);
                        }   
    }
}
catch (Exception e)
{}
%>
