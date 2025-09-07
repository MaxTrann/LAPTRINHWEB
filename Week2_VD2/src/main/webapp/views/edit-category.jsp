<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vn.maxtrann.models.Category"%>
<%
Category category = (Category) request.getAttribute("category");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sửa danh mục</title>
<style>
body {
	font-family: Arial, sans-serif;
	background: #f5f6fa;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.form-container {
	width: 420px;
	background: #fff;
	padding: 25px 30px;
	border-radius: 10px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
}

h2 {
	text-align: center;
	margin-bottom: 20px;
	color: #2f3640;
}

label {
	font-weight: bold;
	display: block;
	margin-bottom: 6px;
	color: #353b48;
}

input[type="text"], input[type="file"] {
	width: 100%;
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #dcdde1;
	border-radius: 6px;
	font-size: 14px;
}

img {
	display: block;
	margin: 10px auto 15px auto;
	border: 1px solid #ccc;
	border-radius: 6px;
}

button {
	width: 100%;
	padding: 12px;
	background: #44bd32;
	border: none;
	border-radius: 6px;
	color: white;
	font-size: 16px;
	cursor: pointer;
}

button:hover {
	background: #4cd137;
}

.back-link {
	display: block;
	text-align: center;
	margin-top: 12px;
	color: #718093;
	text-decoration: none;
	font-size: 14px;
}

.back-link:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<div class="form-container">
		<h2>Sửa danh mục</h2>
		<form action="${pageContext.request.contextPath}/admin/category/edit"
			method="post" enctype="multipart/form-data">

			<input type="hidden" name="id" value="<%=category.getCateid()%>">

			<div>
				<label for="name">Tên danh mục:</label> <input type="text" id="name"
					name="name" value="<%=category.getCatename()%>" required>
			</div>

			<div>
				<label>Icon hiện tại:</label>
				<%
				if (category.getIcon() != null) {
				%>
				<img
					src="${pageContext.request.contextPath}/uploads/<%= category.getIcon() %>"
					alt="icon" style="width: 100px; height: 100px;">
				<%
				} else {
				%>
				<span>Chưa có icon</span>
				<%
				}
				%>
			</div>

			<div>
				<label for="icon">Chọn icon mới (nếu muốn thay):</label> <input
					type="file" id="icon" name="icon" accept="image/*">
			</div>

			<button type="submit">Cập nhật</button>
			<a class="back-link"
				href="${pageContext.request.contextPath}/admin/category/list">Quay
				lại</a>
		</form>
	</div>
</body>
</html>