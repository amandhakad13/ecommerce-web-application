<%@page import="model.Category"%>
<%@page import="dao.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%
HttpSession hs = request.getSession(false);
String uname = (String) hs.getAttribute("username");
if (hs.getAttribute("username") == null || hs == null) {
response.sendRedirect("login.jsp");
}
%>


<head>
<title>Search Category</title>
<link rel="stylesheet" href="css/search_category.css">
</head>
<body>
	<div class="container">
		<a href="category.jsp" class="back-link"> ← Back to Categories </a>

		<div class="form-card">
			<h1 class="form-title">🔍 Search Category</h1>

			<form id="searchForm" action="search_category.jsp" method="post">
				<div class="form-group">
					<label for="categoryId" class="form-label">Category ID *</label> <input
						type="number" id="categoryId" name="categoryId" class="form-input"
						placeholder="Enter category ID" required min="1">
				</div>

				<button type="submit" class="btn btn-search">Search
					Category</button>
			</form>
			
			<%
			
				String sid = request.getParameter("categoryId");
				
				if(sid!=null) {
					int id = Integer.parseInt(sid);
					
					CategoryDao cdao = new CategoryDao();
					
					Category c = cdao.search(id);
					
					if(c==null) {
						%> 
							<div id="noResult" class="no-result">❌ No category found with this ID. Please check and try again.</div>
						<%
					}
					else {
						%>
							<div id="resultCard" class="result-card">
								<div class="result-title">📋 Category Details</div>
								<div class="result-item">
									<span class="result-label">Category ID:</span> <span
										class="result-value" id="displayId"><%= c.getId() %></span>
								</div>
								<div class="result-item">
									<span class="result-label">Category Name:</span> <span
										class="result-value" id="displayName"><%= c.getName() %></span>
								</div>
								<div class="result-item">
									<span class="result-label">Description:</span> <span
										class="result-value" id="displayDescription"><%= c.getDesc() %></span>
								</div>
							</div>
						<% 
					}
				}
			%>

		</div>
	</div>
</body>
</html>