


package com.thinking.machines.schools.servlets;
import com.thinking.machines.schools.beans.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;
import com.thinking.machines.dao.*;
public class AddStudent extends HttpServlet
{
public void doPost(HttpServletRequest request,HttpServletResponse response)
{
try
{
System.out.println("do post chali");
CityBean cb=(CityBean)request.getAttribute("cityBean");
StudentBean sb=(StudentBean)request.getAttribute("studentBean");
int rollNumber=sb.getRollNumber();
String name=sb.getName();
String gender=sb.getGender();
String address=sb.getAddress();
boolean indian=sb.getIndian();
String dateOfBirth=sb.getDateOfBirth();
Connection con=DAOConnection.getConnection();
PreparedStatement ps=con.prepareStatement("select * from student where roll_number=?");
ps.setInt(1,rollNumber);
ResultSet rs=ps.executeQuery();
if(rs.next())
{
ErrorBean eb;
eb=new ErrorBean("student cant be added");
request.setAttribute("eb",eb);
request.setAttribute("scenario","not added");
RequestDispatcher rd;
rd=request.getRequestDispatcher("/Students.jsp");
rd.forward(request,response);
}
else
{
ps=con.prepareStatement("insert into student (name,address, date_of_birth,gender,indian,city_code,roll_number) values(?,?,?,?,?,?,?)");
ps.setString(1,name);
ps.setString(2,address);
ps.setDate(3,java.sql.Date.valueOf(dateOfBirth));
ps.setString(4,gender);
ps.setBoolean(5,indian);
ps.setInt(6,cb.getCode());
ps.setInt(7,rollNumber);
ps.executeUpdate(); 
MessageBean mb;
mb=new MessageBean("student added successfully");
request.setAttribute("mb",mb);
request.setAttribute("scenario","added");
RequestDispatcher rd;
rd=request.getRequestDispatcher("/Students.jsp");
rd.forward(request,response);
}
}catch(Exception e)
{
e.printStackTrace();
}
}
}