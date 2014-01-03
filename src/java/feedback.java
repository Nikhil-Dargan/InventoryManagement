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

public class feedback extends HttpServlet {
   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        RequestDispatcher rd=request.getRequestDispatcher("/feedback.jsp");
       
        try {
                String name=request.getParameter("t1");
                String userid=request.getParameter("userid");
                String message=request.getParameter("t2");
                String type_t=request.getParameter("role");
                String type="";
                
                try {      
                Class.forName("com.mysql.jdbc.Driver");
                Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/invenmanage?zeroDateTimeBehavior=convertToNull","root","12345");
                String viewed="No";
                
                if(type_t == null)
                {
                            type="Guest";

                        PreparedStatement ps=con.prepareStatement("insert into feedback(type,name,message,viewed) values(?,?,?,?)");
                        ps.setString(2,name);
                        ps.setString(3,message);
                        ps.setString(1,type);
                        ps.setString(4,viewed);
                        int x=ps.executeUpdate();
                }
                else if(type_t.equals("1") || type_t.equals("0"))
                {
                            type="User";

                        PreparedStatement ps1=con.prepareStatement("insert into feedback(type,name,message,viewed,user_id) values(?,?,?,?,?)");
                        ps1.setString(2,name);
                        ps1.setString(3,message);
                        ps1.setString(1,type);
                        ps1.setString(4,viewed);
                        ps1.setString(5,userid);
                        int x1=ps1.executeUpdate();
                        
                }
                
                
                request.setAttribute("feedback", "yes");
                rd.forward(request, response);
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
