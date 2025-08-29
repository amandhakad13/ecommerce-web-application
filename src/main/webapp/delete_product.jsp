<%@page import="model.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.ProductDao"%>
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
<title>Delete Product</title>
<link rel="stylesheet" href="css/delete_product.css">
</head>
<body>
	<a href="product.jsp" class="back-btn">← Back to Product
		Management</a>

	<div class="delete-container">
		<div class="delete-header">
			<h1>🗑️📦 Delete Product</h1>
			<p>Search and remove product from inventory</p>
		</div>

		<!-- Search Form -->
		<form action="delete_product.jsp" method="POST">
			<div class="form-group">
				<label for="productId">Product ID <span class="required">*</span></label>
				<input type="number" id="productId" name="productId"
					placeholder="Enter product ID to delete" required>
			</div>
			<div class="button-group">
				<button type="submit" name="action" value="search"
					class="search-btn">Search Product</button>
			</div>
		</form>
		
		<%
		
			String sId = request.getParameter("productId");
						
			if(sId!=null) {
				int id = Integer.parseInt(sId);
				
				ProductDao pdao = new ProductDao();
				
				Product p = pdao.search(id);
				
				if(p==null) {
					%>
	    				<h3>
	    			<% 
	    			out.println("Product Not Found");
	    			%>
	    				</h3>
	    			<%
				}
				else {
					
					int categoryId = p.getCaId();
					String categoryName = null;
					if(categoryId==1) {
						categoryName = "Electronics";
					}
					else if(categoryId == 2) {
						categoryName = "Clothing";
					}
					else if(categoryId == 3) {
						categoryName = "Books";
					}
					else {
						categoryName = "Groceries";
					}
					
					%>
					<div class="product-info">
						<div class="info-header">⚠️ Product to be Deleted</div>
						<div class="info-row">
							<div class="info-item">
								<div class="info-label">Product ID</div>
								<div class="info-value"><%= p.getId() %></div>
							</div>
							<div class="info-item">
								<div class="info-label">Product Name</div>
								<div class="info-value"><%= p.getName() %></div>
							</div>
						</div>
						<div class="info-row">
							<div class="info-item">
								<div class="info-label">Price</div>
								<div class="info-value"><%= p.getPrice() %></div>
							</div>
							<div class="info-item">
								<div class="info-label">Stock</div>
								<div class="info-value"><%= p.getStock() %></div>
							</div>
						</div>
						<div class="info-item">
							<div class="info-label">Category</div>
							<div class="info-value"><%= categoryName %></div>
						</div>
					</div>

					<form action="deleteProduct" method="POST">
						<input type="hidden" name="productId" value="<%= p.getId() %>">
						<div class="button-group">
							<button type="submit" name="action" value=""
								class="delete-btn" onclick="return confirmDelete()">🗑️
								Confirm Delete</button>
							<button type="button" class="cancel-btn"
								onclick="window.location.href='product.jsp'">❌ Cancel</button>
						</div>
					</form>
				<%
				}
			}
		
		%>

		<!-- Product Information -->
		

	</div>

	<script>
		function confirmDelete() {
			return confirm('Are you absolutely sure you want to delete this product?\n\nThis action cannot be undone!');
		}
	</script>
</body>
</html>