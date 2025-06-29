

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
 * Servlet implementation class inprocesstaskemp
 */
public class inprocesstaskemp extends HttpServlet {
	 
	Connection cn = null;
	Statement st=null;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = resp.getWriter();
		
		HttpSession session = req.getSession();
		
		Database db = new Database ();
		String result = db.Connectdb();
		out.println(result);
		
		
	
		 String progress = req.getParameter("progress");
		 String taskstatus = req.getParameter("taskstatus"); 
		 String event = req.getParameter("submit");
		 

		 out.println(progress);
		 out.println(taskstatus);
		 out.println(event);
		 
		 if (event.equals("Submit"))
		 {
			 if (progress.equals(""))
			 {
			 
			 resp.setContentType("text/html");
			 out.println("<script type=\"text/javascript\"> alert('please fill all the fields'); location='inprocesstaskemp.jsp'; </script>");
			 }
			 else
			 {
				 try
					{
						String sql = "update task set percentage = '"+progress+"', taskstatus ='"+taskstatus+"' where task_id = '"+session.getAttribute("task_id")+"'  ";
						String insert = db.Insert(sql);
						out.println(insert);
					    resp.setContentType("text/html");
						out.println("<script type=\"text/javascript\"> alert('submit successfully'); location='inprocesstaskemp.jsp'; </script>");
					}
					catch (Exception ex)
					{
						out.println(ex.toString());
					}
			 }
		 }
		 
	}

}
