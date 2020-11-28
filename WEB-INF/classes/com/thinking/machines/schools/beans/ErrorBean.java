

package com.thinking.machines.schools.beans;
public class ErrorBean implements java.io.Serializable 
{
private String error;
public ErrorBean()
{
error="";
}
public ErrorBean(String error)
{
this.error=error;
}
public String getError()
{
return error;
}
}
