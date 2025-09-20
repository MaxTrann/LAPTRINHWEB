<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<html>
<head>
<%@ include file="/common/admin/header.jsp"%>
<title>Danh sách người dùng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet"/>
</head>
<body class="bg-light">
	<div class="container mt-5">
		<h2 class="mb-4">Danh sách người dùng</h2>
		<a href="${pageContext.request.contextPath}/admin/user/search"
			class="btn btn-primary mb-3">Tìm kiếm người dùng</a> <a
			href="${pageContext.request.contextPath}/admin/user/add"
			class="btn btn-primary mb-3">Thêm người dùng mới</a>

		<table class="table table-bordered table-hover bg-white">
			<thead class="table-dark">
				<tr>
					<th>ID</th>
					<th>Tên đăng nhập</th>
					<th>Email</th>
					<th>Họ tên</th>
					<th>Số điện thoại</th>
					<th>Ảnh đại diện</th>
					<th>Thao tác</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="user" items="${users}">
					<tr>
						<td>${user.id}</td>
						<td>${user.name}</td>
						<td>${user.email}</td>
						<td>${user.fullname}</td>
						<td>${user.phone}</td>
						<td><img
							src="${pageContext.request.contextPath}/uploads/${user.images}"
							width="60" class="rounded-circle border" /></td>
						<td><a
							href="${pageContext.request.contextPath}/admin/user/edit?id=${user.id}"
							class="btn btn-sm btn-warning">Sửa</a> <a
							href="${pageContext.request.contextPath}/admin/user/delete?id=${user.id}"
							class="btn btn-sm btn-danger"
							onclick="return confirm('Bạn có chắc muốn xóa?');">Xóa</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:if test="${not empty message}">
			<div class="alert alert-success mt-3">${message}</div>
		</c:if>
		<c:if test="${not empty error}">
			<div class="alert alert-danger mt-3">${error}</div>
		</c:if>
	</div>
	<%@ include file="/common/admin/footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>