

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class admin_login
 */
public class admin_login extends HttpServlet {
	
	Connection cn = null;
	Statement st=null;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 
		PrintWriter out = resp.getWriter();
		
		Database db = new Database ();
		String result = db.Connectdb();
		out.println(result);
		
		 String username = req.getParameter("username");
		 String password = req.getParameter("password"); 
		 String event = req.getParameter("submit");
		 
		 
		 out.println(username);
		 out.println(password); 
		 out.println(event);
		 
		if (event.equals("LOGIN"))
		{
			if (username.equals("") ||password.equals("")  )
			{
				 resp.setContentType("text/html");
				 out.println("<script type=\"text/javascript\"> alert('please fill all the fields'); location='admin_login.jsp'; </script>");
			}
			else
			{
				 if(username.equals("Admin") && password.equals("Admin"))
				 {
					 resp.setContentType("text/html");
					 out.println("<script type=\"text/javascript\"> alert('Login Succesful'); location='admindash.jsp'; </script>");
				 }
				 else
				 {
					 resp.setContentType("text/html");
					 out.println("<script type=\"text/javascript\"> alert('Login Failed'); location='admin_login.jsp'; </script>");
				 }
			}
			
		}
	}
}