

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
 * Servlet implementation class employeenewtask
 */
public class employeenewtask extends HttpServlet {
	
	Connection cn = null;
	Statement st=null;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 	
			PrintWriter out = resp.getWriter();
			HttpSession session = req.getSession();
		 	
		 	Database db = new Database ();
			String result = db.Connectdb();
			out.println(result);
			
			String task_id = req.getParameter("task_id");
			 String event = req.getParameter("submit");
			 
			 out.println(task_id);
			 out.println(event);
			 
			 if(event.equals("View"))
			 {
				 session.setAttribute("task_id", task_id);
				 resp.sendRedirect("inprocesstaskemp.jsp");
			 }
	}

}
