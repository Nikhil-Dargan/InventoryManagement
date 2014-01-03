/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author nikhil
 */
public class del_acc extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        RequestDispatcher rd=request.getRequestDispatcher("/logout.jsp");
      out.println("aa");
        try {
            String userid=request.getParameter("userid");
             Class.forName("com.mysql.jdbc.Driver");
               Connection con= java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/invenmanage?zeroDateTimeBehavior=convertToNull","root","12345");
               Statement st=con.createStatement();
      out.println("\n"+userid);
                int x=st.executeUpdate("delete from user where user_id='"+userid+"'");
      out.println("aa");
                if(x==0)
                    out.println("error..try again..");
                rd.forward(request, response);
        } 
        catch(Exception e) {}
        finally {            
            out.close();
        }
    }

   
}
