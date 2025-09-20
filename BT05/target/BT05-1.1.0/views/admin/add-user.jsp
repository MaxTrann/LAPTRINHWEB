<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>

    <title>Thêm người dùng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body class="bg-light">
<%@ include file="/common/admin/header.jsp"%>
<div class="container mt-5">
    <h2 class="mb-4">Thêm người dùng</h2>
    <form action="${pageContext.request.contextPath}/admin/user/insert" method="post" enctype="multipart/form-data" class="bg-white p-4 rounded shadow-sm">
        <div class="mb-3">
            <label class="form-label">Tên đăng nhập</label>
            <input type="text" name="name" class="form-control" required/>
        </div>
        <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="email" name="email" class="form-control" required/>
        </div>
        <div class="mb-3">
            <label class="form-label">Mật khẩu</label>
            <input type="password" name="password" class="form-control" required/>
        </div>
        <div class="mb-3">
            <label class="form-label">Họ tên</label>
            <input type="text" name="fullname" class="form-control" required/>
        </div>
        <div class="mb-3">
            <label class="form-label">Số điện thoại</label>
            <input type="text" name="phone" class="form-control" required/>
        </div>
        <div class="mb-3">
            <label class="form-label">Ảnh đại diện</label>
            <input type="file" name="image" class="form-control" accept="image/*"/>
        </div>
        <button type="submit" class="btn btn-success">Thêm mới</button>
    </form>
    <c:if test="${not empty error}">
        <div class="alert alert-danger mt-3">${error}</div>
    </c:if>
</div>
<%@ include file="/common/admin/footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>