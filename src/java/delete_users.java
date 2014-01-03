import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class delete_users extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
         RequestDispatcher rd=request.getRequestDispatcher("/delete_users.jsp");
       //out.println("aaa");
         String[] ids=request.getParameterValues("users");
           
       try
       {Class.forName("com.mysql.jdbc.Driver");
                Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/invenmanage?zeroDateTimeBehavior=convertToNull","root","12345");
                int x,i=0;
                String userid;
                while(i < ids.length)
                {
                    userid=ids[i];
                    Statement st=con.createStatement();
                     x=st.executeUpdate("delete from user where user_id='"+userid+"'");
                    i++;
                }
               request.setAttribute("deleted","yes");
               
                rd.forward(request, response);
                      }
       catch(Exception e)
       {}
       rd.forward(request, response);
        }
    }

