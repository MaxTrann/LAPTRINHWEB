<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Tìm kiếm danh mục</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet"/>
</head>
<body class="bg-light">
<%@ include file="/common/admin/header.jsp"%>

<div class="container mt-5">
    <div class="row">
        <div class="col-12">
            <h2 class="mb-4"><i class="fas fa-search me-2"></i>Tìm kiếm danh mục</h2>
            
            <!-- Form tìm kiếm -->
            <div class="card shadow-sm mb-4">
                <div class="card-body">
                    <form action="${pageContext.request.contextPath}/admin/category/search" method="get" class="row g-3">
                        <div class="col-md-10">
                            <div class="input-group">
                                <span class="input-group-text"><i class="fas fa-search"></i></span>
                                <input type="text" name="keyword" class="form-control" 
                                       placeholder="Nhập từ khóa tìm kiếm..." value="${keyword}" required/>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <button type="submit" class="btn btn-primary w-100">
                                <i class="fas fa-search me-1"></i>Tìm kiếm
                            </button>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Kết quả tìm kiếm -->
            <c:if test="${not empty keyword}">
                <div class="alert alert-info">
                    <i class="fas fa-info-circle me-2"></i>
                    Kết quả tìm kiếm cho từ khóa: <strong>"${keyword}"</strong>
                    <c:if test="${not empty categories}">
                        - Tìm thấy <strong>${categories.size()}</strong> kết quả
                    </c:if>
                </div>
            </c:if>

            <c:if test="${not empty categories}">
                <div class="card shadow-sm">
                    <div class="card-header bg-primary text-white">
                        <h5 class="mb-0"><i class="fas fa-list me-2"></i>Danh sách kết quả</h5>
                    </div>
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-hover mb-0">
                                <thead class="table-dark">
                                    <tr>
                                        <th>ID</th>
                                        <th>Tên danh mục</th>
                                        <th>Hình ảnh</th>
                                        <th>Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="category" items="${categories}">
                                        <tr>
                                            <td class="align-middle">${category.id}</td>
                                            <td class="align-middle">
                                                <strong>${category.name}</strong>
                                            </td>
                                            <td class="align-middle">
                                                <img src="${pageContext.request.contextPath}/uploads/${category.images}" 
                                                     width="60" height="60" class="rounded border" 
                                                     alt="${category.name}"/>
                                            </td>
                                            <td class="align-middle">
                                                <div class="btn-group" role="group">
                                                    <a href="${pageContext.request.contextPath}/admin/category/edit?id=${category.id}" 
                                                       class="btn btn-sm btn-warning">
                                                        <i class="fas fa-edit me-1"></i>Sửa
                                                    </a>
                                                    <a href="${pageContext.request.contextPath}/admin/category/delete?id=${category.id}" 
                                                       class="btn btn-sm btn-danger" 
                                                       onclick="return confirm('Bạn có chắc muốn xóa danh mục này?');">
                                                        <i class="fas fa-trash me-1"></i>Xóa
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </c:if>

            <c:if test="${not empty keyword and empty categories}">
                <div class="alert alert-warning text-center">
                    <i class="fas fa-exclamation-triangle me-2"></i>
                    Không tìm thấy danh mục nào với từ khóa "<strong>${keyword}</strong>"
                </div>
            </c:if>

            <!-- Các nút điều hướng -->
            <div class="mt-4">
                <a href="${pageContext.request.contextPath}/admin/categories" class="btn btn-secondary me-2">
                    <i class="fas fa-arrow-left me-1"></i>Về danh sách
                </a>
                <a href="${pageContext.request.contextPath}/admin/category/add" class="btn btn-success">
                    <i class="fas fa-plus me-1"></i>Thêm danh mục mới
                </a>
            </div>
        </div>
    </div>
</div>

<%@ include file="/common/admin/footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>