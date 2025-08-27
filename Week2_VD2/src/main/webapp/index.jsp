<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Đăng nhập</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="container mt-5">
  <form action="login" method="post" class="w-50 mx-auto">
    <h2 class="mb-4 text-center">Đăng nhập</h2>

    <c:if test="${not empty alert}">
      <div class="alert alert-info">${alert}</div>
    </c:if>

    <div class="input-group mb-3">
      <span class="input-group-text"><i class="fa fa-user"></i></span>
      <input type="text" name="username" placeholder="Tên đăng nhập" class="form-control" required>
    </div>

    <div class="input-group mb-3">
      <span class="input-group-text"><i class="fa fa-lock"></i></span>
      <input type="password" name="password" placeholder="Mật khẩu" class="form-control" required>
    </div>

    <button type="submit" class="btn btn-primary w-100">Đăng nhập</button>
  </form>
</body>
</html>
