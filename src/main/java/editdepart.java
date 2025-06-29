

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
 * Servlet implementation class editdepart
 */
public class editdepart extends HttpServlet {
	
	Connection cn = null;
	Statement st=null;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		PrintWriter out = resp.getWriter();
		HttpSession session = req.getSession();
		
		Database db = new Database ();
		String result = db.Connectdb();
		out.println(result);
		
		String add_department = req.getParameter("Add_Department");
		 String event = req.getParameter("submit");
		 
		 out.println(add_department);
		 out.println(event);
		
		 
		 if (event.equals("EDIT"))
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
						String sql = "update Newdepart set add_department = '"+add_department+"' where employee_Newdepart = '"+session.getAttribute("employee_id")+"' ";
						String insert = db.Insert(sql);
						out.println(insert);
						resp.setContentType("text/html");
						out.println("<script type=\"text/javascript\"> alert(' Edit Department Successfully'); location='allemployee.jsp'; </script>");
					}
					catch (Exception ex)
					{
						out.println(ex.toString());
					}
			 }
		 }
	}

}
