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
    <title>Customer Management</title>
    <link rel="stylesheet" href="css/customer.css">
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
                <button class="dropdown-btn" onclick="toggleDropdown()">Profile ▼</button>
                <div class="dropdown-menu" id="dropdownMenu">
                    <a href="edit_profile.jsp" class="dropdown-item">📝 Edit Profile</a>
                </div>
            </div>
            <a href="logout"><button class="logout-btn">Logout</button></a>
        </div>
    </nav>

    <section class="hero-section">
        <h1 class="hero-title">👥 Customer Management</h1>
        
        <div class="management-grid">
            <div class="management-card" onclick="navigateTo('insert_customer')">
                <div class="card-title">➕ Insert Customer</div>
                <p style="margin-bottom: 15px; opacity: 0.9;">Add new customers to the database</p>
                <button class="action-btn insert-btn">Insert Customer</button>
            </div>
            
            <div class="management-card" onclick="navigateTo('search_by_id_customer')">
                <div class="card-title">🔍 Search by ID</div>
                <p style="margin-bottom: 15px; opacity: 0.9;">Find specific customer using ID</p>
                <button class="action-btn search-btn">Search Customer</button>
            </div>
            
            <div class="management-card" onclick="navigateTo('display_all_customers')">
                <div class="card-title">📋 Display All</div>
                <p style="margin-bottom: 15px; opacity: 0.9;">View all customers in the database</p>
                <button class="action-btn display-btn">Display All Customers</button>
            </div>
            
            <div class="management-card" onclick="navigateTo('update_customer')">
                <div class="card-title">✏️ Update Customer</div>
                <p style="margin-bottom: 15px; opacity: 0.9;">Modify existing customer information</p>
                <button class="action-btn update-btn">Update Customer</button>
            </div>
            
            <div class="management-card" onclick="navigateTo('delete_customer')">
                <div class="card-title">🗑️ Delete Customer</div>
                <p style="margin-bottom: 15px; opacity: 0.9;">Remove customers from the database</p>
                <button class="action-btn delete-btn">Delete Customer</button>
            </div>
        </div>
    </section>

    <script>
        function toggleDropdown() { 
        	document.getElementById('dropdownMenu').classList.toggle('show'); 
        	
        }
        
        function navigateTo(page) { window.location.href = page + '.jsp'; }
        
        document.addEventListener('click', function(e) { 
            const dropdown = document.getElementById('dropdownMenu'); 
            if (!dropdown.contains(e.target) && !e.target.classList.contains('dropdown-btn')) dropdown.classList.remove('show'); 
        });
    </script>
</body>
</html>