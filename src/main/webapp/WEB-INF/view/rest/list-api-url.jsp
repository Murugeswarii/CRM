<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
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
				 REST API<a href="${pageContext.request.contextPath}/home" class="btn btn-danger btn-sm fright">Back</a>
			</h3>
			<div class="card text-white bg-success mb-0 inline wid100">
			  <div class="card-header">GET http://localhost:8081/crm/api/customers</div>
			  <div class="card-body">
			    <h4 class="card-title">List</h4>
			    <p class="card-text">This get method retrieves all customers from the database.
			    </p>
			    <p>Sample Request</p>
			    <p>GET http://localhost:8081/crm/api/customers</p>
			    <p>Sample Response</p>
			    <p>
						[{"id":10,"firstName":"Justin","lastName":"Tim","email":"justin@gmail.com"},{"id":44,"firstName":"Maria","lastName":"Gomez","email":"maria.gomez@gmail.com"},{"id":5,"firstName":"Maxwell","lastName":"Dixon","email":"max@luv2code.com"},{"id":6,"firstName":"Murugeswari","lastName":"Selvaraj","email":"murugeswari.s@gamil.com"}]
			    </p>
			  </div>
			</div>
			<div class="card text-white bg-info mb-0 inline wid100">
			  <div class="card-header">GET http://localhost:8081/crm/api/customers/{customerId}</div>
			  <div class="card-body">
			    <h4 class="card-title">VIEW</h4>
			    <p class="card-text">This retrieves information of the customer id passed.</p>
			     <p>Sample Request</p>
			    <p>GET http://localhost:8081/crm/api/customers/10</p>
			     <p>Sample Response</p>
			    <p>
						{"id":10,"firstName":"Justin","lastName":"Tim","email":"justin@gmail.com"}
			    </p>
			  </div>
			</div>
			<div class="card text-white bg-success mb-0 inline wid100">
			  <div class="card-header">POST http://localhost:8081/crm/api/customers</div>
			  <div class="card-body">
			    <h4 class="card-title">CREATE</h4>
			    <p class="card-text">Creates a new customer with the customer information passed in the request with JSON format</p>
			    <p>Sample Request</p>
			    <p>POST http://localhost:8081/crm/api/customers</p>
			    <p>Body</p>
			    <p>{
				    "firstName": "Customer",
				    "lastName": "Four",
				    "email": "customer@gmail.com"
				}</p>
			    
			    <p>Sample Response</p>
			    <p>
						{
						    "id": 45,
						    "firstName": "Customer",
						    "lastName": "Four",
						    "email": "customer@gmail.com"
						}
			    </p>
			  </div>
			</div>
			<div class="card text-white bg-warning mb-0 inline wid100">
			  <div class="card-header">PUT http://localhost:8081/crm/api/customers</div>
			  <div class="card-body">
			    <h4 class="card-title">UPDATE</h4>
			    <p class="card-text">Updates the information of the customer with information passed in the request in JSON format</p>
			    <p>Sample Request</p>
			    <p>PUT http://localhost:8081/crm/api/customers</p>
			    <p>Body</p>
			    <p>{
						    "id": 45,
						    "firstName": "Customer",
						    "lastName": "Four",
						    "email": "customer.four@gmail.com"
						}
				</p>
				 <p>Sample Response</p>
			    <p>Customer id 45 is updated</p>
			  </div>
			</div>
			<div class="card text-white bg-danger  mb-0 inline wid100">
			  <div class="card-header">DELETE http://localhost:8081/crm/api/customers/{customerId}</div>
			  <div class="card-body">
			    <h4 class="card-title">DELETE</h4>
			    <p class="card-text">Deletes the record of customer id passed.</p>
			    <p>Sample Request</p>
			    <p>DELETE http://localhost:8081/crm/api/customers/45</p>
			     <p>Sample Response</p>
			    <p>
						Customer id 45 is deleted
			    </p>
			  </div>
			</div>
		</div>
	</div>
    </jsp:body>
</t:page-template>
