<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html lang="en">
<head>
	<title>Babu and Sarelta Inc</title>

<spring:url value="/resources/hello.css" var="coreCss" />
<spring:url value="/resources/bootstrap.min.css" var="bootstrapCss" />
<link href="${bootstrapCss}" rel="stylesheet" />
<link href="${coreCss}" rel="stylesheet" />
	<style type="text/css">
		.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
		.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
		.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
		.tg .tg-4eph{background-color:#f9f9f9}
	</style>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand"href="<c:url value="/home.html" />"><spring:message code="label.pages.home.title"></spring:message></a>
		</div>
	</div>
</nav>

<div class="jumbotron">
</div>

<div class="container">

		<c:choose>
			<c:when test="${!empty listCustomers}">
				<h1>Customers</h1>
				<table class="table table-striped">
					<tr>
						<th width="80">Customer ID</th>
						<th width="120">First Name</th>
						<th width="120">Last Name</th>
						<th width="60">Edit</th>
						<th width="60">Delete</th>
					</tr>
					<c:forEach items="${listCustomers}" var="customer">
						<tr>
							<td>${customer.id}</td>
							<td>${customer.firstName}</td>
							<td>${customer.lastName}</td>
							<td><a href="<c:url value='/edit/${customer.id}' />">Edit</a></td>
							<td><a href="<c:url value='/remove/${customer.id}' />">Delete</a></td>
						</tr>
					</c:forEach>
				</table>
			</c:when>
			<c:otherwise>
				<h4>You Have no customers added</h4>
			</c:otherwise>
		</c:choose>

<h3><button  class="btn btn-primary" id = "buttonLogin" onclick = "displayLoginBox()">Add Customer</button></h3>

  <form action="/" method="POST" enctype="utf8" id="addCustomerForm">
      <div class="form-group row" > 
          <label class="col-sm-3"><spring:message code="label.user.firstName"></spring:message></label>
          <span class="col-sm-5"><input class="form-control" name="firstName" value="" required/></span>
          <span id="firstNameError" class="alert alert-danger col-sm-4" style="display:none"></span>
          
      </div>
      <div class="form-group row">
          <label class="col-sm-3"><spring:message code="label.user.lastName"></spring:message></label>
          <span class="col-sm-5"><input class="form-control" name="lastName" value="" required/></span>
          <span id="lastNameError" class="alert alert-danger col-sm-4" style="display:none"></span>
          
      </div>
      <div class="form-group row">
          <label class="col-sm-3"><spring:message code="label.user.email"></spring:message></label>
          <span class="col-sm-5"><input type="email" class="form-control" name="email" value="" required/></span>                    
          <span id="emailError" class="alert alert-danger col-sm-4" style="display:none"></span>
          
      </div>
     <br>
        <button type="submit" class="btn btn-primary">
            <spring:message code="label.customer.form.submit"></spring:message>
        </button> 

    </form>            

<br>
	<hr>
	<footer>
		<p>&copy; MattSac.com 2015</p>
	</footer>
</div>
<!-- JAVA Script -->
<script type="text/javascript">
$(document).ready(function () {
	$('form').submit(function(event) {
		addCustomer(event);
	});
});

function addCustomer(event){
	event.preventDefault();
    var formData= $('form').serialize();
    $.post("<c:url value="/customer/add"/>",formData ,function(data){
        if(data.message == "success"){
            window.location.href = "<c:url value="/customer.html"></c:url>";
        }
        
    })
    .fail(function(data) {
    });
}

/* Hide Customer Form */
$('#buttonLogin').on('click', function(e){

    $("#addCustomerForm").toggle();
    $(this).toggleClass('class1')
});

</script>	

</body>
</html>
