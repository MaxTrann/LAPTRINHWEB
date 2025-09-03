<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Sửa Category</title>
  <link rel="stylesheet"
        href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="container mt-5">

  <c:url value="/admin/category/edit" var="editUrl" />

  <form action="${editUrl}" method="post" enctype="multipart/form-data"
        class="w-50 mx-auto">

    <h2 class="mb-4 text-center">Chỉnh sửa Category</h2>

    <!-- id ẩn -->
    <input type="hidden" name="id" value="${category.id}" />

    <!-- Tên danh mục -->
    <div class="input-group mb-3">
      <span class="input-group-text"><i class="fa fa-tag"></i></span>
      <input type="text" name="name" class="form-control"
             placeholder="Tên danh mục" value="${category.name}" required>
    </div>

    <!-- Ảnh hiện tại -->
    <div class="mb-3 text-center">
      <c:if test="${not empty category.icon}">
        <c:url value="/image" var="imgUrl">
          <c:param name="fname" value="${category.icon}" />
        </c:url>
        <img src="${imgUrl}" alt="${category.name}"
             class="img-fluid border" style="max-width:200px; max-height:150px;">
      </c:if>
    </div>

    <!-- Upload ảnh mới -->
    <div class="input-group mb-4">
      <span class="input-group-text"><i class="fa fa-image"></i></span>
      <input type="file" name="icon" class="form-control" accept="image/*">
    </div>

    <button type="submit" class="btn btn-primary w-100 mb-2">
      <i class="fa fa-save"></i> Cập nhật
    </button>
    <a href="<c:url value='/admin/category/list'/>"
       class="btn btn-secondary w-100">Hủy</a>
  </form>

</body>
</html>
