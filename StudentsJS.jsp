<%@taglib uri='/WEB-INF/tlds/mytags.tld' prefix='tm' %>
<jsp:include page="/css/styles.css"/>
<script>
function displayForm()
{
document.getElementById('addFormAddress').value='${studentBean.address}';
document.getElementById('addFormCityCode').value='${cityBean.code}';
document.getElementById('studentViewGrid').classList.remove('display');
document.getElementById('studentViewGrid').classList.add('removeDisplay');
document.getElementById('addForm').classList.add('display');
}
function viewTable()
{
alert('method chali');
}
function createAddIconHandler()
{
document.getElementById('studentViewGrid').classList.add('removeDisplay');
document.getElementById('addForm').classList.add('display');
document.getElementById('addForm').classList.remove('removeDisplay');
}
function createRowClickedHandler(index,row)
{
return function()
{
selectRow(index,row);
}
}
function createDeleteIconHandler(index,row)
{
return function()
{
displayDeleteSection(index,row);
}
}
function displayDeleteSection(index,row)
{
document.getElementById('studentViewGrid').classList.add('removeDisplay');
document.getElementById('deleteForm').classList.add('display');
document.getElementById('deleteForm').classList.remove('removeDisplay');
document.getElementById('deleteFormRollNumber').setAttribute('value',viewModel.students[index].rollNumber);
}
function createEditIconHandler(index,row)
{
return function()
{
displayEditSection(index,row);
}
}
function displayEditSection(index,row)
{
document.getElementById('studentViewGrid').classList.add('removeDisplay');
document.getElementById('editForm').classList.add('display');
document.getElementById('editForm').classList.remove('removeDisplay');
document.getElementById('editFormRollNumber').setAttribute('value',viewModel.students[index].rollNumber);
}
function createDetailsIconClickedHandler(index,row)
{
return function()
{
displayDetailsSection(index,row);
}
}
function displayDetailsSection(index,row)
{
document.getElementById('studentViewGrid').classList.add('removeDisplay');
document.getElementById('viewButton').classList.add('display');
document.getElementById('showDetailsRollNumber').classList.remove('removeDisplay');
document.getElementById('showDetailsRollNumber').classList.add('display');
document.getElementById('showDetailsRollNumber').innerHTML=viewModel.students[index].rollNumber;
}
function selectRow(index,row)
{
if(viewModel.selectedStudentIndex==index) return;
if(viewModel.selectedRow!=null) 
{
viewModel.selectedRow.classList.remove('selectRow');
viewModel.selectedRow.classList.add('row');
}
viewModel.selectedRowIndex=index;
viewModel.selectedRow=row;
row.classList.remove('row');
row.classList.add('selectRow');
}
function City()
{
this.code=0;
this.name='';
}
function Student()
{
this.rollNumber=0;
this.name='';
this.gender='';
this.dateOfBirth='';
this.address='';
this.indian=false;
this.city=null;
}
function selectStudent(rollNumber)
{
alert('selectStudent chali');
var i=0;
while(i<viewModel.students.length)
{
if(viewModel.students[i].rollNumber==rollNumber)  break;
i++;
}
var str='ixix'+i;
var tr=document.getElementById(str);
selectRow(i,tr);
}
function ViewModel()
{
this.students=[];
this.cities=[];
this.selectedRow=null;
this.selectedStudentIndex=-1;
}
var viewModel=new ViewModel();
function initView()
{
var c;

var cc=document.getElementById('editFormCityCode');
var addcc=document.getElementById('addFormCityCode');
<tm:TableIterator table='city' name='city' orderBy='name'>
c=new City();
c.code=${city.code};
c.name='${city.name}';
viewModel.cities[${index}]=c;
var option=document.createElement('option');
option.value=c.code;
option.text=c.name;
cc.appendChild(option);
var option=document.createElement('option');
option.value=c.code;
option.text=c.name;
addcc.appendChild(option);

</tm:TableIterator>
<tm:TableIterator table='student_view' name='student' orderBy='name'>
s=new Student();
s.rollNumber=${student.rollNumber};
s.name='${student.name}';
s.gender='${student.gender}';
s.dateOfBirth=${student.dateOfBirth};
s.address='${student.address}';
s.indian=${student.indian};
s.city=new City();
s.city.name='${student.city.name}';
s.city.code=${student.city.code};
viewModel.students[${index}]=s;
</tm:TableIterator>
var grid=document.getElementById('studentViewGrid');
var i=0;
var tr,td,img,textnode,anchor;
while(i<viewModel.students.length)
{
tr=document.createElement("tr");
tr.id='ixix'+i;
td=document.createElement("td");
textnode=document.createTextNode((i+1)+".");
td.appendChild(textnode);
tr.appendChild(td);
td=document.createElement("td");
textNode=document.createTextNode(viewModel.students[i].rollNumber);
td.appendChild(textNode);
tr.appendChild(td);
td=document.createElement("td");
textNode=document.createTextNode(viewModel.students[i].name);
td.appendChild(textNode);
tr.appendChild(td);
td=document.createElement("td");
img=document.createElement("img");
if(viewModel.students[i].gender=='M')
{
img.src='/styletwo/images/male_icon.png';
}
else
{
img.src='/styletwo/images/female_icon.png';
}
td.appendChild(img);
tr.appendChild(td);
td=document.createElement("td");
textNode=document.createTextNode(viewModel.students[i].dateOfBirth);
td.appendChild(textNode);
tr.appendChild(td);
td=document.createElement("td");
textNode=document.createTextNode(viewModel.students[i].city.name);
td.appendChild(textNode);
tr.appendChild(td);
td=document.createElement("td");
img=document.createElement("img");
img.src='/styletwo/images/edit_icon.png';
img.onclick=createEditIconHandler(i,tr);
td.appendChild(img);
tr.appendChild(td);
td=document.createElement("td");
img=document.createElement("img");
img.src='/styletwo/images/delete_icon.png';
img.onclick=createDeleteIconHandler(i,tr);
td.appendChild(img);
tr.appendChild(td);
td=document.createElement("td");
img=document.createElement("img");
img.src='/styletwo/images/details_icon.png';
img.onclick=createDetailsIconClickedHandler(i,tr);
td.appendChild(img);
tr.appendChild(td);
tr.style.cursor='pointer';
tr.onclick=createRowClickedHandler(i,tr);
grid.appendChild(tr);
i++;
}



<tm:EqualsTagHandler name='scenario' value='edited'>
selectStudent(${studentBean.rollNumber});
</tm:EqualsTagHandler>
<tm:EqualsTagHandler name='scenario' value='added'>
selectStudent(${studentBean.rollNumber});
</tm:EqualsTagHandler>
<tm:EqualsTagHandler name='scenario' value='not added'>
displayForm();
</tm:EqualsTagHandler>
}
window.addEventListener('load',initView);
</script>
