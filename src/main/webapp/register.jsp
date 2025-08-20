<%@page import="dao.AdminsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%
	
	HttpSession hs = request.getSession(false);
	if(hs.getAttribute("username")==null || hs==null) {
		response.sendRedirect("login.jsp");
	}
%>

<head>
    <title>Register Page</title>
    <link rel="stylesheet" href="css/register.css">
</head>
<body>
    <a href="index.jsp" class="back-home">← Back to Home</a>
    
    <div class="register-container">
        <div class="register-header">
            <h1>Create Account</h1>
            <p>Join us today and get started</p>
        </div>
        
        <form action="register.jsp" method="POST">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Choose a username" required>
            </div>
            
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Create a secure password" required>
                <div class="password-strength">Password must be at least 6 characters long</div>
            </div>
            
            <div class="form-group">
                <label for="confirmPassword">Confirm Password</label>
                <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm your password" required>
            </div>
            
            <button type="submit" class="register-btn">Create Account</button>
        </form>
        
    </div>

    <script>
        document.querySelector('form').addEventListener('submit', function(e) {
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            
            if (password !== confirmPassword) {
                e.preventDefault();
                alert('Passwords do not match!');
            }
        });
    </script>
    
    <%
    
    	String uname = request.getParameter("username");
    	String pword = request.getParameter("password");
    	
    	if(uname!=null && pword!=null) {
    		AdminsDao adao = new AdminsDao();
    		
    		int insert = adao.register(uname, pword);
    		if(insert>0) {
    			%>
    			<h3>
    			<%
    				out.println("Register Successfully");
    			%>
    			</h3>
    			<%
    		}
    		else {
    			%>
    			<h3>
    			<% 
    				out.println("Something Went Wrong");
    			%> 
    			</h3>
    			<%	
    		}
    	}
    
    %>
</body>
</html>