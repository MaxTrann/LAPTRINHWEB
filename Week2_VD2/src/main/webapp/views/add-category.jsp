<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm danh mục mới</title>
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
	width: 400px;
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

button {
	width: 100%;
	padding: 12px;
	background: #00a8ff;
	border: none;
	border-radius: 6px;
	color: white;
	font-size: 16px;
	cursor: pointer;
}

button:hover {
	background: #0097e6;
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
		<h2>Thêm danh mục mới</h2>
		<form action="${pageContext.request.contextPath}/admin/category/add"
			method="post" enctype="multipart/form-data">

			<div>
				<label for="name">Tên danh mục:</label> <input type="text" id="name"
					name="name" required>
			</div>

			<div>
				<label for="icon">Chọn icon:</label> <input type="file" id="icon"
					name="icon" accept="image/*">
			</div>

			<button type="submit">Thêm mới</button>
			<a class="back-link"
				href="${pageContext.request.contextPath}/admin/category/list">Quay
				lại</a>
		</form>
	</div>
</body>
</html>