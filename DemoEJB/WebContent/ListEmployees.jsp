<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Employees</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

</head>
<body>
<div class="row">
		<!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

		<div class="container">
			<h3 class="text-center">Danh sách Employee</h3>
			<hr>
			<div class="container text-left">

				<a href="<%=request.getContextPath()%>/new" class="btn btn-success">Thêm Employee</a>
			</div>
			<br>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Email</th>
						<th>Phone</th>
						<th>Address</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="employee" items="${listEmployee}">

						<tr>
							<td><c:out value="${employee.getId()}" /></td>
							<td><c:out value="${employee.getName()}" /></td>
							<td><c:out value="${employee.getEmail()}" /></td>
							<td><c:out value="${employee.getPhone()}" /></td>
							<td><c:out value="${employee.getAddress()}" /></td>
							<td><a href="edit?id=<c:out value='${employee.getId()}' />">Sửa</a>	
							<a href="delete?id=<c:out value='${employee.getId()}'/>" onclick="return confirm('Bạn thực sự muốn xóa Employee này?');">Xóa</a>
								
								</td>
								
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>