<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:page-template>
    <jsp:attribute name="header">
      <%@ include file="template/header.jsp"%>
    </jsp:attribute>
    <jsp:attribute name="error">
      <%@ include file="template/error-message.jsp"%>
    </jsp:attribute>
    <jsp:body>
        <div class="container">
		<div class="jumbotron">
			<h1 class="display-3">Welcome!</h1>
			<p class="lead">This is a simple crm project with just adding, editing and listing of customers developed to learn major spring technologies .</p>
			<hr class="my-4">
			<p>It uses technologies of spring like spring core, mvc, aop, hibernate and security with the bootstrap</p>
			<p class="lead">
				<a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a>
			</p>
		</div>
	</div>
    </jsp:body>
</t:page-template>
