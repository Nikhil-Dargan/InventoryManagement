import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.catalina.Session;
public class add_items extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        RequestDispatcher rd_success=request.getRequestDispatcher("/inven_manage.jsp");
        RequestDispatcher rd_error=request.getRequestDispatcher("/error.jsp");
        
TimeZone tz = TimeZone.getTimeZone("UTC");
DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
df.setTimeZone(tz);
String current_date = df.format(new Date());
      try {
                String item_name=request.getParameter("t1");
                int quantity= Integer.parseInt(request.getParameter("t2"));
                String user_id=request.getParameter("t4");
                try {      
                Class.forName("com.mysql.jdbc.Driver");
                Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/invenmanage?zeroDateTimeBehavior=convertToNull","root","12345");
                
             
                PreparedStatement insert=con.prepareStatement("insert into items(user_id,item_name,quantity,date_of_last_updation) values(?,?,?,?)");
                insert.setString(1,user_id);
                insert.setString(2,item_name);
                insert.setInt(3,quantity);
                insert.setString(4,current_date);
                int x1=insert.executeUpdate();
                if(x1==1)
                {
                    request.setAttribute("item_status", "added");
                    rd_success.forward(request,response);
                    
                
                }
                    else
                    rd_error.forward(request, response);
            
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(signup.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(signup.class.getName()).log(Level.SEVERE, null, ex);
            }
        } finally {            
            out.close();
        }
    }

}
