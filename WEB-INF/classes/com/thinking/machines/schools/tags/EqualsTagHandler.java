package com.thinking.machines.schools.tags;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;
public class EqualsTagHandler extends TagSupport
{
private String name;
private String value;
public void setName(String name)
{
this.name=name;
}
public void setValue(String value)
{
this.value=value;
}
public String getName()
{
return name;
}
public String getValue()
{
return value;
}
private void reset()
{
name="";
value="";
}
public EqualsTagHandler()
{
reset();
}
public int doStartTag()
{
String bagData=null;
bagData=(String)pageContext.getAttribute(name,PageContext.REQUEST_SCOPE);
if(bagData==null)
bagData=(String)pageContext.getAttribute(name,PageContext.SESSION_SCOPE);
if(bagData==null)
bagData=(String)pageContext.getAttribute(name,PageContext.APPLICATION_SCOPE);
System.out.println("bagData......");
System.out.println(bagData);
if(bagData==null) return SKIP_BODY;
System.out.println("bagData......");
System.out.println(bagData);
if(bagData.equals(value))
return EVAL_BODY_INCLUDE;
return SKIP_BODY;
}
public int doEndTag()
{
reset();
return EVAL_PAGE;
}
}