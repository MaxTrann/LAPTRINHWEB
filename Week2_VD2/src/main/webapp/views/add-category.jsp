<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Thêm Category</title>
  <link rel="stylesheet"
        href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="container mt-5">

  <form action="<%=request.getContextPath()%>/admin/category/add"
        method="post" enctype="multipart/form-data" class="w-50 mx-auto">

    <h2 class="mb-4 text-center">Thêm Category</h2>

    <!-- alert -->
    <c:if test="${not empty alert}">
      <div class="alert alert-info">${alert}</div>
    </c:if>

    <!-- Tên danh mục -->
    <div class="input-group mb-3">
      <span class="input-group-text"><i class="fa fa-tag"></i></span>
      <input type="text" name="name" class="form-control"
             placeholder="Tên danh mục" required>
    </div>

    <!-- Ảnh đại diện -->
    <div class="input-group mb-4">
      <span class="input-group-text"><i class="fa fa-image"></i></span>
      <input type="file" name="icon" class="form-control" accept="image/*">
    </div>

    <button type="submit" class="btn btn-success w-100 mb-2">
      <i class="fa fa-plus"></i> Thêm
    </button>
    <a href="<%=request.getContextPath()%>/admin/category/list"
       class="btn btn-secondary w-100">Hủy</a>
  </form>

</body>
</html>
