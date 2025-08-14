<%@page import="dao.AdminsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%
	
	String username = (String) session.getAttribute("username");
	if(username==null) {
		response.sendRedirect("login.jsp");
	}
%>

<head>
    <title>Edit Profile Page</title>
     <link rel="stylesheet" href="css/edit_profile.css">
</head>
<body>
    <a href="index.jsp" class="back-btn">← Back to Home</a>
    
    <div class="edit-container">
        <div class="edit-header">
            <h1>Edit Profile</h1>
            <p>Update your account information</p>
        </div>
        
        <form action="edit_profile.jsp" method="POST">
            <div class="form-section">
                <div class="section-title">
                    👤 Username Settings
                </div>
                <div class="form-group">
                    <label for="currentUsername">Current Username</label>
                    <input type="text" id="currentUsername" value="<%= username %>" disabled>
                </div>
                <div class="form-group">
                    <label for="newUsername">New Username</label>
                    <input type="text" id="newUsername" name="newUsername" placeholder="Enter new username">
                </div>
                <!-- <button type="submit" name="action" value="updateUsername" class="update-btn">Update Username</button> -->
            </div>
            
            <div class="form-section">
                <div class="section-title">
                    🔒 Password Settings
                </div>
                <div class="form-group">
                    <label for="currentPassword">Current Password</label>
                    <input type="password" id="currentPassword" name="currentPassword" placeholder="Enter current password" required>
                </div>
                <div class="form-group">
                    <label for="newPassword">New Password</label>
                    <input type="password" id="newPassword" name="newPassword" placeholder="Enter new password">
                    <div class="password-note">Password must be at least 6 characters long</div>
                </div>
                <button type="submit" name="action" value="updatePassword" class="update-btn">Update Information</button>
            </div>
        </form>
    </div>
    
    <%
    	
    	String n_name = request.getParameter("newUsername");
    	String c_pword = request.getParameter("currentPassword");
    	String n_pword = request.getParameter("newPassword");
    	
    	if(n_name!=null && c_pword!=null && n_pword!=null) {
    		AdminsDao adao = new AdminsDao();
    		
    		boolean check = adao.edit_user(username, c_pword);
    		if(check) {
    			int update = adao.updateUser(n_name, n_pword, username, c_pword);	
    			if(update>0) {
    				out.println("Information Update Successfully");
    				response.sendRedirect("logout");
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
    		else {
    			%>
				<h3>
				<%
    				out.println("Current Password Invalid");
    			%>
				 </h3>
				<% 
    		}
    	}
    
    %>
</body>
</html>