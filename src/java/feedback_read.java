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

public class feedback_read extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
         RequestDispatcher rd=request.getRequestDispatcher("/view_feedback.jsp");
       //out.println("aaa");
         String[] ids=request.getParameterValues("feedback");
           
       try
       {Class.forName("com.mysql.jdbc.Driver");
                Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/invenmanage?zeroDateTimeBehavior=convertToNull","root","12345");
                int x,i=0;
                String feedbackid;
                while(i < ids.length)
                {
                    feedbackid=ids[i];
                    Statement st=con.createStatement();
                     x=st.executeUpdate("update feedback set viewed='Yes' where viewed='No' and feedback_id='"+feedbackid+"'");
                    i++;
                }
               
                      }
       catch(Exception e)
       {}
       rd.forward(request, response);
        }
    }
