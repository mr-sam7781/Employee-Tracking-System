create database employee_tracking_system; 
use employee_tracking_system;

create table addemp
(
	addemp_id int auto_increment primary key,
    employee_id nvarchar(50),
    department_name nvarchar(50),
    employee_name nvarchar(50),
    employee_password nvarchar(50),
    employee_email nvarchar(50),
    employee_contact bigint(10),
    employee_city nvarchar(50),
    employee_dob nvarchar(50),
    employee_doj nvarchar(50),
    employee_pic nvarchar(500),
    employee_gender nvarchar(50)
);

     create table  tasksubmitformemp
 (
   department_id int auto_increment primary key,
   emp_name nvarchar (50),
   department_name nvarchar (50),
   employee_id nvarchar (50),
   task_completed_file nvarchar (1000),
   submit_date nvarchar (50)
 );
 
 create table task
 (
	 task_id int auto_increment primary key,
	 department_name nvarchar (50),
	 employee_id nvarchar(50),
	 employee_name nvarchar(50),
	 task_priority nvarchar(50),
	 task_title nvarchar(50),
	 task_description nvarchar(50),
	 task_document nvarchar(50),
	 task_submit_last_date nvarchar(50),
	 percentage nvarchar(50),
     taskstatus nvarchar (50),
     assigned_date nvarchar(50)
 
 );
 
 create table in_process_task 
 (
 employee_in_Process_Task_id int auto_increment primary key,
 percentage nvarchar(50),
taskstatus nvarchar (50)
 
 );
 
 create table tasksubmitformemp
 (
 tasksubmitformemp int auto_increment primary key,
 task_title nvarchar(50),
 emp_name nvarchar(50),
 department_name nvarchar(50),
 employee_id nvarchar(50),
 task_completed_file nvarchar(20000),
 submit_date nvarchar(50)

 );
 
 create table leave_report
 (
  leave_id int auto_increment primary key,
  employee_id nvarchar(50),
  employee_name nvarchar(50),
  employee_department nvarchar(50),
  leave_from nvarchar(50),
  leave_to nvarchar(50),
  reason_for_leave nvarchar(1000),
  leave_status nvarchar(50)
 );
 
 create table contact
 (
 contact int auto_increment primary key,
 user_name nvarchar(50),
 user_mail nvarchar(50),
 user_massge nvarchar(50)
 );
 
  create table newdepart
  (
  employee_Newdepart int auto_increment primary key,
  add_department nvarchar(50)
  );