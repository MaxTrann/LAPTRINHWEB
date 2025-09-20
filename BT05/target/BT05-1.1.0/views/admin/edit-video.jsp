<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Sửa video</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet"/>
</head>
<body class="bg-light">
<%@ include file="/common/admin/header.jsp"%>

<div class="container mt-5">
    <h2 class="mb-4"><i class="fas fa-edit me-2"></i>Sửa video</h2>
    
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow-sm">
                <div class="card-body">
                    <form action="${pageContext.request.contextPath}/admin/video/update" method="post">
                        <input type="hidden" name="id" value="${video.id}"/>
                        
                        <div class="mb-3">
                            <label class="form-label"><i class="fas fa-heading me-2"></i>Tiêu đề video</label>
                            <input type="text" name="title" value="${video.title}" class="form-control" placeholder="Nhập tiêu đề video..." required/>
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label"><i class="fas fa-link me-2"></i>Link video</label>
                            <input type="url" name="link" value="${video.link}" class="form-control" placeholder="https://www.youtube.com/watch?v=..." required/>
                            <div class="form-text">
                                <i class="fas fa-info-circle me-1"></i>
                                Hỗ trợ link YouTube, Vimeo và các nền tảng video khác
                            </div>
                        </div>
                        
                        <!-- Preview video hiện tại -->
                        <c:if test="${not empty video.link}">
                            <div class="mb-3">
                                <label class="form-label"><i class="fas fa-eye me-2"></i>Preview video hiện tại</label>
                                <div class="border rounded p-3 bg-white">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <c:if test="${video.link.contains('youtube.com/watch?v=') or video.link.contains('youtu.be/')}">
                                                <c:set var="videoId" value="${video.link.contains('youtube.com/watch?v=') ? 
                                                    video.link.substring(video.link.indexOf('v=') + 2) : 
                                                    video.link.substring(video.link.lastIndexOf('/') + 1)}" />
                                                <img src="https://img.youtube.com/vi/${videoId}/mqdefault.jpg" 
                                                     class="img-fluid rounded" alt="Video thumbnail"/>
                                            </c:if>
                                        </div>
                                        <div class="col-md-8">
                                            <h6>${video.title}</h6>
                                            <p class="text-muted mb-2">
                                                <a href="${video.link}" target="_blank" class="text-decoration-none">
                                                    <i class="fas fa-external-link-alt me-1"></i>
                                                    ${video.link}
                                                </a>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                        
                        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                            <a href="${pageContext.request.contextPath}/admin/videos" class="btn btn-secondary me-md-2">
                                <i class="fas fa-arrow-left me-1"></i>Quay lại
                            </a>
                            <button type="submit" class="btn btn-warning">
                                <i class="fas fa-save me-1"></i>Cập nhật
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    <c:if test="${not empty error}">
        <div class="alert alert-danger mt-3">${error}</div>
    </c:if>
</div>

<%@ include file="/common/admin/footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>