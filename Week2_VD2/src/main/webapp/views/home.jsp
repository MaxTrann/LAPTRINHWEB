<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body class="container mt-5">

	<h2>Xin chào, ${sessionScope.currentUser}!</h2>

	<!-- Nút Logout -->
	<a href="${pageContext.request.contextPath}/logout"
		class="btn btn-danger mt-3">Đăng xuất</a>

</body>
</html>
