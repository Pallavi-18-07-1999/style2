


package com.thinking.machines.schools.servlets;
import com.thinking.machines.schools.beans.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;
import com.thinking.machines.dao.*;
public class DeleteStudent extends HttpServlet
{
public void doPost(HttpServletRequest request,HttpServletResponse response)
{
try
{
System.out.println("do post chali");
StudentBean sb=(StudentBean)request.getAttribute("studentBean");
int rollNumber=sb.getRollNumber();
Connection con=DAOConnection.getConnection();
PreparedStatement ps=con.prepareStatement("delete from student where roll_number=?");
ps.setInt(1,rollNumber);
ps.executeUpdate();
System.out.println(rollNumber);
MessageBean mb;
mb=new MessageBean("student deleted successfully");
request.setAttribute("mb",mb);
RequestDispatcher rd;
rd=request.getRequestDispatcher("/Students.jsp");
rd.forward(request,response);
}catch(Exception e)
{
}
}
}