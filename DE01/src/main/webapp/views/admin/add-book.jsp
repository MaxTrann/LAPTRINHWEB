<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/common/admin/header.jsp"%>
    <meta charset="UTF-8">
    <title>Thêm sách mới</title>
    <!-- Bootstrap 5 & Font Awesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        body {
            background: #f8fafc;
        }
        .card {
            border-radius: 16px;
            box-shadow: 0 2px 16px rgba(0,0,0,0.07);
        }
        .form-label {
            font-weight: 500;
        }
        .btn {
            border-radius: 8px;
        }
        .form-control, .form-select {
            border-radius: 8px;
        }
    </style>
</head>
<body>
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card p-4">
                    <h4 class="mb-4 text-center"><i class="fa fa-plus-circle me-2"></i>Thêm sách mới</h4>

                    <!-- Hiển thị thông báo lỗi nếu có -->
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger" role="alert">
                            <i class="fa fa-exclamation-triangle me-2"></i>${error}
                        </div>
                    </c:if>

                    <form action="${pageContext.request.contextPath}/admin/book/add" method="post" enctype="multipart/form-data">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="title" class="form-label">Tiêu đề sách <span class="text-danger">*</span></label>
                                    <input type="text" id="title" name="title" class="form-control" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="isbn" class="form-label">ISBN</label>
                                    <input type="number" id="isbn" name="isbn" class="form-control">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="publisher" class="form-label">Nhà xuất bản</label>
                                    <input type="text" id="publisher" name="publisher" class="form-control">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="publishDate" class="form-label">Ngày xuất bản</label>
                                    <input type="date" id="publishDate" name="publishDate" class="form-control">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="price" class="form-label">Giá (VNĐ)</label>
                                    <input type="number" step="0.01" id="price" name="price" class="form-control">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="quantity" class="form-label">Số lượng</label>
                                    <input type="number" id="quantity" name="quantity" class="form-control" min="0" value="0">
                                </div>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="description" class="form-label">Mô tả</label>
                            <textarea id="description" name="description" class="form-control" rows="4"></textarea>
                        </div>

                        <div class="mb-3">
                            <label for="authorIds" class="form-label">Chọn tác giả</label>
                            <select multiple id="authorIds" name="authorIds" class="form-select" size="5">
                                <c:forEach items="${authors}" var="author">
                                    <option value="${author.authorId}">${author.authorName}</option>
                                </c:forEach>
                            </select>
                            <div class="form-text">Giữ Ctrl để chọn nhiều tác giả</div>
                        </div>

                        <div class="mb-3">
                            <label for="image" class="form-label">Chọn hình bìa</label>
                            <input type="file" id="image" name="image" class="form-control" accept="image/*">
                            <div class="form-text">Chọn file hình ảnh cho bìa sách (JPG, PNG, GIF)</div>
                        </div>

                        <div class="d-flex justify-content-between">
                            <button type="submit" class="btn btn-primary px-4">
                                <i class="fa fa-save me-1"></i>Thêm mới
                            </button>
                            <a href="${pageContext.request.contextPath}/admin/books" class="btn btn-outline-secondary px-4">
                                <i class="fa fa-arrow-left me-1"></i>Quay lại
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="/common/admin/footer.jsp"%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
