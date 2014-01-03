import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class signin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
         RequestDispatcher rd_user=request.getRequestDispatcher("/welcome_user.jsp");
         RequestDispatcher rd_admin=request.getRequestDispatcher("/welcome_admin.jsp");
         RequestDispatcher rd_unreg=request.getRequestDispatcher("/not_approved.jsp");
         RequestDispatcher rd_wrong_cred=request.getRequestDispatcher("/index.jsp");
        String username_chk=request.getParameter("t1");
        String password=request.getParameter("t2");
                
       try
       {Class.forName("com.mysql.jdbc.Driver");
       
                Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/invenmanage?zeroDateTimeBehavior=convertToNull","root","12345");
                PreparedStatement st_signin_chk=con.prepareStatement("select user_id,name,password,role,status,img_path from user where user_id='"+username_chk+"' and password='"+password+"'");
                ResultSet rs2=st_signin_chk.executeQuery();
                int flag=0;
                String username="";
                String name="";
                String status="";
                int role=-1;
                String img="";
                if(rs2.next())
                 {
                  username=rs2.getString(1);
                  role=rs2.getInt(4);
                  name=rs2.getString(2);
                  status=rs2.getString(5);
                  img=rs2.getString(6);
                 }
                else
                {
                    request.setAttribute("wrong_pass","true");
                    rd_wrong_cred.forward(request, response);
                }
                request.setAttribute("name",username);
                request.setAttribute("role",role);
                request.setAttribute("img",img);
                
                
                if(role==0)
                {
                    if(status.equals("Not Approved"))
                        rd_unreg.forward(request,response);
                    else
                        rd_user.forward(request, response);
                }
                if(role==1)
                {
                    rd_admin.forward(request,response);
                }
                
       }
       catch(Exception e)
       {}
        }
    }

