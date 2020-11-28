



<jsp:useBean id='studentBean' scope='request' class='com.thinking.machines.schools.beans.StudentBean'/>
<jsp:setProperty name='studentBean' property='*'/>
<jsp:useBean id='cityBean' scope='request' class='com.thinking.machines.schools.beans.CityBean'/>
<jsp:setProperty name='cityBean' property='*'/>
<jsp:forward page='/EditStudent'/>