<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>MARSS User Management</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>

	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: tomato">
			<div>
				<a href="index.jsp" style="font-weight:bold;font-size:30px;" class="navbar-brand"> MARSS </a>
			</div>

			<ul class="navbar-nav">
				<li><a href="AdminHome.jsp"	class="nav-link" style="font-size:20px;padding-left:900px;">Admin Dashboard</a></li>
			</ul>
		</nav>
	</header>
	<br>

	<div class="row">
		<!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

		<div class="container">
			<h3 class="text-center">List of Users</h3>
			<hr>
			<%-- <div class="container text-left">

				<a href="<%=request.getContextPath()%>/new" class="btn btn-success">Add
					New User</a>
			</div> --%>
			<br>
			<table class="table table-bordered">
				<thead style="background-color:tomato;color:white;">
					<tr>
						<th>ID</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>User Name</th>
						<th>DOB</th>
						<th>Gender</th>
						<th>Phone</th>
						<th>Email</th>
						<th>Password</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<!--   for (Todo todo: todos) {  -->
					<c:forEach var="user" items="${listUser}">

						<tr>
							<td><c:out value="${user.id}" /></td>
							<td><c:out value="${user.fname}" /></td>
							<td><c:out value="${user.lname}" /></td>
							<td><c:out value="${user.uname}" /></td>
							<td><c:out value="${user.dob}" /></td>
							<td><c:out value="${user.gender}" /></td>
							<td><c:out value="${user.phoneno}" /></td>
							<td><c:out value="${user.email}" /></td>
							<td><c:out value="${user.password}" /></td>
							<td><a href="edit?u_id=<c:out value='${user.id}' />">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="delete?u_id=<c:out value='${user.id}' />">Delete</a></td>
						</tr>
					</c:forEach>
					<!-- } -->
				</tbody>

			</table>
		</div>
	</div>
</body>
</html>
