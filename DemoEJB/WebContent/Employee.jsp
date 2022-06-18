<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>

<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
			<a href="<%=request.getContextPath()%>/list-employee" class="btn btn-success">Quay lại</a>
				<c:if test="${EditEmployee != null}">
					<form action="update" method="post"> 
				</c:if>
				<c:if test="${EditEmployee == null}">
					<form action="insert" method="post">
				</c:if>

				<caption>
					<h2>
						<c:if test="${EditEmployee != null}">
            			Sửa Employee
            		</c:if>
						<c:if test="${EditEmployee == null}">
            			Thêm Employee
            		</c:if>
					</h2>
				</caption>

				<c:if test="${EditEmployee != null}">
					<input type="hidden" name="id" value="<c:out value='${EditEmployee.getId()}' />" />
				</c:if>

				<fieldset class="form-group">
					<label>Name</label> <input type="text"
						value="<c:out value='${EditEmployee.getName()}' />" class="form-control"
						name="name" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>Email</label> <input type="email"
						value="<c:out value='${EditEmployee.getEmail()}' />" class="form-control"
						name="email">
				</fieldset>
				<fieldset class="form-group">
					<label>Phone</label> <input type="tel" maxlength="10"
						value="<c:out  value='${EditEmployee.getPhone()}' />" class="form-control"
						name="phone">
				</fieldset>
				<fieldset class="form-group">
					<label>Address</label> <input type="text"
						value="<c:out value='${EditEmployee.getAddress()}' />" class="form-control"
						name="address">
				</fieldset>

				<button type="submit" class="btn btn-success">Ghi</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>