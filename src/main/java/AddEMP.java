


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
 * Servlet implementation class AddEMP
 */
public class AddEMP extends HttpServlet {
	
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
		 String Employee_Pic = req.getParameter("Employee_Pic");
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
		 
		if (event.equals("SUBMIT"))
		{
			if (Department_name.equals("") ||Employee_Name.equals("") ||Employee_Id.equals("") ||password.equals("") ||mail.equals("") ||contact.equals("") ||city.equals("") ||Employee_Birth_Date.equals("") ||Employee_joining_Date.equals("") ||Employee_Pic.equals("") ||Gender.equals(""))
			{
				 resp.setContentType("text/html");
				 out.println("<script type=\"text/javascript\"> alert('please fill all the fields'); location='AddEMP.jsp'; </script>");
			}
			else
			{
				try
				{
					String sql = "insert into AddEMP (employee_id,department_name,employee_name,employee_password,employee_email,employee_contact,employee_city,employee_dob, employee_doj,employee_pic,employee_gender) values ('"+Employee_Id+"' , '"+Department_name+"' , '"+Employee_Name+"' , '"+password+"' , '"+mail+"' , '"+contact+"' , '"+city+"' , '"+Employee_Birth_Date+"', '"+Employee_joining_Date+"','"+Employee_Pic+"' , '"+Gender+"')";
					String insert = db.Insert(sql);
					out.println(insert);
					resp.setContentType("text/html");
					out.println("<script type=\"text/javascript\"> alert('Employee Added'); location='AddEMP.jsp'; </script>");
				}
				catch (Exception ex)
				{
					out.println(ex.toString());
				}
			}
			
		}
	}
}
