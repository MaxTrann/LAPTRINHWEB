<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="vn.maxtrann.models.Category"%>
<%
List<Category> categories = (List<Category>) request.getAttribute("categories");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách danh mục</title>
<style>
body {
	font-family: Arial, sans-serif;
	background: #f5f6fa;
	padding: 30px;
}

h2 {
	text-align: center;
	margin-bottom: 20px;
	color: #2f3640;
}

a.add-btn {
	display: inline-block;
	margin-bottom: 15px;
	padding: 10px 15px;
	background: #00a8ff;
	color: #fff;
	text-decoration: none;
	border-radius: 6px;
}

a.add-btn:hover {
	background: #0097e6;
}

table {
	width: 100%;
	border-collapse: collapse;
	background: #fff;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

th, td {
	padding: 12px;
	border-bottom: 1px solid #dcdde1;
	text-align: center;
}

th {
	background: #273c75;
	color: #fff;
}

tr:hover {
	background: #f1f2f6;
}

img {
	border-radius: 6px;
	border: 1px solid #dcdde1;
}

.action-btn {
	padding: 6px 12px;
	border-radius: 4px;
	text-decoration: none;
	color: white;
	font-size: 14px;
}

.edit-btn {
	background: #44bd32;
}

.edit-btn:hover {
	background: #4cd137;
}

.delete-btn {
	background: #e84118;
}

.delete-btn:hover {
	background: #c23616;
}
</style>
</head>
<body>
	<div
		style="background: linear-gradient(90deg, #192a56, #273c75); color: white; padding: 15px 30px; display: flex; justify-content: space-between; align-items: center; border-radius: 6px; margin-bottom: 30px;">

		<h2 style="margin: 0; font-weight: 600; color: #FFDAB9;">Trần Lê Quốc Đại</h2>

		<a href="${pageContext.request.contextPath}/logout"
			style="background: #e84118; padding: 8px 16px; border-radius: 4px; text-decoration: none; color: #FFDAB9; font-weight: bold;">
			Đăng xuất </a>
	</div>
	<h2>Danh sách danh mục</h2>
	<a class="add-btn"
		href="${pageContext.request.contextPath}/admin/category/add">+
		Thêm mới</a>
	<table>
		<thead>
			<tr>
				<th>ID</th>
				<th>Tên danh mục</th>
				<th>Icon</th>
				<th>Thao tác</th>
			</tr>
		</thead>
		<tbody>
			<%
			if (categories != null && !categories.isEmpty()) {
				for (Category c : categories) {
			%>
			<tr>
				<td><%=c.getCateid()%></td>
				<td><%=c.getCatename()%></td>
				<td>
					<%
					if (c.getIcon() != null) {
					%> <img
					src="${pageContext.request.contextPath}/uploads/<%= c.getIcon() %>"
					alt="icon" style="width: 60px; height: 60px;"> <%
 } else {
 %> <span>Không có</span> <%
 }
 %>
				</td>
				<td><a class="action-btn edit-btn"
					href="${pageContext.request.contextPath}/admin/category/edit?id=<%= c.getCateid() %>">Sửa</a>
					<a class="action-btn delete-btn"
					href="${pageContext.request.contextPath}/admin/category/delete?id=<%= c.getCateid() %>"
					onclick="return confirm('Bạn có chắc muốn xóa?');">Xóa</a></td>
			</tr>
			<%
			}
			} else {
			%>
			<tr>
				<td colspan="4">Không có danh mục nào.</td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
</body>


</html>