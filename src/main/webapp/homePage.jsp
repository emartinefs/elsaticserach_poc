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
function modifyAction(personId)
{
	document.forms[0].action = "homePage.modifyPage.action?personId="+personId;
	document.forms[0].submit();
}	



</script>
</head>
<body>
 <s:form action="homePage.search.action" theme="simple">
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
<div id="intro" class="hero-unit">
    <%-- Hero unit header --%>
    <div id="intro-1" class="row">
        <div class="span10 offset1 center">
            <a href="homePage.action"><img src="img/logo-text.png" alt="Logo"/></a>
        </div>
    </div>
    <div id="intro-2"  class="row">
        <div class="span2 invisible">
            <a href="homePage.action"><img id="logo-small" src="img/logo.png" alt="Logo"/></a>
        </div>
        <div class="span6">
           		
                <div class="input-append">
                    <s:textfield name="personData.firstName"  cssClass="search-query span7" required="true"/>
                    
                            
                    <s:submit value="Search" cssClass="btn btn-primary"><i class="icon-white icon-search"></i></s:submit>
                    
                    <div id="loading"><img src="img/loading.gif"/></div>
                </div>
                <div align="right">
                	<s:a href="homePage.searchPage.action"  >Advanced Search</s:a>
                </div>
           
        </div>
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
   </div>

</s:form>
</body>

</html>