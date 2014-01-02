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
<script>
function updateAction(personId)
{
	document.forms[0].action = "modifypersonPage.modify.action?personId="+personId;
	document.forms[0].submit();
}
function addAction()
{
	document.forms[0].action = "modifypersonPage.addPerson.action";
	document.forms[0].submit();
}
function cancelAction()
{
	document.forms[0].action = "homePage.action";
	document.forms[0].submit();
}
</script>
<body>
<div align="center">
<s:form action="modifypersonPage.update.action" >
	<s:textfield name="personData.firstName" label="First Name" value="%{personData.firstName}" required="true"/>
	<s:textfield name="personData.lastName" label="Last Name" value="%{personData.lastName}" required="true"/>
	<s:textfield name="personData.company" label="Company" value="%{personData.company}" required="true"/>
	<s:textfield name="personData.department" label="Department" value="%{personData.department}" required="true"/>
	<s:textfield name="personData.title" label="Title" value="%{personData.title}" required="true"/>
	<s:textfield name="personData.ssn" label="SSN" value="%{personData.ssn}" required="true"/>
	<s:textfield name="personData.dob" label="DOB" value="%{personData.dob}" required="true"/>
	
	<s:submit value="Modify" align="center" />
	<s:submit type="button" value="Cancel"  align="center" onclick="cancelAction();"/> 
	&nbsp;<s:a href="#" onclick="javascript: addAction();">Add New</s:a>
	
	
	
</s:form>
</div>


</body>
</html>