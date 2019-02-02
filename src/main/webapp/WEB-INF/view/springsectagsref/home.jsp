<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Welome</h1>
<hr />
 <h3>Hello <sec:authentication property="principal.username"/>!</h3>

 Roles : <sec:authentication property="principal.authorities"/> 
 <br /><br />
 <hr />
 <sec:authorize access="hasRole('EMPLOYEE')">
	 <a href="${pageContext.request.contextPath}/employee">Employee Meeting</a>
	 <br/> <br/>
 </sec:authorize>
 <sec:authorize access="hasRole('ROLE_MANAGER')">
	 <a href="${pageContext.request.contextPath}/leaders">LeaderShip Meeting</a>
	 (Only for managers)
	  <br/> <br/>
 </sec:authorize>
 <sec:authorize access="hasRole('ROLE_ADMIN')">
	 <a href="${pageContext.request.contextPath}/admin">Admin</a>
	 (Only for Admin)
	  <br/> <br/>
 </sec:authorize>
 <form:form action="${pageContext.request.contextPath}/logout" method="POST">
 		<input type="submit" value="Logout">
 </form:form>
 
</body>
</html>