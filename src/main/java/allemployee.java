

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
 * Servlet implementation class allemployee
 */
public class allemployee extends HttpServlet {
	Connection cn = null;
	Statement st=null;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 
		PrintWriter out = resp.getWriter();
		
		HttpSession session = req.getSession();
		
		Database db = new Database ();
		String result = db.Connectdb();
		out.println(result);
		
		 String employee_id1 = req.getParameter("id");
		 String department_name = req.getParameter("department_name");
		 String employee_name = req.getParameter("employee_name");
		 String employee_id = req.getParameter("employee_id");
		 String employee_password = req.getParameter("employee_password");
		 String employee_email = req.getParameter("employee_email");
		 String employee_contact = req.getParameter("employee_contact");
		 String employee_city = req.getParameter("employee_city");
		 String employee_dob = req.getParameter("employee_dob");
		 String employee_doj = req.getParameter("employee_doj");
		 String employee_pic = req.getParameter("employee_pic");
		 String employee_gender = req.getParameter("employee_gender");
         String event = req.getParameter("submit");
		 
		 
		 out.println(employee_id1);
		 out.println(department_name); 
		 out.println(employee_name);
		 out.println(employee_id); 
		 out.println(employee_password); 
		 out.println(employee_email); 
		 out.println(employee_contact); 
		 out.println(employee_city); 
		 out.println(employee_dob); 
		 out.println(employee_doj); 
		 out.println(employee_pic); 
		 out.println(employee_gender); 
		 out.println(event);
		 
		 if (event.equals("Delete"))
		 {
		   try {
			    String sql = "  delete from addemp where employee_AddEMP = '"+employee_id1+"'";
				String delete = db.delete(sql);
				out.println(delete);
				resp.setContentType("text/html");
				out.println("<script type=\"text/javascript\"> alert(' Employee Deleted '); location='allemployee.jsp'; </script>");
			   }
		   catch (Exception ex)
			{
				 out.println(ex.toString());
			}
		 }
		 
		 
		 if (event.equals("Edit"))
		 {
			 session.setAttribute("employee_id1", employee_id1);
			 session.setAttribute("department_name", department_name);
			 session.setAttribute("employee_name", employee_name);
			 session.setAttribute("employee_id", employee_id);
			 session.setAttribute("employee_password", employee_password);
			 session.setAttribute("employee_email", employee_email);
			 session.setAttribute("employee_contact", employee_contact);
			 session.setAttribute("employee_city", employee_city);
			 session.setAttribute("employee_dob", employee_dob);
			 session.setAttribute("employee_doj", employee_doj);
			 session.setAttribute("employee_pic", employee_pic);
			 session.setAttribute("employee_gender", employee_gender);
			 
			 
			 resp.sendRedirect("editemp.jsp");
		 }
		 
		 
		 
		 
	}

}
