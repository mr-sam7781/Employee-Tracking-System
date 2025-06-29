<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css"> <%@include file="css/bootstrap.css" %> </style>
<link  rel="stylesheet" href="css/editemp.css" type="text/css"/>
<style type="text/css"> <%@include file="css/editemp.css" %> </style>
</head>
<body>
<form name="editemp" action="editemp" method="post">
 
      
<div class="container">

<div class="addemp"><h3>Edit Employee Info</h3></div>

<div class="container2">
  <div class="inputbox">
  <label class="inputtext" for="Department_name">Department name </label>
  <input type="text" name="Department_name" placeholder="Department Name" value="<%= session.getAttribute("department_name") %>">
  </div>
  <div class="inputbox">
  <label for="Employee_Name">Employee Name </label>
  <input type="text" name="Employee_Name" placeholder="Employee Name" value="<%= session.getAttribute("employee_name") %>" >
  </div>
  <div class="inputbox">
  <label for="Employee_I'd">Employee I'd </label>
  <input type="text" name="Employee_Id" placeholder="EMP123" value="<%= session.getAttribute("employee_id") %>"  >
  </div>
  <div class="inputbox">
  <label for="password">Employee Password </label>
  <input type="password" name="password" placeholder="EMP@123" value="<%= session.getAttribute("employee_password") %>" >
  </div>
  <div class="inputbox">
  <label for="mail">Employee Email I'd</label>
  <input type="email" name="mail" placeholder="abc12@gmail.com" value="<%= session.getAttribute("employee_email") %>" >
  </div>
  <div class="inputbox">
  <label for="contact">Employee Contact Number</label>
  <input type="tel" name="contact" placeholder="0987654321" value="<%= session.getAttribute("employee_contact") %>" >
  </div>
  <div class="inputbox">
  <label for="city">Employee City</label>
  <input type="text" name="city" placeholder="mumbai/pune/kolhapur" value="<%= session.getAttribute("employee_city") %>" >
  </div>
  <div class="inputbox">
	  <label for="Employee_Birth_Date">Employee Birth Date</label>
	  <input type="date" name="Employee_Birth_Date" placeholder="" value="<%= session.getAttribute("employee_dob") %>" >
  </div>
  <div class="inputbox">
	  <label for="Employee_joining_Date">Employee joining Date</label>
	  <input type="date" name="Employee_joining_Date" placeholder="" value="<%= session.getAttribute("employee_doj") %>" >
  </div>
  
  <div class="inputbox">
	  <label for="Employee_Pic">Employee Pic</label>
	  <input type="hidden" name="emp_pic" id="emp_pic"  value="<%= session.getAttribute("employee_pic") %>"> 
	  <input type="file" name="Employee_Pic" placeholder=""  id="Employee_Pic" onchange="updateEmpPicValue()">
  </div>
  
  <br><br>
   <div class="inputbox">
	  <label for="Gender">Gender</label>
	  <select name="Gender" id="gender" class="input" >
		  <option value="Male">Male</option>
		  <option value="Female">Female</option>
		  <option value="Other">Other</option> 
	  </select>

  </div>
<input  class="sub" type="submit" name="submit" value="EDIT">
 </div>


</div>
<br>
</form>


</body>

<script type="text/javascript">
  // JavaScript function to update the hidden input value when a file is selected
  function updateEmpPicValue() {
    // Get the file input element
    var fileInput = document.getElementById('Employee_Pic');
    
    // Get the file selected by the user
    var file = fileInput.files[0];
    
    // Get the hidden input element
    var hiddenInput = document.getElementById('emp_pic');
    
    // If a file is selected, set the value of the hidden input to the file name
    if (file) {
      hiddenInput.value = file.name;
    }  
  }
</script>

</html>