<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang chủ - Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
  <!-- Header -->
  
  <%@ include file="/common/admin/header.jsp"%>
    <div class="container-fluid mt-4">
        <div class="row">
            <div class="col-12">
                <h1 class="mb-4"><i class="fas fa-tachometer-alt"></i> Admin Dashboard</h1>
                
                <div class="row mb-4">
                    <div class="col-md-3">
                        <div class="card bg-primary text-white">
                            <div class="card-body">
                                <h5 class="card-title">Quản lý Danh mục</h5>
                                <p class="card-text">Xem và quản lý danh mục</p>
                                <a href="${pageContext.request.contextPath}/admin/categories" class="btn btn-light">Xem chi tiết</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card bg-success text-white">
                            <div class="card-body">
                                <h5 class="card-title">Quản lý người dùng</h5>
                                <p class="card-text">Xem và quản lý người dùng</p>
                                <a href="${pageContext.request.contextPath}/admin/users" class="btn btn-light">Xem chi tiết</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card bg-info text-white">
                            <div class="card-body">
                                <h5 class="card-title">Quản lý video </h5>
                                <p class="card-text">Xem và quản lý video</p>
                                <a href="${pageContext.request.contextPath}/admin/videos" class="btn btn-light">Xem chi tiết</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card bg-warning text-white">
                            <div class="card-body">
                                <h5 class="card-title">Cài đặt</h5>
                                <p class="card-text">Cài đặt hệ thống</p>
                                <a href="#" class="btn btn-light">Xem chi tiết</a>
                            </div>
                        </div>
                    </div>
                    
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="card-title mb-0">Chào mừng đến với Admin Panel</h5>
                            </div>
                            <div class="card-body">
                                <p class="card-text">Đây là trang quản trị của hệ thống. Bạn có thể sử dụng các chức năng sau:</p>
                                <ul>
                               		<li>Quản lý danh mục</li>
                                    <li>Quản lý người dùng</li>
                                     <li>Quản lý video</li>
                                    
                                    <li>Cài đặt hệ thống</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

  <%@ include file="/common/admin/footer.jsp"%>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</html>