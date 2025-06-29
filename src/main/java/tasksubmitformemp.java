

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
 * Servlet implementation class tasksubmitformemp
 */
public class tasksubmitformemp extends HttpServlet {
	
	Connection cn = null;
	Statement st=null;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	PrintWriter out = resp.getWriter();
		
		Database db = new Database ();
		String result = db.Connectdb();
		out.println(result);
		
		String tasktitle = req.getParameter("tasktitle");
		 String Department_Name = req.getParameter("Department_Name");
		 String Employee_ID = req.getParameter("Employee_ID");
		 String Employee_Name = req.getParameter("Employee_Name");
		 String Task_Completed_File = req.getParameter("Task_Completed_File");
		 String Submit_Date = req.getParameter("Submit_Date");
		 String event = req.getParameter("submit");
		 
		 
		 out.println(tasktitle);
		 out.println(Department_Name);
		 out.println(Employee_ID);
		 out.println(Employee_Name);
		 out.println(Task_Completed_File);
		 out.println(Submit_Date);
		 out.println(event);
		 
		
		 
		 if (event.equals("Submit"))
		 {
			 if (tasktitle.equals("") || Department_Name.equals("") ||Employee_ID.equals("") || Employee_Name.equals("") || Task_Completed_File.equals("") ||Submit_Date.equals("")  )
			 {
			 
			 resp.setContentType("text/html");
			 out.println("<script type=\"text/javascript\"> alert('please fill all the fields'); location='tasksubmitformemp.jsp'; </script>");
			 }
			 else
			 {
				 try
					{
						String sql = "insert into tasksubmitformemp (task_title,department_name,employee_id,task_completed_file,submit_date,emp_name )values ('"+tasktitle+"','"+Department_Name+"' , '"+Employee_ID+"' , '"+Task_Completed_File+"' , '"+Submit_Date+"', '"+Employee_Name+"')";
						String insert = db.Insert(sql);
						out.println(insert);
						resp.setContentType("text/html");
						out.println("<script type=\"text/javascript\"> alert('Task Submit Successfully'); location='tasksubmitformemp.jsp'; </script>");
					}
					catch (Exception ex)
					{
						out.println(ex.toString());
					}
			 }
		 }
	}

}
