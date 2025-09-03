<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Đặt lại mật khẩu</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body class="container mt-5">
	<h2 class="mb-4 text-center">Đặt lại mật khẩu</h2>

	<form action="${pageContext.request.contextPath}/reset-password"
		method="post" class="w-50 mx-auto">
		<input type="hidden" name="username" value="${username}">
		<div class="mb-3">
			<label class="form-label">Mật khẩu mới</label> <input type="password"
				name="newPassword" class="form-control" required>
		</div>
		<button type="submit" class="btn btn-success w-100">Đổi mật
			khẩu</button>
	</form>
</body>
</html>
