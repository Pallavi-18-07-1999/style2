



<jsp:useBean id='studentBean' scope='request' class='com.thinking.machines.schools.beans.StudentBean'/>
<jsp:setProperty name='studentBean' property='*'/>
<jsp:forward page='/DeleteStudent'/>