package com.thinking.machines.schools.tags;
import com.thinking.machines.dao.*;
import java.sql.*;
import javax.servlet.jsp.tagext.*;
import javax.servlet.jsp.*;
import com.thinking.machines.schools.beans.*;
public class TableIteratorTagHandler extends BodyTagSupport
{
private String table;
private String name;
private String orderBy;
private String city;
private int index;
private Connection connection;
private Statement statement;
private ResultSet resultSet;
public TableIteratorTagHandler()
{
reset();
}
private void reset()
{
this.city="";
this.name="";
this.table="";
this.orderBy="";
this.index=0;
this.connection=null;
this.statement=null;
this.resultSet=null;
}
public void setTable(String table)
{
System.out.println(table);
this.table=table;
}
public String getTable()
{
return this.table;
}
public void setName(String name)
{
this.name=name;
}
public String getName()
{
return this.name;
}
public void setCity(String city)
{
this.city=city;
}
public String getCity()
{
return this.city;
}
public void setOrderBy(String orderBy)
{
this.orderBy=orderBy;
}
public String getOrderBy()
{
return this.orderBy;
}
public int doStartTag()
{
if(table!=null&&table.trim().length()!=0)
{
try
{
connection=DAOConnection.getConnection();
PreparedStatement ps=null;
if(table.equals("city"))
ps=connection.prepareStatement("select * from city");
 if(table.equals("student_view")) {System.out.println("yess"); ps=connection.prepareStatement("select * from student_view");}
resultSet=ps.executeQuery();
if(resultSet.next()==false) return SKIP_BODY;
else 
{
System.out.println("chali");
setupData();
return EVAL_BODY_INCLUDE;
}
}catch(Exception e)
{
System.out.println(e);
return SKIP_BODY;
}
}
else  return SKIP_BODY;
}
public int doAfterBody()
{
try
{
if(resultSet.next())
{
index++;
setupData();
return EVAL_BODY_AGAIN;
}
if(resultSet.next()==false)
{
return SKIP_BODY;
}
}catch(Exception e)
{
return SKIP_BODY;
}
return SKIP_BODY;
}
public int doEndTag()
{
reset();
return EVAL_PAGE;
}
private void setupData()
{
if(table.equalsIgnoreCase("city"))
{
try
{
CityBean c=new CityBean();
c.setCode(resultSet.getInt("code"));
c.setName(resultSet.getString("name").trim());
pageContext.setAttribute(name,c,PageContext.SESSION_SCOPE);
pageContext.setAttribute("index",index,PageContext.SESSION_SCOPE);
}catch(Exception e)
{
System.out.println(e);
}
}
if(table.equals("student_view"))
{
try
{
System.out.println("yehh chali");
StudentBean s=new StudentBean();
s.setRollNumber(resultSet.getInt("roll_number"));
System.out.println(s.getRollNumber());
s.setName(resultSet.getString("name").trim());
s.setGender(resultSet.getString("gender"));
s.setIndian(resultSet.getBoolean("indian"));
java.sql.Date dateOfBirth= resultSet.getDate("date_of_birth");
s.setDateOfBirth(dateOfBirth.getDate()+"/"+(dateOfBirth.getMonth()+1)+"/"+(dateOfBirth.getYear()+1900));
s.setAddress(resultSet.getString("address").trim());
CityBean cb=new CityBean();
cb.setCode(resultSet.getInt("code"));
cb.setName(resultSet.getString("city_name").trim());
s.setCity(cb);
pageContext.setAttribute(name,s,PageContext.SESSION_SCOPE);
pageContext.setAttribute("index",index,PageContext.SESSION_SCOPE);
}catch(Exception e)
{
System.out.println(e);
}
}
}
}
