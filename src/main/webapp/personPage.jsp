<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="img/logo.png" />
<link rel="shortcut icon" href="img/favicon.ico" />
<link rel="stylesheet" href="css/main.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Eric Martin App</title>
<script>
function cancelAction()
{
	document.forms[0].action = "homePage.action";
	document.forms[0].submit();
}
function addAction()
{
	var alertMsg = '';
	
	if(document.getElementById('personPage_personData_firstName').value.length == 0)
		alertMsg = alertMsg + "\nPlease Enter Valid First Name";
	
	if(document.getElementById('personPage_personData_lastName').value.length == 0)
		alertMsg = alertMsg + "\nPlease Enter Valid Last Name";
	if(document.getElementById('personPage_personData_company').value.length == 0)
		alertMsg = alertMsg + "\nPlease Enter Valid Company";
	if(document.getElementById('personPage_personData_department').value.length == 0)
		alertMsg = alertMsg + "\nPlease Enter Valid Department";
	if(document.getElementById('personPage_personData_title').value.length == 0)
		alertMsg = alertMsg + "\nPlease Enter Valid Title";
	if(document.getElementById('personPage_personData_ssn').value.length == 0)
		alertMsg = alertMsg + "\nPlease Enter Valid SSN";
	if(document.getElementById('personPage_personData_dob').value.length == 0)
		alertMsg = alertMsg + "\nPlease Enter Valid DOB";
	
	if(alertMsg == '')
	{
		document.forms[0].action = "personPage.add.action";
		document.forms[0].submit();
	}
	else
		alert(alertMsg);
	
}
function modifyAction(personId)
{
	document.forms[0].action = "homePage.modifyPage.action?personId="+personId;
	document.forms[0].submit();
}	

</script>
</head>
<body>
<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="brand" href="homePage.action">Eric Martin Search</a>
            
        </div>
    </div>
</div>
<body>
<div align="center">
<s:form action="personPage.action">
	<s:textfield name="personData.firstName" label="First Name" required="true"/>
	<s:textfield name="personData.lastName" label="Last Name" required="true"/>
	<s:textfield name="personData.company" label="Company" required="true"/>
	<s:textfield name="personData.department" label="Department" required="true"/>
	<s:textfield name="personData.title" label="Title" required="true"/>
	<s:textfield name="personData.ssn" label="SSN" required="true"/>
	<s:textfield name="personData.dob" label="Date Of Birth" required="true"/>
	<s:submit type="button" value="Add" align="center" onclick="addAction();"> </s:submit>
	<s:submit type="button" value="Cancel"  align="center" onclick="cancelAction();"/> 
</s:form>
</div>
<div class="row">
    
    	 <table align="center" border="1" cellspacing="10" cellpadding="10">
	    	<tr style="background-color: blue; color: white;">
	    		<th>Company</th>
	    		<th>Department</th>
	    		<th>First Name</th>
	    		<th>Last Name</th> 
	    		<th>Title</th>
	    		<th>SSN</th>
	    		<th>DOB</th>
	    	</tr>
	    	
	    	 <s:iterator var="obj" value="personList">
	    	 	<tr>
	    	 		<td><s:property value="company" escape="false" /></td>
	    	 		<td><s:property value="department" escape="false" /></td>
	    	 		<td><a href="#" onclick="modifyAction(<s:property value="personId"/>);"><s:property value="firstName" escape="false" /></a></td>
	    	 		<td><a href="#" onclick="modifyAction(<s:property value="personId"/>);"><s:property value="lastName" escape="false" /></a></td>
	    	 		<td><s:property value="title" escape="false" /></td>
	    	 		<td><s:property value="ssn" escape="false" /></td>
	    	 		<td><s:property value="dob" escape="false" /></td>
	    	 	</tr>
	    	 </s:iterator>
	    	 
	     </table>
        
</div>
</body>
</html>