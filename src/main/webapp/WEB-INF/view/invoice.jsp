<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html lang="en">
<head>
<title>Babu and Sarelta Inc</title>

<spring:url value="/resources/hello.css" var="coreCss" />
<%-- <spring:url value="/resources/bootstrap.min.css" var="bootstrapCss" /> --%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script> -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<!-- <script src="https://getbootstrap.com/2.3.2/assets/js/bootstrap-modal.js"></script> -->

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
		<h3>Add an Invoice</h3>

		<form action="/" method="POST" enctype="utf8" id="addInvoiceForm">
			<table class="table table-striped">
				<thead class="table table-striped">
					<tr>
						<th width="80">Product</th>
						<th width="120">Description</th>
						<th width="120">Quantity</th>
						<th width="60">Price</th>
						<th width="60">Tax</th>
						<th width="60">Amount</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<!-- <div class="dropdown">
								<button class="btn btn-primary dropdown-toggle" type="button"data-toggle="dropdown">
									<span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="#">HTML</a></li>
									<li><a href="#">CSS</a></li>
									<li><a href="#">JavaScript</a></li>
								</ul>
							</div> -->
							<form:select id="product_Name"  path="productName">
							<form:option value="NONE" label="Select Product"/>
							<form:option value="products">Add New Product</form:option>
							<form:options items="${productList}"/> 
							</form:select>
						</td>
						
						<td>
							<div>
								<span class="col-sm-8"><input class="form-control" name="description" value="" required /></span>
							</div>
						</td>
						<td>
							<div>
								<span class="col-sm-5"><input class="form-control" name="quantity" value="" required /></span>
							</div>
						</td>
						
						<td>
							<div>
								<span class="col-sm-7"><input class="form-control" name="price" value="" required /></span>
							</div>
						</td>
						
						<td>
							<div>
								<span class="col-sm-7"><input class="form-control" name="tax" value="" required /></span>
							</div>
						</td>
						
						<td>
							<div>
								<span class="col-sm-7"><input class="form-control" name="amount" value="" required /></span>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<a href="#" title="add-new-invoice" class="add-new-invoice">+ Add a line</a> 
			
			<br>
        <button type="submit" class="btn btn-primary">
            <spring:message code="label.invoice.form.submit"></spring:message>
        </button>
		</form>
		<br>
		
		<button id="myBtn" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
	        Launch demo modal
	    </button>
	    
	    
		    <!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                <h4 class="modal-title" id="myModalLabel">Modal title</h4>
		            </div>
		            <div class="modal-body">
		                ...
		            </div>
		            <div class="modal-footer">
		                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		                <button type="button" class="btn btn-primary">Save changes</button>
		            </div>
		        </div>
		    </div>
		</div>

	</div>
	
	<script type="text/javascript">
	
/* Add New Line */
		var counter = 1;
		jQuery('add-new-invoice')
				.click(
						function(event) {
							event.preventDefault();
							counter++;
							var newRow = jQuery('<tr><td><div class="dropdown"><button class="btn btn-primary dropdown-toggle" type="button"data-toggle="dropdown"><span class="caret"></span></button><ul class="dropdown-menu"><li><a href="#">HTML</a></li><li><a href="#">CSS</a></li><li><a href="#">JavaScript</a></li></ul></div>'
									+ counter +'</td><td><div><span class="col-sm-8"><input class="form-control" name="lastName" value="" required /></span></div>'
									+ counter +'</td></tr>');
							jQuery('table.table table-striped').append(newRow);
						});
		
/* Submit Invoice */	

$(document).ready(function () {
	$('form').submit(function(event) {
		saveInvoice(event);
	});
});


function saveInvoice(event){
	event.preventDefault();
    var formData= $('form').serialize();
    $.post("<c:url value="/invoice/add"/>",formData ,function(data){
        if(data.message == "success"){
            window.location.href = "<c:url value="/invoice.html"></c:url>";
        }
        
    })
    .fail(function(data) {
    });
}

/* Add New Product */
/* document.getElementById("product_Name").onchange = function(){
	if(this.selectedIndex == 1){
		var updatedUrl = this.value;
		var url = window.location.href;
		var newText = url.replace(/(invoices).*?()/, updatedUrl);
		window.location.href = newText; 
	}
}; */

document.getElementById("product_Name").onchange = function(){
	if(this.selectedIndex == 1){
		$('#my-modal').modal('show')
		
		var data = $(this).serializeObject();
	    json_data = JSON.stringify(data);
	    $("#results").text(json_data); 
	    $(".modal-body").text(json_data); 

	    // $("#results").text(data);

	    ev.preventDefault();
	
	}
};

//when DOM is ready
$(document).ready(function () {

     // Attach Button click event listener 
    $("#myBtn").click(function(){

         // show Modal
         /* $('#myModal').modal('show'); */
    	$('#myModal').appendTo("body");
    });
});


	</script>
	</body>	
</html>
