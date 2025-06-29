

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class contacthome
 */
public class contacthome extends HttpServlet {
	Connection cn = null;
	Statement st=null;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		PrintWriter out = resp.getWriter();
		
		HttpSession session = req.getSession();
		
		Database db = new Database ();
		String result = db.Connectdb();
		out.println(result);
		
		 String name = req.getParameter("name");
		 String email = req.getParameter("email");
		 String message = req.getParameter("message");
         String event = req.getParameter("submit");
         
         out.println(name);
         out.println(email);
         out.println(message);
		 out.println(event);
		 if (event.equals("Send"))
		 {
			 if (name.equals("") || email.equals("")||message.equals(""))
			 { 
				 resp.setContentType("text/html");
				 out.println("<script type=\"text/javascript\"> alert('please fill all the fields'); location='contacthome.jsp'; </script>");
			 }
			 else
			 {
				 	try
					{
						String sql = "insert into contact (user_name, user_mail, user_massge)values ('"+name+"','"+email+"','"+message+"')";
						String insert = db.Insert(sql);
						out.println(insert);
						resp.setContentType("text/html");
						out.println("<script type=\"text/javascript\"> alert('massege'); location='contacthome.jsp'; </script>");
					}
					catch (Exception ex)
					{
						out.println(ex.toString());
					}
			 }
		 }
	}
}
