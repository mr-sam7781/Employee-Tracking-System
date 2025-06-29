<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css"> <%@include file="css/report.css" %> </style>
</head>
<body>
<form name="Report_view.jsp" action="Report_view.jsp" method="post">
    <!-- First Section -->
    <div class="section">
        <div class="title">Normal Report</div>
        <div class="buttons">
            <button value="Employee List" type="submit" name="submit">Employee List</button>
            <button value="Task List" type="submit" name="submit">Task List</button>
            <button value="Leave List" type="submit" name="submit">Leave List</button>
            <button value="Submit Task List" type="submit" name="submit">Submit Task List</button>
        </div>
    </div>

    <!-- Second Section -->
    <div class="section">
        <div class="title">Id Wise Report</div>
        <input type="text" name="id">
        <div class="buttons">
            <button value="Employee Details" type="submit" name="submit">Employee Details</button>
            <button value="Task Details" type="submit" name="submit">Task Details</button>
            <button value="Leave Details" type="submit" name="submit">Leave Details</button>
            <button value="Submit Details" type="submit" name="submit">Submit Details</button>
        </div>
    </div>

    <!-- Third Section -->
    <div class="section">
       <input type="text" name="date">
        <div class="title">Date Wise Report</div>
        <div class="buttons">
            <button value="Date Task List" type="submit" name="submit">Date Task List</button>
            <button value="Date Leave List" type="submit" name="submit"> Date Leave List</button>
            <button value="Date Submit Task" type="submit" name="submit"> DateSubmit Task</button>
        </div>
    </div>
    </form>
</body>
</html>