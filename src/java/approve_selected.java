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

public class approve_selected extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
         RequestDispatcher rd=request.getRequestDispatcher("/approve_users.jsp");
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
                     x=st.executeUpdate("update user set status='Approved' where status='Not Approved' and user_id='"+userid+"'");
                    i++;
                }
               
                      }
       catch(Exception e)
       {}
       rd.forward(request, response);
        }
    }

