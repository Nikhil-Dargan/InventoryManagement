import com.sun.org.apache.bcel.internal.generic.LASTORE;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class forgotpass2 extends HttpServlet {
   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        RequestDispatcher rd=request.getRequestDispatcher("/forgotpass.jsp");
       
        try {
                String answer=request.getParameter("t1");
                String userid=request.getParameter("t2");
                String ques=request.getParameter("t3");
                
                try {      
                Class.forName("com.mysql.jdbc.Driver");
                Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/invenmanage?zeroDateTimeBehavior=convertToNull","root","12345");
                
          
                PreparedStatement st_chk_username=con.prepareStatement("select password from user where answer='"+answer+"' and user_id='"+userid+"'");
                ResultSet rs2=st_chk_username.executeQuery();
                int flag=0;
                
                String password=""; 
                while(rs2.next())
                 {
                     password=rs2.getString(1);
                         flag=1;
                 }
                if(flag==0)
                {
     
                request.setAttribute("error2","yes");
                request.setAttribute("ques",ques);
                
                request.setAttribute("submit","yes");
                
                    request.setAttribute("userid",userid);
                rd.forward(request, response);
                }
                    request.setAttribute("success", "yes");
                    
                    request.setAttribute("pass", password);
                    rd.forward(request, response);
                
                /*end*/
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(signup.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(signup.class.getName()).log(Level.SEVERE, null, ex);
            }
        } finally {            
            out.close();
           // con.close();
          }
    }

}
