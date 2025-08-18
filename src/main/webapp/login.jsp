<!DOCTYPE html>
<%@page import="dao.AdminsDao"%>
<html>
<head>
    <title>Login Page</title>
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
    <div class="login-container">
        <div class="login-header">
            <h1>Welcome Back</h1>
            <p>Please sign in to your account</p>
        </div>
        
        <form action="login.jsp" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Enter your username" required>
            </div>
            
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
            </div>
            
            <button type="submit" class="login-btn">Login</button>
        </form>
    </div>
    
    <%
        
        	String uname = request.getParameter("username");
            String pword = request.getParameter("password");
                		
            if(uname!=null && pword!=null) {
            	AdminsDao adao = new AdminsDao();
            	
            	boolean isPresent = adao.login(uname, pword);
            	
            	if(isPresent) {
            		HttpSession hs = request.getSession();
            		hs.setAttribute("username", uname);
            		response.sendRedirect("index.jsp");
            	}
            	else {
            		%>
            		<h3 class="clogin">
            		<%
            			out.print("Invalid Username/Password");
            		%>
            		</h3>
            		<%
            	}
            }
        
    %>
</body>
</html>