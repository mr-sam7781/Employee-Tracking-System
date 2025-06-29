<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Employee</title>
<link  rel="stylesheet" type="text/css" href="css/fa/css/font-awesome.css"/>
<link  rel="stylesheet" type="text/css" href="css/fa/css/font-awesome.min.css"/>
<script type="text/javascript" src="js/validation.js"></script>
<style type="text/css"> <%@include file="css/AddEMP.css" %> </style>

</head>
<body>


<div class="topnav">
        <a href="admindash.jsp"></i> Dashboard</a>
        
        <div class="dropdown">
            <button class="dropdown-btn"></i> Department <i class="fa fa-caret-down"></i></button>
            <div class="dropdown-content">
                <a href="Newdepart.jsp">Add Department</a>
                <a href="alldepartmentlist.jsp">All Department</a>
            </div>
        </div>

        <div class="dropdown">
            <button class="dropdown-btn"></i> Employee <i class="fa fa-caret-down"></i></button>
            <div class="dropdown-content">
                <a href="AddEMP.jsp">Add Employee</a>
                <a href="allemployee.jsp">All Employee</a>
            </div>
        </div>

        <div class="dropdown">
            <button class="dropdown-btn"> Task <i class="fa fa-caret-down"></i></button>
            <div class="dropdown-content">
                <a href="task.jsp">Add Task</a>
                <a href="showalltask.jsp">All Task</a>
            </div>
        </div>

        <div class="dropdown">
            <button class="dropdown-btn"> Task Status <i class="fa fa-caret-down"></i></button>
            <div class="dropdown-content">
               
                <a href="viewcompletetask.jsp">Complete All Task</a>
                <a href="submittedtasklist.jsp">Submitted Task</a> 
            </div>
        </div>

        <a href="leaverequest.jsp"></i> Leave Report</a>
        
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            var dropdowns = document.querySelectorAll(".dropdown");

            dropdowns.forEach(function(dropdown) {
                var btn = dropdown.querySelector(".dropdown-btn");

                btn.addEventListener("click", function() {
                    dropdowns.forEach(function(d) {
                        if (d !== dropdown) {
                            d.classList.remove("active");
                        }
                    });

                    dropdown.classList.toggle("active");
                });
            });

            document.addEventListener("click", function(e) {
                if (!e.target.closest(".dropdown")) {
                    dropdowns.forEach(function(dropdown) {
                        dropdown.classList.remove("active");
                    });
                }
            });
        });
    </script>




















<form name="AddEMP" action="AddEMP" method="post">
<div class="container">

<div class="addemp"><h3>Add Employee</h3></div>

<div class="container2">
  <div class="inputbox">
  <label class="inputtext" for="Department_name">Department name </label>
  <input type="text" name="Department_name" placeholder="Department Name" onkeypress="return isString(event)" >
  </div>
  <div class="inputbox">
  <label for="Employee_Name">Employee Name </label>
  <input type="text" name="Employee_Name" placeholder="Employee Name" onkeypress="return isString(event)" >
  </div>
  <div class="inputbox">
  <label for="Employee_I'd">Employee I'd </label>
  <input type="text" name="Employee_Id" placeholder="EMP123" >
  </div>
  <div class="inputbox">
  <label for="password">Employee Password </label>
  <input type="password" name="password" placeholder="EMP@123" >
  </div>
  <div class="inputbox">
  <label for="mail">Employee Email I'd</label>
  <input type="email" name="mail" placeholder="abc12@gmail.com" >
  </div>
  <div class="inputbox">
  <label for="contact">Employee Contact Number</label>
  <input type="tel" name="contact" placeholder="0987654321" onkeypress="return isNumber(event)" >
  </div>
  <div class="inputbox">
  <label for="city">Employee City</label>
  <input type="text" name="city" placeholder="mumbai/pune/kolhapur" >
  </div>
  <div class="inputbox">
	  <label for="Employee_Birth_Date">Employee Birth Date</label>
	  <input type="date" name="Employee_Birth_Date" placeholder="" >
  </div>
  <div class="inputbox">
	  <label for="Employee_joining_Date">Employee joining Date</label>
	  <input type="date" name="Employee_joining_Date" placeholder="" >
  </div>
  
  <div class="inputbox">
	  <label for="Employee_Pic">Employee Pic</label>
	  <input type="file" name="Employee_Pic" placeholder="" >
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
<input  class="sub" type="submit" name="submit" value="SUBMIT">
 </div>


</div>
<br>
</form>
</body>
</html>