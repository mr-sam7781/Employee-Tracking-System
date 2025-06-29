

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
 * Servlet implementation class Newdepart
 */
public class Newdepart extends HttpServlet {
	
	Connection cn = null;
	Statement st=null;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		PrintWriter out = resp.getWriter();
		
		Database db = new Database ();
		String result = db.Connectdb();
		out.println(result);
		
		String add_department = req.getParameter("Add_Department");
		 String event = req.getParameter("submit");
		 
		 out.println(add_department);
		 out.println(event);
		
		 
		 if (event.equals("ADD"))
		 {
			 if (add_department.equals(""))
			 { 
				 resp.setContentType("text/html");
				 out.println("<script type=\"text/javascript\"> alert('please fill all the fields'); location='Newdepart.jsp'; </script>");
			 }
			 else
			 {
				 	try
					{
						String sql = "insert into newdepart (add_department)values ('"+add_department+"')";
						String insert = db.Insert(sql);
						out.println(insert);
						resp.setContentType("text/html");
						out.println("<script type=\"text/javascript\"> alert('Department Added'); location='Newdepart.jsp'; </script>");
					}
					catch (Exception ex)
					{
						out.println(ex.toString());
					}
			 }
		 }
	}

}
