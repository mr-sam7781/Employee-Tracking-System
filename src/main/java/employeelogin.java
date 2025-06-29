  

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;

import javax.swing.JOptionPane;

import java.io.*;

/**
 * Servlet implementation class employeelogin
 */
public class employeelogin extends HttpServlet {
	
	Connection cn = null;
	Statement st = null;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		PrintWriter out = resp.getWriter();
		
		HttpSession session = req.getSession();
		
		Database db = new Database();
		String result = db.Connectdb();
		out.println(result);
		
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String event = req.getParameter("submit");
		
		out.println(username);
		out.println(password);
		out.println(event);
		
		if(event.equals("LOGIN"))
		{
			if(username.equals("") || password.equals(""))
			{
				resp.setContentType("text/html");
				out.println(" <script type=\"text/javascript\"> alert('Some value is Empty'); loaction='employeelogin.jsp'; </script> ");
			}
			else
			{
				try
				{
					  Class.forName("com.mysql.jdbc.Driver");
		              cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_tracking_system","root","root");
		              String sql = "select * from addemp where employee_id = '"+username+"' && employee_password = '"+password+"' ";
		              st=cn.createStatement();
		              ResultSet rs=st.executeQuery(sql);
		              
		              if(rs.next())
		              {	
		            	  
		            	  session.setAttribute("employee_id", rs.getString("employee_id"));
		            	  session.setAttribute("employee_pic", rs.getString("employee_pic"));
		            	  
		            	  
		            	  out.println("Login Successfully");
		            	  resp.setContentType("text/html");
		            	  out.println("<script type=\"text/javascript\"> alert('Login Success'); location='employeedashboard.jsp'; </script>");
		            	  
		              }
		              else
		              {
		            	  out.println("Login Failed");
		            	  resp.setContentType("text/html");
		            	  out.println("<script type=\"text/javascript\"> alert('Login Failed'); location='employeelogin.jsp'; </script>");
		              }
				}
				catch(Exception ex)
				{
					out.println(ex.toString());
				}
			}
		}
		
		
	}

}
