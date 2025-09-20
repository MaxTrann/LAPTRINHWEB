<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Danh sách video</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet"/>
</head>
<body class="bg-light">
<%@ include file="/common/admin/header.jsp"%>

<div class="container mt-5">
    <h2 class="mb-4"><i class="fas fa-video me-2"></i>Danh sách video</h2>
    
    <div class="row mb-3">
        <div class="col-md-6">
            <a href="${pageContext.request.contextPath}/admin/video/add" class="btn btn-primary">
                <i class="fas fa-plus me-1"></i>Thêm video mới
            </a>
        </div>
        <div class="col-md-6 text-end">
            <a href="${pageContext.request.contextPath}/admin/video/search" class="btn btn-outline-secondary">
                <i class="fas fa-search me-1"></i>Tìm kiếm video
            </a>
        </div>
    </div>
    
    <div class="card shadow-sm">
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
                                        ${video.link}
                                    </a>
                                </td>
                                <td class="align-middle">
                                    <c:if test="${video.link.contains('youtube.com/watch?v=') or video.link.contains('youtu.be/')}">
                                        <c:set var="videoId" value="${video.link.contains('youtube.com/watch?v=') ? 
                                            video.link.substring(video.link.indexOf('v=') + 2) : 
                                            video.link.substring(video.link.lastIndexOf('/') + 1)}" />
                                        <img src="https://img.youtube.com/vi/${videoId}/mqdefault.jpg" 
                                             width="120" height="90" class="rounded border" 
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