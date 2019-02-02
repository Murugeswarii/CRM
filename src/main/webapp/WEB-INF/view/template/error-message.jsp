<c:choose>
	<c:when test="${SUCCESS_MESSAGE != null}">
		<div class="alert alert-dismissible alert-success">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<strong>Well done!</strong> ${SUCCESS_MESSAGE}.
		</div>
	</c:when>
	<c:when test="${ERROR_MESSAGE != null}">
		<div class="alert alert-dismissible alert-danger">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<strong>Oh snap!</strong> You have following errors,
			<ul>
			<c:forEach var="errorMsg" items="${ERROR_MESSAGE}" varStatus="rowStatus">
				<li> ${errorMsg} </li>
			</c:forEach>
			</ul>
		</div>
	</c:when>
	<c:otherwise>
		<div class="top-adj"></div>
	</c:otherwise>
</c:choose>