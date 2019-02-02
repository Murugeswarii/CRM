<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:page-template>
    <jsp:attribute name="header">
      <%@ include file="../template/header.jsp"%>
    </jsp:attribute>
    <jsp:attribute name="error">
      <%@ include file="../template/error-message.jsp"%>
    </jsp:attribute>
    <jsp:body>
    	<div class="container">
		<div>
			<h3>
				Customer <a href="${pageContext.request.contextPath}/customer/list" class="btn btn-danger btn-sm fright">Back</a>
			</h3>
			<form:form action="saveCustomer" modelAttribute="customer" method="POST">
				<form:hidden path="id" />
				<fieldset>
					<div class="form-group">
						<label for="exampleInputEmail1">First Name:</label>
						<form:input path="firstName" class="form-control" placeholder="Enter first name" />
						<form:errors path="firstName" cssClass="error"/>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Last Name</label>
						<form:input path="lastName" class="form-control" placeholder="Enter last name" />
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Last Name</label>
						<form:input path="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" />
						<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
						<form:errors path="email" cssClass="error"/>
					</div>
					<button type="submit" class="btn btn-primary">Save</button>
				</fieldset>
			</form:form>
		</div>
	</div>
    </jsp:body>
</t:page-template>
