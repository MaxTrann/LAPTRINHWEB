<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>Đăng ký</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="container mt-5">

	<form action="register" method="post" class="w-50 mx-auto">
		<h2 class="mb-4 text-center">Tạo tài khoản mới</h2>

		<c:if test="${not empty alert}">
			<div class="alert alert-danger">${alert}</div>
		</c:if>

		<!-- Username -->
		<div class="input-group mb-3">
			<span class="input-group-text"><i class="fa fa-user"></i></span> <input
				type="text" name="username" class="form-control"
				placeholder="Tên đăng nhập" required>
		</div>

		<!-- Full name -->
		<div class="input-group mb-3">
			<span class="input-group-text"><i class="fa fa-id-card"></i></span> <input
				type="text" name="fullname" class="form-control"
				placeholder="Họ tên" required>
		</div>

		<!-- Email -->
		<div class="input-group mb-3">
			<span class="input-group-text"><i class="fa fa-envelope"></i></span>
			<input type="email" name="email" class="form-control"
				placeholder="Email" required>
		</div>

		<!-- Password -->
		<div class="input-group mb-3">
			<span class="input-group-text"><i class="fa fa-lock"></i></span> <input
				type="password" name="password" class="form-control"
				placeholder="Mật khẩu" required>
		</div>

		<!-- Confirm Password -->
		<div class="input-group mb-3">
			<span class="input-group-text"><i class="fa fa-lock"></i></span> <input
				type="password" name="confirmPassword" class="form-control"
				placeholder="Nhập lại mật khẩu" required>
		</div>

		<button type="submit" class="btn btn-success w-100">Tạo tài
			khoản</button>

		<p class="text-center mt-3">
			Đã có tài khoản? <a href="login">Đăng nhập</a>
		</p>
	</form>

</body>
</html>
