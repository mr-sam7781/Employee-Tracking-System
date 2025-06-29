

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
 * Servlet implementation class cancel_leave
 */
public class cancel_leave extends HttpServlet {
	
	
	Connection cn = null;
	Statement st=null;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = resp.getWriter();
		
		HttpSession session = req.getSession();
		
		Database db = new Database ();
		String result = db.Connectdb();
		out.println(result);
		
		 String leave_id = req.getParameter("leave_id"); 
		 String event = req.getParameter("submit");
		 
		 
		 out.println(leave_id); 
		 out.println(event);
		 
		 if (event.equals("Cancel Leave"))
		 {
			 if (leave_id.equals("") )
			 {
			 
			 resp.setContentType("text/html");
			 out.println("<script type=\"text/javascript\"> alert('leave_id not added properly'); location='leave.jsp'; </script>");
			 }
			 else
			 {
				 try
					{
						String sql = "update leave_report set leave_status = 'Cancelled by Employee' where leave_id='"+leave_id+"'";
						String update = db.update(sql);
						out.println(update);
						 resp.setContentType("text/html");
						 out.println("<script type=\"text/javascript\"> alert('leave has been canecelled'); location='leave.jsp'; </script>");
					}
					catch (Exception ex)
					{
						out.println(ex.toString());
					}
			 }
		 }
	}

}
