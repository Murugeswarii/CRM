<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Leaders Page</title>
</head>
<body>
	<h1>Welome</h1>
<hr />
 <h3>Hello <sec:authentication property="principal.username"/>!</h3>

 Roles : <sec:authentication property="principal.authorities"/> 
 <br /><br />
 <hr />
 
 <p>Everybody has a holiday on Jan 15th!!!
 <br />
 </p>
 
 <a href="${pageContext.request.contextPath}/home">Back to home page</a>
</body>
</html>