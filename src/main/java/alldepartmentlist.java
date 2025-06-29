

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
 * Servlet implementation class alldepartmentlist
 */
public class alldepartmentlist extends HttpServlet {
	Connection cn = null;
	Statement st=null;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 
			PrintWriter out = resp.getWriter();
			
			HttpSession session = req.getSession();
			
			Database db = new Database ();
			String result = db.Connectdb();
			out.println(result);
			
			 String employee_id = req.getParameter("id");
			 String add_department = req.getParameter("add_department");
	         String event = req.getParameter("submit");
			 
			 
			 out.println(employee_id);
			 out.println(add_department);
			 out.println(event);
			 
			 if (event.equals("Delete"))
			 {
			   try {
				    String sql = "  delete from Newdepart where employee_Newdepart = '"+employee_id+"'";
					String delete = db.delete(sql);
					out.println(delete);
					resp.setContentType("text/html");
					out.println("<script type=\"text/javascript\"> alert(' Department Deleted '); location='alldepartmentlist.jsp'; </script>");
				   }
			   catch (Exception ex)
				{
					 out.println(ex.toString());
				}
			 }
			 
			 
			 if (event.equals("Edit"))
			 {
				 session.setAttribute("employee_id", employee_id);
				 session.setAttribute("add_department", add_department);
				 resp.sendRedirect("editdepart.jsp");
			 }
	}

}
