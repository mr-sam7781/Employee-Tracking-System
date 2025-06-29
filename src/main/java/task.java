

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class task
 */
public class task extends HttpServlet {
	
	Connection cn = null;
	Statement st=null;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       PrintWriter out = resp.getWriter();
		
		Database db = new Database ();
		String result = db.Connectdb();
		out.println(result);
		
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		String today = formatter.format(date);
		
		
		String department_name = req.getParameter("department_name");
		String employee_name = req.getParameter("employee_name");
		String employee_id = req.getParameter("employee_id");
		String task_priority = req.getParameter("task_priority");
		String task_title = req.getParameter("task_title");
		String task_description = req.getParameter("task_description");
		String task_file = req.getParameter("task_file");
		String task_submit_date = req.getParameter("task_submit_date");
		String event = req.getParameter("submit");
		
		 out.println(department_name);
		 out.println(employee_name);
		 out.println(employee_id);
		 out.println(task_priority);
		 out.println(task_title);
		 out.println(task_description);
		 out.println(task_file);
		 out.println(task_submit_date);
		 out.println(event);
		 
		 if (event.equals("Add Task"))
		 {
			 
			
			 if (department_name.equals("") ||employee_name.equals("") || employee_id.equals("") ||task_priority.equals("") || task_title.equals("") || task_description.equals("") ||task_file.equals("") ||task_submit_date.equals("") )
			 {
				 
			 resp.setContentType("text/html");
			 out.println("<script type=\"text/javascript\"> alert('please fill all the fields'); location='task.jsp'; </script>");
			 }
			 else
			 {
				
				 try
					{
					 
						String sql = "insert into task (department_name,employee_name,employee_id,task_priority,task_title,task_description,task_document,task_submit_last_date, assigned_date)values ('"+department_name+"' , '"+employee_name+"' , '"+employee_id+"', '"+task_priority+"','"+task_title+"' , '"+task_description+"' , '"+task_file+"' , '"+task_submit_date+"', '"+today+"')";
						String insert = db.Insert(sql);
						out.println(insert);
						 resp.setContentType("text/html");
						 out.println("<script type=\"text/javascript\"> alert('Add Task Successfully'); location='task.jsp'; </script>");
					}
					catch (Exception ex)
					{
						 out.println("value ");
						out.println(ex.toString());
					}
			 }
		 }
	}

}
