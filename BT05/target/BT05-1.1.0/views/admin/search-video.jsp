<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Tìm kiếm video</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet"/>
</head>
<body class="bg-light">
<%@ include file="/common/admin/header.jsp"%>

<div class="container mt-5">
    <div class="row">
        <div class="col-12">
            <h2 class="mb-4"><i class="fas fa-search me-2"></i>Tìm kiếm video</h2>
            
            <!-- Form tìm kiếm -->
            <div class="card shadow-sm mb-4">
                <div class="card-body">
                    <form action="${pageContext.request.contextPath}/admin/video/search" method="get" class="row g-3">
                        <div class="col-md-10">
                            <div class="input-group">
                                <span class="input-group-text"><i class="fas fa-search"></i></span>
                                <input type="text" name="keyword" class="form-control" 
                                       placeholder="Nhập tiêu đề video hoặc link để tìm kiếm..." value="${keyword}" required/>
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
                    <c:if test="${not empty videos}">
                        - Tìm thấy <strong>${videos.size()}</strong> kết quả
                    </c:if>
                </div>
            </c:if>

            <c:if test="${not empty videos}">
                <div class="card shadow-sm">
                    <div class="card-header bg-primary text-white">
                        <h5 class="mb-0"><i class="fas fa-video me-2"></i>Danh sách kết quả</h5>
                    </div>
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-hover mb-0">
                                <thead class="table-dark">
                                    <tr>
                                        <th>ID</th>
                                        <th>Tiêu đề</th>
                                        <th>Link video</th>
                                        <th>Preview</th>
                                        <th>Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="video" items="${videos}">
                                        <tr>
                                            <td class="align-middle">${video.id}</td>
                                            <td class="align-middle">
                                                <strong>${video.title}</strong>
                                            </td>
                                            <td class="align-middle">
                                                <a href="${video.link}" target="_blank" class="text-decoration-none">
                                                    <i class="fas fa-external-link-alt me-1"></i>
                                                    <span class="text-truncate d-inline-block" style="max-width: 200px;">
                                                        ${video.link}
                                                    </span>
                                                </a>
                                            </td>
                                            <td class="align-middle">
                                                <c:if test="${video.link.contains('youtube.com/watch?v=') or video.link.contains('youtu.be/')}">
                                                    <c:set var="videoId" value="${video.link.contains('youtube.com/watch?v=') ? 
                                                        video.link.substring(video.link.indexOf('v=') + 2) : 
                                                        video.link.substring(video.link.lastIndexOf('/') + 1)}" />
                                                    <img src="https://img.youtube.com/vi/${videoId}/mqdefault.jpg" 
                                                         width="100" height="75" class="rounded border" 
                                                         alt="Video thumbnail"/>
                                                </c:if>
                                            </td>
                                            <td class="align-middle">
                                                <div class="btn-group" role="group">
                                                    <a href="${pageContext.request.contextPath}/admin/video/edit?id=${video.id}" 
                                                       class="btn btn-sm btn-warning">
                                                        <i class="fas fa-edit me-1"></i>Sửa
                                                    </a>
                                                    <a href="${pageContext.request.contextPath}/admin/video/delete?id=${video.id}" 
                                                       class="btn btn-sm btn-danger" 
                                                       onclick="return confirm('Bạn có chắc muốn xóa video này?');">
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

            <c:if test="${not empty keyword and empty videos}">
                <div class="alert alert-warning text-center">
                    <i class="fas fa-exclamation-triangle me-2"></i>
                    Không tìm thấy video nào với từ khóa "<strong>${keyword}</strong>"
                </div>
            </c:if>

            <!-- Các nút điều hướng -->
            <div class="mt-4">
                <a href="${pageContext.request.contextPath}/admin/videos" class="btn btn-secondary me-2">
                    <i class="fas fa-arrow-left me-1"></i>Về danh sách
                </a>
                <a href="${pageContext.request.contextPath}/admin/video/add" class="btn btn-success">
                    <i class="fas fa-plus me-1"></i>Thêm video mới
                </a>
            </div>
        </div>
    </div>
</div>

<%@ include file="/common/admin/footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>