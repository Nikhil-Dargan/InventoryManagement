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

public class add_admin extends HttpServlet {
   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        RequestDispatcher rd_success=request.getRequestDispatcher("/add_admin_success.jsp");
       RequestDispatcher rd_user_exists=request.getRequestDispatcher("/add_admin.jsp");
       
        try {
                String name=request.getParameter("t1");
                String username=request.getParameter("t2");
                String gender=request.getParameter("t3");
                String dob=request.getParameter("t5");
                String email=request.getParameter("t6");
                String password=request.getParameter("t7");
                String confirmpassword=request.getParameter("t8");
                String secret_ques=request.getParameter("t9");
                String answer=request.getParameter("t10");
                try {      
                Class.forName("com.mysql.jdbc.Driver");
                Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/invenmanage?zeroDateTimeBehavior=convertToNull","root","12345");
                
                /*Retreive for checking username already doesnt exit*/
                PreparedStatement st_chk_username=con.prepareStatement("select user_id from user");
                ResultSet rs2=st_chk_username.executeQuery();
                int flag=0;
                String username_chk; 
                while(rs2.next())
                 {
                     username_chk=rs2.getString(1);
                     if(username.equals(username_chk))
                         flag=1;
                 }
                if(flag==1)     
                {
                    request.setAttribute("status", "true");
                    request.setAttribute("name", name);
                     request.setAttribute("dob", dob);
                     request.setAttribute("email", email);
                     //rd.forward(request, response);
                     request.setAttribute("dob", dob);
                     request.setAttribute("secret_ques", secret_ques);
                     request.setAttribute("answer", answer);
                     request.setAttribute("password", password);
                    
                     
                     rd_user_exists.forward(request, response);
                     
                    
                }
                String status="Approved";
                int role=1;
                out.println("aa");
                PreparedStatement user_insert=con.prepareStatement("insert into user(user_id,password,name,gender,dob,email,secret_ques,answer,role,status) values(?,?,?,?,?,?,?,?,?,?)");
                user_insert.setString(1,username);
                user_insert.setString(2,password);
                user_insert.setString(3,name);
                user_insert.setString(4,gender);
                user_insert.setString(5,dob);
                user_insert.setString(6,email);
                user_insert.setString(7,secret_ques);
                user_insert.setString(8,answer);
                
                out.println("aa");
                user_insert.setInt(9,role);
                
                out.println("aa");
                user_insert.setString(10,status);
                
                out.println("aa");
                int x1=user_insert.executeUpdate();
                if(x1==1)
                {
                    
                out.println("aa");
                    request.setAttribute("username", username);
                    request.setAttribute("password", password);
                    rd_success.forward(request,response);
                
                }
                    else
                    out.println("there was an error..try again");
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
