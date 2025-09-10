<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>WebTuan4 — Admin Panel</title>

<!-- Bootstrap 5 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous" />

<!-- Font Awesome (tuỳ chọn, dùng cho icon) -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
	rel="stylesheet" />

<style>
body {
	background: #f6f7fb;
}

.brand-gradient {
	background: linear-gradient(135deg, #6f42c1 0%, #0d6efd 100%);
	color: #fff;
	border-radius: 1rem;
}

.action-card:hover {
	transform: translateY(-2px);
	box-shadow: 0 .5rem 1rem rgba(0, 0, 0, .1);
}
</style>
</head>
<body>

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand fw-semibold"
				href="${pageContext.request.contextPath}/admin"> <i
				class="fa-solid fa-screwdriver-wrench me-2"></i>WebTuan4 Admin
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#topnav">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div id="topnav" class="collapse navbar-collapse">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link active"
						href="${pageContext.request.contextPath}/admin/categories"> <i
							class="fa-solid fa-list me-1"></i>Categories
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/admin/category/add">
							<i class="fa-solid fa-plus me-1"></i>Thêm mới
					</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Header -->
	<header class="container my-4">
		<div class="p-4 p-md-5 brand-gradient">
			<h1 class="h3 mb-1">Bảng điều khiển</h1>
			<p class="mb-0 opacity-75">Quản lý Category một cách nhanh chóng
				và trực quan.</p>
		</div>
	</header>

	<!-- Content -->
	<main class="container">
		<div class="row g-4">
			<!-- Card: Danh sách -->
			<div class="col-12 col-md-6">
				<div class="card border-0 action-card">
					<div class="card-body p-4">
						<div class="d-flex align-items-start">
							<div class="me-3">
								<span class="badge bg-primary rounded-pill p-3"> <i
									class="fa-solid fa-list-ul"></i>
								</span>
							</div>
							<div class="flex-grow-1">
								<h5 class="card-title mb-1">Danh sách Categories</h5>
								<p class="text-muted mb-3">Xem, tìm kiếm và quản lý tất cả
									các danh mục hiện có.</p>
								<a href="${pageContext.request.contextPath}/admin/categories"
									class="btn btn-primary"> Mở danh sách </a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Card: Thêm mới -->
			<div class="col-12 col-md-6">
				<div class="card border-0 action-card">
					<div class="card-body p-4">
						<div class="d-flex align-items-start">
							<div class="me-3">
								<span class="badge bg-success rounded-pill p-3"> <i
									class="fa-solid fa-plus"></i>
								</span>
							</div>
							<div class="flex-grow-1">
								<h5 class="card-title mb-1">Thêm Category mới</h5>
								<p class="text-muted mb-3">Tạo danh mục mới và tải hình ảnh
									đại diện nếu cần.</p>
								<a href="${pageContext.request.contextPath}/admin/category/add"
									class="btn btn-success"> Thêm ngay </a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Quick tips (tuỳ chọn) -->
			<div class="col-12">
				<div class="alert alert-light border">
					<div class="d-flex align-items-center">
						<i class="fa-regular fa-lightbulb fa-lg me-2"></i>
						<div>
							<strong>Mẹo:</strong> Bạn có thể quay lại trang chủ Admin bất cứ
							lúc nào bằng cách bấm vào logo <em>WebTuan4 Admin</em> ở góc trái
							trên thanh điều hướng.
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

	<!-- Footer -->
	<footer class="container my-5 text-center text-muted small">
		©
		<%=java.time.Year.now()%>
		WebTuan4. All rights reserved.
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous">
		
	</script>
</body>
</html>
