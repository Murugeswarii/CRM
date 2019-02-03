<!DOCTYPE head PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/glyphicons-less.css" />
<style>
.fright {
	float: right;
}

.table td {
	padding: 0.5rem;
}

.container {
	width: 100%;
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
}
.navbar{
padding: 0.5rem 1rem;
}
.top-adj{
margin-bottom: 1rem;
}
.error
    {
        color: #ff0000;
        font-weight: bold;
    }
    .inline {
    display: inline-block;
    }
    .wid100{
    width:100%;
    max-width: 100%;
    }
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container">
		<a class="navbar-brand" href="#">CRM</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="true"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="navbar-collapse collapse show" id="navbarColor02" style="">
			<ul class="navbar-nav mr-auto">
				<sec:authorize access="hasRole('EMPLOYEE')">
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/customer/list">Customers <span class="sr-only">(current)</span></a>
					</li>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/view/restapi/list">API <span class="sr-only">(current)</span></a>
					</li>
				</sec:authorize>
			</ul>
			<%-- <form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="text" placeholder="Search">
				<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
			</form> --%>
			<form:form action="${pageContext.request.contextPath}/logout" method="POST" class="form-inline my-2 my-lg-0">
				<input class="btn btn-secondary my-2 my-sm-0 btn-sm" type="submit" value="Logout" class="btn btn-secondary my-2 my-sm-0" />
			</form:form>
		</div>
	</div>
	</nav>
	<%-- <div class="container">
		<a href="#" class="btn btn-default btn-sm"> <span class="glyphicon glyphicon-user"></span> <sec:authentication property="principal.username" />
		</a>
	</div> --%>
</body>
</html>