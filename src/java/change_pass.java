
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.catalina.Session;

public class change_pass extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        RequestDispatcher rd=request.getRequestDispatcher("/change_pass.jsp");
        try {
          
          String userid=(String)request.getParameter("userid");
          String old_pass=(String)request.getParameter("t1");
          String new_pass=(String)request.getParameter("t2");
          Class.forName("com.mysql.jdbc.Driver");
          out.println(userid+".."+old_pass+",,"+new_pass);
                Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/invenmanage?zeroDateTimeBehavior=convertToNull","root","12345");
                PreparedStatement st_signin_chk=con.prepareStatement("select * from user where user_id='"+userid+"' and password='"+old_pass+"'");
                ResultSet rs2=st_signin_chk.executeQuery();
                int flag=0;
                String username="";
                String name="";
                String status="";
                int role=-1;
                out.println("1");
                if(rs2.next())
                 {
                    Statement st=con.createStatement();
                    int x=st.executeUpdate("update user set password='"+new_pass+"' where user_id='"+userid+"'");
                    request.setAttribute("success", "true");
                    request.setAttribute("newpass",new_pass);
                   rd.forward(request, response);

                 }
                else
                {
                    request.setAttribute("error","true");
                    rd.forward(request, response);
                    
                }
        
        } catch(Exception e) {}
        
    }

  }
