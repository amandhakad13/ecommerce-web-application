<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title>Home Page</title>
    <link rel="stylesheet" href="css/home.css">
</head>
<body>
    <nav class="navbar">
        <div class="nav-left">
            <div class="logo">Ecommerse</div>
            <div class="nav-links">
                <a href="index.jsp" class="active">Home</a>
                <a href="register.jsp">Register</a>
            </div>
        </div>
        <div class="user-section">
            <span class="username">Welcome, <%= uname %></span>
            <div class="user-dropdown">
                <button class="dropdown-btn" onclick="toggleDropdown()">Profile ▼</button>
                <div class="dropdown-menu" id="dropdownMenu">
                    <a href="edit_profile.jsp" class="dropdown-item">📝 Edit Profile</a>
                </div>
            </div>
            <a href="logout"><button class="logout-btn">Logout</button></a>
        </div>
    </nav>

    <section class="hero-section">
        <h1 class="hero-title">Ecommerse Management Dashboard</h1>
        <p class="hero-subtitle">Welcome to the Ecommerse Management Dashboard. From here, you can manage Categories, Customers, and Products efficiently. 
        						 Use the tools below to add, view, edit, or remove records.</p>
        
        <div class="management-grid">
	        <div class="management-card" onclick="navigateTo('customer')">
	            <div class="card-icon">👥</div>  
	            <h3 class="card-title">Customer Management</h3>
	            <p class="card-description">Maintain customer information for orders and records.</p>
	        </div>   
            
            <div class="management-card" onclick="navigateTo('product')">
                <div class="card-icon">📦</div>
                <h3 class="card-title">Product Management</h3>
                <p class="card-description">Manage all products available in the store.</p>
            </div>
            
            <div class="management-card">
                <div class="card-icon">🏷️</div>
                <h3 class="card-title">Category Management</h3>
                <p class="card-description">Manage product categories to organize your store’s inventory.</p>
            </div>
        </div>
    </section>

    <script>
        function toggleDropdown() {
            const dropdown = document.getElementById('dropdownMenu');
            dropdown.classList.toggle('show');
        }
        
        function navigateTo(section) {
            window.location.href = section + '.jsp';
        }
        
        document.addEventListener('click', function(event) {
            const dropdown = document.getElementById('dropdownMenu');
            const dropdownBtn = document.querySelector('.dropdown-btn');
            
            if (!dropdown.contains(event.target) && !dropdownBtn.contains(event.target)) {
                dropdown.classList.remove('show');
            }
        });
    </script>
</body>
</html>