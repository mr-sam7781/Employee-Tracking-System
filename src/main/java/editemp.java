 

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
 * Servlet implementation class editemp
 */
public class editemp extends HttpServlet {
	Connection cn = null;
	Statement st=null;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 
		PrintWriter out = resp.getWriter();
		
		Database db = new Database ();
		String result = db.Connectdb();
		out.println(result);
		
		 String Department_name = req.getParameter("Department_name");
		 String Employee_Name = req.getParameter("Employee_Name");
		 String Employee_Id = req.getParameter("Employee_Id");
		 String password = req.getParameter("password");
		 String mail = req.getParameter("mail");
		 String contact = req.getParameter("contact");
		 String city = req.getParameter("city");
		 String Employee_Birth_Date = req.getParameter("Employee_Birth_Date");
		 String Employee_joining_Date = req.getParameter("Employee_joining_Date");
		 String Employee_Pic = req.getParameter("emp_pic");
		 String Gender = req.getParameter("Gender");
		 String event = req.getParameter("submit");
		 
		 
		 out.println(Department_name);
		 out.println(Employee_Name);
		 out.println(Employee_Id);
		 out.println(password);
		 out.println(mail);
		 out.println(contact);
		 out.println(city);
		 out.println(Employee_Birth_Date);
		 out.println(Employee_joining_Date);
		 out.println(Employee_Pic);
		 out.println(Gender);
		 out.println(event);
		 
		if (event.equals("EDIT")) 
		{
			if (Department_name.equals("") ||Employee_Name.equals("") ||Employee_Id.equals("") ||password.equals("") ||mail.equals("") ||contact.equals("") ||city.equals("") ||Employee_Birth_Date.equals("") ||Employee_joining_Date.equals("") ||Employee_Pic.equals("") ||Gender.equals(""))
			{
				 resp.setContentType("text/html");
				 out.println("<script type=\"text/javascript\"> alert('please fill all the fields'); location='editemp.jsp'; </script>");
			}
			else
			{
				try
				{
					String sql = " update AddEMP set department_name = '"+Department_name+"' , employee_name = '"+Employee_Name+"' , employee_id = '"+Employee_Id+"', employee_password = '"+password+"',employee_email= '"+mail+"', employee_contact ='"+contact+"',employee_city ='"+city+"',employee_dob='"+Employee_Birth_Date+"', employee_doj='"+Employee_joining_Date+"',employee_pic='"+Employee_Pic+"',employee_gender ='"+Gender+"'  where employee_id='"+Employee_Id+"' ";
					String insert = db.Insert(sql);
					out.println(insert);
					resp.setContentType("text/html");
					out.println("<script type=\"text/javascript\"> alert(' Edit Employee Successfully'); location='editemp.jsp'; </script>");
				}
				catch (Exception ex)
				{
					out.println(ex.toString());
				}
			}
			
		}
	}

}
