<%@page import="java.util.List"%>
<%@page import="com.cems.dao.InventDAO"%>
<%@page import="com.cems.dao.connection"%>
<%@page import="com.cems.model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
InventDAO productData = new InventDAO(connection.getConnection());
List<Product> product = productData.getAllProducts();
request.setAttribute("PRODUCTS_LIST", product);
%>


<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<title>CRUD Application</title>

<style>
.inner {
	margin: 15px 0;
}
.cwidth{
	padding: 0 0 0 0;
}
</style>
</head>
<body>
	
	<div class="container-fluid cwidth" width="100%">
		<nav class="navbar navbar-dark" style="background-color:tomato">
			<a href="index.jsp" style="font-weight:bold;font-size:30px;" class="navbar-brand">MARSS</a>
			
			<h4 class="navbar-brand" style="font-size=:30px;padding-right:60%;padding-bottom:0px;">Product view</h4>
			<ul class="navbar-nav">
				<li><a href="AdminHome.jsp"	class="nav-link" style="font-size:20px;">Admin Dashboard</a></li>
			</ul>
		</nav>
	</div>
	<div class="container">
		<div class="inner">
			<div class="row">
				<div class="col-md-3">
					<h3>ADD PRODUCT </h3>
					<form action="AddProduct" method="post">
						<div class="form-group">
							<label>Product Name</label> <input class="form-control"
								name="pname" place-holder="Product Name" required>
						</div>
						<div class="form-group">
							<label>Quantity</label> <input class="form-control"
								name="quantity" place-holder="Quantity " required>
						</div>
						<div class="form-group">
							<label>Price Per Hour</label> <input class="form-control"
								name="priceperhr" place-holder="Price per hr " required>
						</div>
						
							<button type="submit" class="btn btn-primary">Submit</button>
							<button type="reset" class="btn btn-primary">Reset</button>
					</form>
				</div>
				<div class="col-md-9">
					<h3>Product Information From Database</h3>
					<table class="table">
						<thead class="bg-light">
							<tr>
								<th scope="col">Product Id</th>
								<th scope="col">Product Name</th>
								<th scope="col">Quantity</th>
								<th scope="col">Price Per Hour</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="tempPro" items="${PRODUCTS_LIST}">
								<tr>
									<td>${tempPro.product_id }</td>
									<td>${tempPro.pname }</td>
									<td>${tempPro.quantity }</td>
									<td>${tempPro.priceperhr }</td>
									<td><a
					                     href="EditProduct.jsp?product_id=${tempPro.product_id }">Edit / </a>
										<a href="DeleteInvent.jsp?product_id=${tempPro.product_id }">Delete</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

