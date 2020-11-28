<jsp:include page='/MasterPageTopSection.jsp' />

<jsp:useBean id='mb' scope='request' class='com.thinking.machines.schools.beans.MessageBean'/>
<jsp:getProperty name='mb' property='message'/>
<jsp:useBean id='eb' scope='request' class='com.thinking.machines.schools.beans.ErrorBean'/>
<jsp:getProperty name='eb' property='error'/>
<jsp:include page='/StudentsJS.jsp' />
<h3>Students</h3>
<div id='functionalityDiv' class='functionalityDiv' id='functionalityDiv'> 
students
<input type='text' style='overflow:scroll'>
<img src='/styletwo/images/search_icon.png'>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img src='/styletwo/images/add_icon.png' style='cursor:pointer' onclick=createAddIconHandler()>
</div>
<table border='1' id='studentViewGrid'>
<thead>
<tr>
<th>S.No.</th>
<th>Roll number</th>
<th>Name</th>
<th>Gender</th>
<th>D.O.B.</th>
<th>City</th>
<th>Edit</th>
<th>Delete</th>
<th>Details</th>
</tr>
</thead>
<tbody>
</tbody>
</table>
<form id='deleteForm' method='post' action='/styletwo/DeleteStudent.jsp'  class='removeDisplay'>
<input type='hidden' id='deleteFormRollNumber' name='rollNumber'>
<button type='submit' >Delete</button>
<button type='submit' id='goToViewButton'>GotToView</button>
</form>

<form action='/styletwo/EditStudent.jsp' method='post' id='editForm' class='removeDisplay' accept-charset='utf-8'>
enter your rollnumber
<input type='text' id='editFormRollNumber' name='rollNumber' readonly>
<br>
enter your name
<input type='text' id='editFormName' name='name'>
<br>
select gender
<input type='radio' id='editFormMaleGender' name='gender' value='M'> male
&nbsp;&nbsp;&nbsp;
<input type='radio' id='editFormFemaleGender' name='gender' value='F'> female
&nbsp;&nbsp;&nbsp;
<br>
enter your dob
<input type='text' id='editFormDOB' name='dateOfBirth'>
<br>
isIndian
<input type='checkbox' id='editFormIndian' name='indian' value='Y'>
<br>
enter address
&nbsp;&nbsp;&nbsp;
<br>
<textarea id='editFormAddress' name='address' rows='10' cols='50'></textarea>
<br>
select city
<select id='editFormCityCode' name='code'>
</select>
<button type='submit'> Edit </button>
<button type='submit'> GoToView</button>
</form>

<form action='/styletwo/AddStudent.jsp' method='post' id='addForm' class='removeDisplay' accept-charset='utf-8'>
enter your rollnumber
<input type='text' id='addFormRollNumber' name='rollNumber'>
<br>
enter your name
<input type='text' id='addFormName' name='name'>
<br>
select gender
<input type='radio' id='addFormMaleGender' name='gender' value='M'> male
&nbsp;&nbsp;&nbsp;
<input type='radio' id='addFormFemaleGender' name='gender' value='F'> female
&nbsp;&nbsp;&nbsp;
<br>
enter your dob
<input type='text' id='addFormDOB' name='dateOfBirth'>
<br>
isIndian
<input type='checkbox' id='addFormIndian' name='indian' value='Y'>
<br>
enter address
&nbsp;&nbsp;&nbsp;
<br>
<textarea id='addFormAddress' name='address' rows='10' cols='50'></textarea>
<br>
select city
<select id='addFormCityCode' name='code'>
</select>
<button type='submit'> Add </button>
<button type='submit'> GoToView</button>
</form>
<button type='submit' class='removeDisplay' id='viewButton' onclick='viewTable()'>view</button>
<span class='removeDisplay' id='showDetailsRollNumber'></span>
<span class='removeDisplay' id='showDetailsName'></span>
<span class='removeDisplay' id='showDetailsGender'></span>
<span class='removeDisplay' id='showDetailsAddress'></span>
<span class='removeDisplay' id='showDetailsDOB'></span>
<span class='removeDisplay' id='showDetailsIndian'></span>
<span class='removeDisplay' id='showDetailsCity'></span>
<jsp:include page='/MasterPageBottomSection.jsp' />