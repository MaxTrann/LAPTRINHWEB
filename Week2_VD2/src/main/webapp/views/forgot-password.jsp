<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Quên mật khẩu</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body class="container mt-5">
	<h2 class="mb-4 text-center">Quên mật khẩu</h2>

	<c:if test="${not empty alert}">
		<div class="alert alert-danger text-center">${alert}</div>
	</c:if>

	<form action="${pageContext.request.contextPath}/forgot-password"
		method="post" class="w-50 mx-auto">
		<div class="mb-3">
			<label class="form-label">Tên đăng nhập</label> <input type="text"
				name="username" class="form-control" required>
		</div>
		<button type="submit" class="btn btn-primary w-100">Tiếp tục</button>
	</form>
</body>
</html>
