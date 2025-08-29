<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%
HttpSession hs = request.getSession(false);
String uname = (String)hs.getAttribute("username");
if(hs.getAttribute("username")==null || hs==null) {
    response.sendRedirect("login.jsp");
}
%>

<head>
<title>Category Management</title>
<link rel="stylesheet" href="css/category.css">
</head>
<body>
	<nav class="navbar">
		<div class="nav-left">
			<div class="logo">Dashboard</div>
			<div class="nav-links">
				<a href="index.jsp">Home</a> <a href="register.jsp">Register</a>
			</div>
		</div>
		<div class="user-section">
			<span class="username">Welcome, <%= uname %></span>
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
		<h1 class="hero-title">🏷️ Category Management</h1>

		<div class="management-grid">
			<div class="management-card" onclick="navigateTo('add_category')">
				<div class="card-title">➕ Add Category</div>
				<p class="card-description">Create new product categories with
					descriptions and hierarchy</p>
				<button class="action-btn create-btn">Add New Category</button>
			</div>

			<div class="management-card" onclick="navigateTo('search_category')">
				<div class="card-title">🔍 Search Categories</div>
				<p class="card-description">Find categories by ID, name, or
					parent category quickly</p>
				<button class="action-btn search-btn">Search Categories</button>
			</div>

			<div class="management-card"
				onclick="navigateTo('view_all_categories')">
				<div class="card-title">📊 View All Categories</div>
				<p class="card-description">Display complete category tree with
					product counts</p>
				<button class="action-btn display-btn">View All Categories</button>
			</div>

			<div class="management-card" onclick="navigateTo('update_category')">
				<div class="card-title">✏️ Update Category</div>
				<p class="card-description">Modify category details,
					descriptions, and hierarchy</p>
				<button class="action-btn update-btn">Update Category</button>
			</div>

			<div class="management-card" onclick="navigateTo('delete_category')">
				<div class="card-title">🗑️ Delete Category</div>
				<p class="card-description">Remove unused categories from the
					system</p>
				<button class="action-btn delete-btn">Delete Category</button>
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