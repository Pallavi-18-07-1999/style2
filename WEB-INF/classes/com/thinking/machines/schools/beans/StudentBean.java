
package com.thinking.machines.schools.beans;
public class StudentBean implements java.io.Serializable
{
private int rollNumber;
private String name;
private String gender;
private String dateOfBirth;
private String address;
private boolean indian;
private CityBean city;
public void setRollNumber(int rollNumber)
{
this.rollNumber=rollNumber;
}
public int getRollNumber()
{
return this.rollNumber;
}
public void setName(String name)
{
this.name=name;
}
public String getName()
{
return this.name;
}
public void setGender(String gender)
{
this.gender=gender;
}
public String getGender()
{
return this.gender;
}
public void setDateOfBirth(String dateOfBirth)
{
this.dateOfBirth=(dateOfBirth);
}
public String getDateOfBirth()
{
return this.dateOfBirth;
}
public void setAddress(String address)
{
this.address=address;
}
public String getAddress()
{
return this.address;
}
public void setIndian(boolean indian)
{
this.indian=indian;
}
public boolean getIndian()
{
return this.indian;
}
public void setCity(CityBean city)
{
this.city=city;
}
public CityBean getCity()
{
return this.city;
}
}