<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
  <title>Tìm kiếm người dùng</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet"/>

  <style>
    body{ background:#f7f9fc; }
    h2{ font-weight:700; color:#0f172a; }

    .card{
      border-radius:14px;
      border:1px solid #e5e7eb;
      box-shadow:0 6px 16px rgba(15,23,42,.06);
    }

    .btn{ border-radius:8px; font-weight:500; }
    .btn-primary{
      background:linear-gradient(45deg,#0ea5e9,#6366f1);
      border:none;
    }
    .btn-primary:hover{ opacity:.9; }

    .table th{
      border:none;
      background:#eef7fe;
      font-weight:600;
      color:#334155;
    }
    .table td{ vertical-align:middle; }
    .table-hover tbody tr:hover{ background:#f9fbff; }

    .avatar{
      width:60px; height:60px;
      object-fit:cover;
      border-radius:50%;
      border:2px solid #e5e7eb;
      box-shadow:0 2px 6px rgba(0,0,0,.05);
    }

    .alert{ border-radius:10px; font-weight:500; }
  </style>
</head>
<body class="bg-light">
<%@ include file="/common/admin/header.jsp"%>

<div class="container py-5">
  <h2 class="mb-4"><i class="fas fa-search me-2 text-primary"></i>Tìm kiếm người dùng</h2>
  
  <!-- Form tìm kiếm -->
  <div class="card p-4 mb-4">
    <form action="${pageContext.request.contextPath}/admin/user/search" method="get" class="row g-3">
      <div class="col-md-10">
        <div class="input-group">
          <span class="input-group-text"><i class="fas fa-search"></i></span>
          <input type="text" name="keyword" class="form-control"
                 placeholder="Nhập tên đăng nhập, email, họ tên hoặc số điện thoại..."
                 value="${keyword}" required/>
        </div>
      </div>
      <div class="col-md-2">
        <button type="submit" class="btn btn-primary w-100">
          <i class="fas fa-search me-1"></i>Tìm kiếm
        </button>
      </div>
    </form>
  </div>

  <!-- Kết quả tìm kiếm -->
  <c:if test="${not empty keyword}">
    <div class="alert alert-info">
      <i class="fas fa-info-circle me-2"></i>
      Kết quả tìm kiếm cho từ khóa: <strong>"${keyword}"</strong>
      <c:if test="${not empty users}">
        – Tìm thấy <strong>${users.size()}</strong> kết quả
      </c:if>
    </div>
  </c:if>

  <c:if test="${not empty users}">
    <div class="card">
      <div class="card-header bg-light">
        <h5 class="mb-0"><i class="fas fa-users me-2 text-primary"></i>Danh sách kết quả</h5>
      </div>
      <div class="card-body p-0">
        <div class="table-responsive">
          <table class="table table-hover align-middle mb-0">
            <thead>
              <tr>
                <th>ID</th>
                <th>Tên đăng nhập</th>
                <th>Email</th>
                <th>Họ tên</th>
                <th>Số điện thoại</th>
                <th>Ảnh đại diện</th>
                <th class="text-center">Thao tác</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="user" items="${users}">
                <tr>
                  <td>${user.id}</td>
                  <td><strong>${user.name}</strong></td>
                  <td>${user.email}</td>
                  <td>${user.fullname}</td>
                  <td>${user.phone}</td>
                  <td>
                    <img src="${pageContext.request.contextPath}/uploads/${user.images}"
                         alt="${user.name}" class="avatar"/>
                  </td>
                  <td class="text-center">
                    <a href="${pageContext.request.contextPath}/admin/user/edit?id=${user.id}" 
                       class="btn btn-sm btn-outline-warning me-2">
                      <i class="fas fa-edit me-1"></i>Sửa
                    </a>
                    <a href="${pageContext.request.contextPath}/admin/user/delete?id=${user.id}" 
                       class="btn btn-sm btn-outline-danger"
                       onclick="return confirm('Bạn có chắc muốn xóa người dùng này?');">
                      <i class="fas fa-trash me-1"></i>Xóa
                    </a>
                  </td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </c:if>

  <c:if test="${not empty keyword and empty users}">
    <div class="alert alert-warning text-center">
      <i class="fas fa-exclamation-triangle me-2"></i>
      Không tìm thấy người dùng nào với từ khóa "<strong>${keyword}</strong>"
    </div>
  </c:if>

  <!-- Điều hướng -->
  <div class="mt-4">
    <a href="${pageContext.request.contextPath}/admin/users" class="btn btn-secondary me-2">
      <i class="fas fa-arrow-left me-1"></i>Về danh sách
    </a>
    <a href="${pageContext.request.contextPath}/admin/user/add" class="btn btn-success">
      <i class="fas fa-user-plus me-1"></i>Thêm người dùng mới
    </a>
  </div>
</div>

<%@ include file="/common/admin/footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
