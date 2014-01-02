<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Eric Martin App</title>
<script>
function updateAction(personId)
{
	document.forms[0].action = "deletepersonPage.delete.action?personId="+personId;
	document.forms[0].submit();
}	
</script>
</head>
<body>
<h1><a href="homePage.action">Welcome To Eric Martin App</a></h1>


<s:form action="deletepersonPage.action">
	<table border="1">
	<tr>
		<th></th>
		<th>First Name</th>
		<th>Last Name</th>
		<th>Age</th>
	</tr>
	<s:iterator var="obj" value="personList">
		<tr>
			<td><a href="#" onclick="javascript: updateAction(<s:property value="personId"/>);">delete</a></td>
			<td><s:property value="firstName" escape="false" /></td>	
			<td><s:property value="lastName" escape="false" /></td>	
			<td><s:property value="age" escape="false" /></td>
		</tr>				
	</s:iterator>
</table>
</s:form>


</body>
</html>