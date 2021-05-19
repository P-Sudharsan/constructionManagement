<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>User Management Application</title>
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
				<a href="index.jsp" style="font-weight:30px;" class="navbar-brand"> MARSS </a>
			</div>

			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/list"
					class="form-inline" style="padding-left:1050px;font-weight:20px;">User List</a></li>
			</ul>
		</nav>
	</header>
	<br>
	
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				<c:if test="${user != null}">
					<form action="update" method="post">
				</c:if>
				<%-- <c:if test="${user == null}">
					<form action="insert" method="post">
				</c:if> --%>

				<caption>
					<h2>
						<c:if test="${user != null}">
            			Edit User
            		</c:if>
						<%-- <c:if test="${user == null}">
            			Add New User
            		</c:if> --%>
            		
					</h2>
				</caption>

				<c:if test="${user != null}">
					<input type="hidden" name="u_id" value="<c:out value='${user.id}' />" />
				</c:if>

				<fieldset class="form-group">
					<label>First Name<span style="color: red;">*</span></label> <input type="text"
						value="<c:out value='${user.fname}' />" class="form-control"
						name="fname" required="required" placeholder="First Name">
				</fieldset>
				
				<fieldset class="form-group">
					<label>Last Name</label> <input type="text"
						value="<c:out value='${user.lname}' />" class="form-control"
						name="lname" placeholder="Last Name">
				</fieldset>
				
				<%-- <fieldset class="form-group">
					<label>User Name<span style="color: red;">*</span></label> <input type="text"
						value="<c:out value='${user.uname}' />" class="form-control"
						name="uname" required="required" placeholder="User Name"> --%>
				</fieldset>
				
				<fieldset class="form-group">
					<label>DOB</label> <input type="date"
						value="<c:out value='${user.dob}' />" class="form-control"
						name="dob" >
				</fieldset>
				
				<fieldset class="form-group">
					<label>Gender<span style="color: red;">*</span></label> <br>
					<value="<c:out value='${user.dob}' />" 
            		class="form-control" name="gender">
					<select name="gender">
            		<option value="Male">Male</option>
            		<option value="Female">Female</option>
            		<option value="Others">Others</option>
            		
        			</select>
        			
				</fieldset>
				
				<fieldset class="form-group">
					<label>Phone<span style="color: red;">*</span></label> <input type="text"
						value="<c:out value='${user.phoneno}' />" class="form-control"
						name="phoneno" required="required" placeholder="Phone">
				</fieldset>

				<fieldset class="form-group">
					<label>Email<span style="color: red;">*</span></label> <input type="text"
						value="<c:out value='${user.email}' />" class="form-control"
						name="email" required="required" placeholder="email">
				</fieldset>
				
				<%-- <fieldset class="form-group">
					<label>Password<span style="color: red;">*</span></label> <input type="password"
						value="<c:out value='${user.password}' />" class="form-control"
						name="password" required="required" placeholder="password">
				</fieldset> --%>
				
				<button type="submit" class="btn btn-success">Save</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
