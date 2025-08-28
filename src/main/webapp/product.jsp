<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Product Management</title>
<link rel="stylesheet" href="css/product.css">
</head>
<body>
	<nav class="navbar">
		<div class="nav-left">
			<div class="logo">Dashboard</div>
			<div class="nav-links">
				<a href="index.jsp">Home</a>
				<a href="register.jsp">Register</a>
			</div>
		</div>
		<div class="user-section">
			<span class="username">Welcome, ${sessionScope.username != null ? sessionScope.username : 'User'}</span>
			<div class="user-dropdown">
				<button class="dropdown-btn" onclick="toggleDropdown()">Profile
					▼</button>
				<div class="dropdown-menu" id="dropdownMenu">
					<a href="edit_profile.jsp" class="dropdown-item">📝 Edit
						Profile</a>
				</div>
			</div>
			<a href="logout"><button class="logout-btn">Logout</button></a>
		</div>
	</nav>

	<section class="hero-section">
		<h1 class="hero-title">📦 Product Management</h1>

		<div class="management-grid">
			<div class="management-card" onclick="navigateTo('add_product')">
				<div class="card-title">➕ Add Product</div>
				<p class="card-description">Add new products to inventory with
					pricing and details</p>
				<button class="action-btn create-btn">Add New Product</button>
			</div>

			<div class="management-card" onclick="navigateTo('search_product')">
				<div class="card-title">🔍 Search Products</div>
				<p class="card-description">Find products by ID, name, or
					category quickly</p>
				<button class="action-btn search-btn">Search Products</button>
			</div>

			<div class="management-card" onclick="navigateTo('view_all_products')">
				<div class="card-title">📊 View All Products</div>
				<p class="card-description">Display complete product catalog
					with stock levels</p>
				<button class="action-btn display-btn">View All Products</button>
			</div>

			<div class="management-card" onclick="navigateTo('update_product')">
				<div class="card-title">✏️ Update Product</div>
				<p class="card-description">Modify product details, pricing, and
					inventory</p>
				<button class="action-btn update-btn">Update Product</button>
			</div>

			<div class="management-card" onclick="navigateTo('delete-product')">
				<div class="card-title">🗑️ Delete Product</div>
				<p class="card-description">Remove discontinued products from
					catalog</p>
				<button class="action-btn delete-btn">Delete Product</button>
			</div>
		</div>
	</section>

	<script>
		function toggleDropdown() {
			document.getElementById('dropdownMenu').classList.toggle('show');
		}
		function navigateTo(page) {
			window.location.href = page + '.jsp';
		}
		document.addEventListener('click', function(e) {
			const dropdown = document.getElementById('dropdownMenu');
			if (!dropdown.contains(e.target)
					&& !e.target.classList.contains('dropdown-btn'))
				dropdown.classList.remove('show');
		});
	</script>
</body>
</html>