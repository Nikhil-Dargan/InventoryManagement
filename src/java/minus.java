
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

public class minus extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        RequestDispatcher rd=request.getRequestDispatcher("/inven_manage.jsp");
        try {
            TimeZone tz = TimeZone.getTimeZone("UTC");
DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
df.setTimeZone(tz);
String current_date = df.format(new Date());

          String itemid=(String)request.getParameter("itemid");
          String sold_to=(String)request.getParameter("t3");
          //String sold_date=(String)request.getParameter("t4");
          if(sold_to.equals("null"))
              sold_to="Unkwnown";
          if(sold_to.equals("null"))
              //sold_date=current_date;
          Class.forName("com.mysql.jdbc.Driver");
          int change_quantity=Integer.parseInt(request.getParameter("t1"));
          int current_quantity = Integer.parseInt((String)request.getParameter("current_quantity"));
          Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/invenmanage?zeroDateTimeBehavior=convertToNull","root","12345");
          Statement st=con.createStatement();
          int new_quantity= current_quantity - change_quantity; 
          if(new_quantity < 0)
          {
          request.setAttribute("error","yes");
          }
          else
          {int x=st.executeUpdate("update items set quantity='"+new_quantity+"', date_of_last_updation='"+current_date+"' where item_id='"+itemid+"'");
           PreparedStatement ps=con.prepareStatement("insert into sold_out_details(item_id,sold_to,date_of_sold,quantity) values(?,?,?,?)");
                ps.setString(1,itemid);
                ps.setString(2,sold_to);
                ps.setString(3,current_date);
                ps.setInt(4,change_quantity);
                int x1=ps.executeUpdate();
          }rd.forward(request, response);
        
        } catch(Exception e) {}
        
    }

  }
