<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link  rel="stylesheet" href="css/viewinprocesstask.css" type="text/css"/>
<style type="text/css"> <%@include file="css/viewinprocesstask.css" %> </style>
</head>
<body>
  <div class="container">
    <h1>In Process Task</h1>
    <table>
      <thead>
        <tr>
          <th>Serial Number</th>
          <th>Employee Name</th>
          <th>Task Title</th>
          <th>Assign Date</th>
          <th>Last Date</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>1</td>
          <td>Omkar Jadhav</td>
          <td>Security Management</td>
          <td>2024-12-01</td>
          <td>2024-12-15</td>
          <td>
           <a href="tasksubmitformemp.jsp"> <button class="view-btn">View</button></a>
          </td>
        </tr>
        <tr>
          <td>2</td>
          <td>Arish Ganibhai</td>
          <td>Monthly Sales</td>
          <td>2024-12-05</td>
          <td>2024-12-20</td>
          <td>
           <a href="tasksubmitformemp.jsp"> <button class="view-btn">View</button></a>
          </td>
        </tr>
         <tr>
          <td>3</td>
          <td>Rohit Khandekar</td>
          <td>Complete Report</td>
          <td>2024-12-01</td>
          <td>2024-12-15</td>
          <td>
          <a href="viewprocessing.jsp">  <button class="view-btn">View</button></a>
          </td>
        </tr>
        <tr>
          <td>2</td>
          <td>Satej Dhumal</td>
          <td>Design Logo</td>
          <td>2024-12-05</td>
          <td>2024-12-20</td>
          <td>
           <a href="viewprocessing.jsp"> <button class="view-btn">View</button></a>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</body>



</html>