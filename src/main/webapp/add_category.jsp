<%@page import="dao.CategoryDao"%>
<%@page import="model.Category"%>
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
<title>Add Category</title>
<link rel="stylesheet" href="css/add_category.css">
</head>
<body>
	<div class="container">
		<a href="category.jsp" class="back-link"> ← Back to Categories </a>

		<div class="form-card">
			<h1 class="form-title">🏷️ Add New Category</h1>

			<div id="successMessage" class="success-message">Category added
				successfully!</div>

			<div id="errorMessage" class="error-message">Please fill in all
				required fields.</div>

			<form id="addCategoryForm" action="add_category.jsp" method="post">
				<div class="form-group">
					<label for="categoryName" class="form-label">Category Name
						*</label> <input type="text" id="categoryName" name="categoryName"
						class="form-input" placeholder="Enter category name" required
						maxlength="100">
				</div>

				<div class="form-group">
					<label for="categoryDescription" class="form-label">Category
						Description</label>
					<textarea id="categoryDescription" name="categoryDescription"
						class="form-textarea"
						placeholder="Enter detailed description of the category"
						maxlength="500"></textarea>
				</div>

				<div class="form-actions">
					<button type="button" class="btn btn-secondary"
						onclick="resetForm()">Reset</button>
					<button type="submit" class="btn btn-primary">Add Category</button>
				</div>
			</form>
		</div>
	</div>
	
	<%
	
		String name = request.getParameter("categoryName");
		String desc = request.getParameter("categoryDescription");
							
		if(name!=null && desc!=null) {
			Category c = new Category();
			
			c.setName(name);
			c.setDesc(desc);
			
			CategoryDao cdao = new CategoryDao();
			
			int insert = cdao.insert(c);
			
			if(insert>0) {
				%><h3><% 
        		out.println("Category Added Successfully");
        		%></h3><% 
			}
			else {
				%><h3><% 
        		out.println("Something Went Wrong");
        		%></h3><% 
			}
		}
	
	%>

	<script>
		function resetForm() {
			document.getElementById('addCategoryForm').reset();
			hideMessages();
		}
	</script>
</body>
</html>