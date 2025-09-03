<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Danh sách Category</title>
  <link rel="stylesheet"
        href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="container mt-5">

  <div class="w-100 mx-auto">
    <div class="d-flex justify-content-between align-items-center mb-3">
      <h2 class="mb-0">Danh sách Category</h2>
      <a href="<c:url value='/admin/category/add'/>" class="btn btn-success">
        <i class="fa fa-plus"></i> Thêm mới
      </a>
    </div>

    <c:if test="${not empty alert}">
      <div class="alert alert-info">${alert}</div>
    </c:if>

    <div class="table-responsive">
      <table class="table table-striped table-hover align-middle">
        <thead class="thead-light">
          <tr>
            <th style="width:60px">#</th>
            <th style="width:220px">Hình</th>
            <th>Tên</th>
            <th class="text-center" style="width:200px">Hành động</th>
          </tr>
        </thead>
        <tbody>
        <c:forEach items="${cateList}" var="cate" varStatus="st">
          <tr>
            <td>${st.index + 1}</td>
            <td>
              <c:choose>
                <c:when test="${not empty cate.icon}">
                  <c:url value="/image" var="imgUrl">
                    <c:param name="fname" value="${cate.icon}" />
                  </c:url>
                  <img src="${imgUrl}" alt="${cate.name}" class="img-fluid border"
                       style="max-width:200px; max-height:150px;">
                </c:when>
                <c:otherwise>
                  <span class="text-muted">Không có ảnh</span>
                </c:otherwise>
              </c:choose>
            </td>
            <td class="font-weight-medium">${cate.name}</td>
            <td class="text-center">
              <a class="btn btn-sm btn-primary mr-2"
                 href="<c:url value='/admin/category/edit'><c:param name='id' value='${cate.id}'/></c:url>">
                 <i class="fa fa-edit"></i> Sửa
              </a>
              <a class="btn btn-sm btn-danger"
                 href="<c:url value='/admin/category/delete'><c:param name='id' value='${cate.id}'/></c:url>"
                 onclick="return confirm('Xóa category này?');">
                 <i class="fa fa-trash"></i> Xóa
              </a>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
  </div>

</body>
</html>
