<%@page import="java.sql.PreparedStatement"%>
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
        RequestDispatcher rd=request.getRequestDispatcher("/inven_image.jsp");
        String ImageFile="";
        String itemName = "";
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        List items = null;
         items = upload.parseRequest(request);

 
    Iterator itr = items.iterator(); 
    String item_title = "default";
    String itemid = "-1";
    int count=0;
    while (itr.hasNext())
    {
        count++;
        FileItem item = (FileItem) itr.next();
        if (item.isFormField())
        {
            String name = item.getFieldName();
            String value = item.getString();
           if(count==2)
               item_title=value;
           if(count==3)
               itemid=value;
           if(name.equals("ImageFile"))
            {
                ImageFile=value;
            }
        }
        else
        {

            itemName = item.getName();
           
            File savedFile= new File(config.getServletContext().getRealPath("/images/Database/Item_")+itemName);
            img_path= config.getServletContext().getRealPath("/images/Database/Item_")+itemName;
            
            img_path="Item_"+itemName;
            item.write(savedFile);
            
        }
    }
        String userid=(String)session.getAttribute("logged_in_info_name");
        int item_id=Integer.parseInt(itemid);
        java.sql.Connection con;
            java.sql.ResultSet rs;
            java.sql.Statement st;
                    Class.forName("com.mysql.jdbc.Driver");
                con= DriverManager.getConnection("jdbc:mysql://localhost:3306/invenmanage?zeroDateTimeBehavior=convertToNull","root","12345");
                st=con.createStatement();
                        PreparedStatement ps=con.prepareStatement("insert into item_image(item_id,img_path,img_title) values(?,?,?)");
                    ps.setInt(1,item_id);
                        ps.setString(2,img_path);
                        ps.setString(3,item_title);
                        int x1=ps.executeUpdate();
                        out.println("aa="+x1);
                        if(x1==0)
                            out.println("error..try again");
                        else
                        {
                            request.setAttribute("added","yes");
                            request.setAttribute("itemid",itemid);
                            rd.forward(request,response);
                        }   
    }

catch (Exception e)
{}
%>
