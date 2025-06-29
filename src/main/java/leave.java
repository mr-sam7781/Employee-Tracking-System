

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
 * Servlet implementation class leave
 */
public class leave extends HttpServlet {
	
	Connection cn = null;
	Statement st=null;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = resp.getWriter();
		
		HttpSession session = req.getSession();
		
		Database db = new Database ();
		String result = db.Connectdb();
		out.println(result);
		
		 String employeename = req.getParameter("employeename");
		 String empepartment = req.getParameter("empepartment"); 
		 String leavefrom = req.getParameter("leavefrom");
		 String leaveto = req.getParameter("leaveto");
		 String taskDescription = req.getParameter("taskDescription");
		 String event = req.getParameter("submit");
		 
		 
		 out.println(employeename);
		 out.println(empepartment);
		 
		 out.println(leavefrom);
		 out.println(leaveto);
		 out.println(taskDescription);
		 out.println(event);
		 
		 if (event.equals("SUBMIT"))
		 {
			 if (employeename.equals("") ||empepartment.equals("") || leavefrom.equals("") ||leaveto.equals("") || taskDescription.equals(""))
			 {
			 
			 resp.setContentType("text/html");
			 out.println("<script type=\"text/javascript\"> alert('please fill all the fields'); location='leave.jsp'; </script>");
			 }
			 else
			 {
				 try
					{
						String sql = "insert into leave_report (employee_name,employee_department,leave_from,leave_to,reason_for_leave, leave_status, employee_id)values ('"+employeename+"' , '"+empepartment+"' , '"+leavefrom+"' , '"+leaveto+"','"+taskDescription+"','Pending', '"+session.getAttribute("employee_id")+"')";
						String insert = db.Insert(sql);
						out.println(insert);
						 resp.setContentType("text/html");
						 out.println("<script type=\"text/javascript\"> alert('leave request successfully'); location='leave.jsp'; </script>");
					}
					catch (Exception ex)
					{
						out.println(ex.toString());
					}
			 }
		 }
	}

}
