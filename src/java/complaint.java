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

public class complaint extends HttpServlet {
   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        RequestDispatcher rd=request.getRequestDispatcher("/complaint.jsp");
       
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
                String resolved="No";
                
                out.println("a");
                if(type_t == null)
                {
                            type="Guest";

                out.println("a");
                        PreparedStatement ps=con.prepareStatement("insert into complaint(type,name,message,viewed,resolved) values(?,?,?,?,?)");
                        ps.setString(2,name);
                        ps.setString(3,message);
                        ps.setString(1,type);
                        ps.setString(4,viewed);
                        ps.setString(5,resolved);
                        int x=ps.executeUpdate();
                }
                else if(type_t.equals("1") || type_t.equals("0"))
                {
                            type="User";

                out.println("b");
                        PreparedStatement ps1=con.prepareStatement("insert into complaint(type,name,message,viewed,resolved,user_id) values(?,?,?,?,?,?)");
                        ps1.setString(2,name);
                        ps1.setString(3,message);
                        ps1.setString(1,type);
                        ps1.setString(4,viewed);
                        ps1.setString(5,resolved);
                        ps1.setString(6,userid);
                        int x1=ps1.executeUpdate();
                        
                out.println("b");
                }
                
                
                out.println("a");
                request.setAttribute("complaint", "yes");
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
