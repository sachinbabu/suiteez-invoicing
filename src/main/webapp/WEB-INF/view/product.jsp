<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html lang="en">
<head>
<title>Babu and Sarelta Inc</title>

<spring:url value="/resources/hello.css" var="coreCss" />
<spring:url value="/resources/bootstrap.min.css" var="bootstrapCss" />
<link href="${bootstrapCss}" rel="stylesheet" />
<link href="${coreCss}" rel="stylesheet" />
<style type="text/css">
.tg {
	border-collapse: collapse;
	border-spacing: 0;
	border-color: #ccc;
}

.tg td {
	font-family: Arial, sans-serif;
	font-size: 14px;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: #ccc;
	color: #333;
	background-color: #fff;
}

.tg th {
	font-family: Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: #ccc;
	color: #333;
	background-color: #f0f0f0;
}

.tg .tg-4eph {
	background-color: #f9f9f9
}
</style>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</head>

<body>

	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="/SpringMVCHibernate">BILLING
					Application Inc</a>
			</div>
		</div>
	</nav>

	<div class="jumbotron"></div>

	<div class="container">
		<h3>Add New Product</h3>

		<form:form action="/" method="POST" enctype="utf8" modelAttribute="productForm"> 
			 <div class="form-group row" >
                    <form:label class="col-sm-3" path="productName"><spring:message code="label.product.name"></spring:message></form:label>
                    <span class="col-sm-5"><form:input path="productName" class="form-control" name="productName"/></span>
              </div>
			<div class="form-group row">
			<form:label class="col-sm-3" path="incomeAccount"><spring:message code="label.product.incomeAccount"></spring:message></form:label> 
			<span class="col-sm-5"><form:select id="product_Name" path="incomeAccount">
						<form:option value="NONE" label="Choose" />
						<form:option value="Consulting Income">Consulting Income</form:option>
						<form:option value="Payroll-Employee Payments">Payroll - Employee Payments</form:option>
						<form:option value="sales">Sales</form:option>
					</form:select></span>
			</div>
			<div class="form-group row" >
                    <form:label class="col-sm-3" path="price"><spring:message code="label.product.price"></spring:message></form:label>
                    <span class="col-sm-5"><form:input path="price" class="form-control" name="price" value=""/></span>
              </div>
              <div class="form-group row" >
                    <form:label class="col-sm-3" path="description"><spring:message code="label.product.description"></spring:message></form:label>
                    <span class="col-sm-5"><form:input path="description" class="form-control" name="description" value=""/></span>
              </div>

			<button type="submit" class="btn btn-primary">
            <spring:message code="label.invoice.form.submit"></spring:message>
        </button>
		</form:form>
		<br>
	</div>
	<script type="text/javascript">
	
/* Submit Invoice */	

$(document).ready(function () {
	$('form').submit(function(event) {
		saveProduct(event);
	});
});


function saveProduct(event){
	event.preventDefault();
    var formData= $('form').serialize();
    $.post("<c:url value="/product/add"/>",formData ,function(data){
        if(data.message == "success"){
            window.location.href = "<c:url value="/invoice.html"></c:url>";
        }
        
    })
    .fail(function(data) {
    });
}

	</script>
</body>
</html>
