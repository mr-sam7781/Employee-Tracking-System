

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
 * Servlet implementation class leaverequest
 */
public class leaverequest extends HttpServlet {
	Connection cn = null;
	Statement st=null;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
	  	
		Database db = new Database ();
		String result = db.Connectdb();
		out.println(result);
		
		 String leave_id = req.getParameter("leave_id");
         String event = req.getParameter("submit");
         
         out.println(leave_id);
		 out.println(event);
		 
		 if(leave_id.equals(""))
		 {
			 	resp.setContentType("text/html");
				out.println(" <script type=\"text/javascript\"> alert('Some value is Empty'); loaction='leaverequest.jsp'; </script> ");
		 }
		 else
		 {
			 try
			 {
				 String sql ="update leave_report set leave_status = '"+event+"' where leave_id='"+leave_id+"' ";
				 String update = db.update(sql);
				 out.println(update);
				 
				 
				 resp.setContentType("text/html");
				 out.println(" <script type=\"text/javascript\"> alert('Status Updated'); loaction='leaverequest.jsp'; </script> ");
			 }
			 catch(Exception ex)
			 {
				 out.println(ex.toString());
			 }
		 }
		 
		
		
	}

}
