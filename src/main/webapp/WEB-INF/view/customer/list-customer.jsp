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
				Customers List (${customers.size()}) <a href="${pageContext.request.contextPath}/home" class="btn btn-danger btn-sm fright">Back</a> <input type="button"
					value="Add Customer" onclick="window.location.href='showFormForAdd'; return false;" class="btn btn-primary btn-sm fright" />
			</h3>
			<table class="table table-hover">
				<thead>
					<tr class="table-primary">
						<th scope="col">First Name</th>
						<th scope="col">LastName</th>
						<th scope="col">Email</th>
						<th scope="col">Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="tempCustomer" items="${customers}" varStatus="rowStatus">
						<c:url var="updateLink" value="/customer/showFormForUpdate">
							<c:param name="customerId" value="${tempCustomer.id }" />
						</c:url>
						<c:url var="deleteLink" value="/customer/deleteCustomer">
							<c:param name="customerId" value="${tempCustomer.id }" />
						</c:url>
						<tr class="${rowStatus.index%2 != 0 ? 'table-active' : ''}">
							<td>${tempCustomer.firstName}</td>
							<td>${tempCustomer.lastName}</td>
							<td>${tempCustomer.email}</td>
							<td><a href="${updateLink}">Update</a> | <a href="${deleteLink}"
								onclick="if(!(confirm('Are you sure you want to delete thid customer?'))) return false;">Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
    </jsp:body>
 </t:page-template>
