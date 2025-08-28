<%@page import="model.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.ProductDao"%>
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
<title>Update Product</title>
<link rel="stylesheet" href="css/update_product.css"/>
</head>
<body>
	<a href="product.jsp" class="back-btn">← Back to Product
		Management</a>

	<div class="update-container">
		<div class="update-header">
			<h1>✏️📦 Update Product</h1>
			<p>Search and update product information</p>
		</div>

		<!-- Search Form -->
		<form action="update_product.jsp" method="POST">
			<div class="form-group">
				<label for="productId">Product ID <span class="required">*</span></label>
				<input type="number" id="productId" name="productId"
					placeholder="Enter product ID to search" required>
			</div>
			<div class="button-group">
				<button type="submit" name="action" value="search"
					class="search-btn">Search Product</button>
				<button type="button" class="clear-btn" onclick="clearForms()">Clear</button>
			</div>
		</form>
		
		<%
			
			String sid = request.getParameter("productId");
						
			if(sid!=null) {
				int id = Integer.parseInt(sid);
				
				ProductDao pdao = new ProductDao();
				
				Product p = pdao.search(id);
				
				if(p==null) {
					%><h3><% 
					out.println("Product Not Found");
					%></h3><%
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
					
					<form action="updateProduct" method="POST"
							class="update-form show">
							
							<input type="hidden" name="productId" value="<%= p.getId() %>">

							<div class="form-group">
								<label for="productName">Product Name <span class="required">*</span></label>
								<input type="text" id="productName" name="productName"
									value="<%= p.getName() %>" required>
							</div>

							<div class="form-group">
								<label for="description">Description</label>
								<textarea id="description" name="description" rows="3" required><%= p.getText() %></textarea>
							</div>

							<div class="form-row">
								<div class="form-group">
									<label for="price">Price <span class="required">*</span></label>
									<input type="number" id="price" name="price" step="0.01" min="0"
										value="<%= p.getPrice() %>" required>
								</div>
								<div class="form-group">
									<label for="stock">Stock Quantity <span class="required">*</span></label>
									<input type="number" id="stock" name="stock" min="0"
										value="<%= p.getStock() %>" required>
								</div>
							</div>

							<div class="form-group">
								<label for="category">Category <span class="required">*</span></label>
								<select id="category" name="category" required>
									<option value="<%= categoryId %>"><%= categoryName %></option>
									<option disabled="" >Select From Below</option>
									<option value="1">Electronics</option>
									<option value="2">Clothing</option>
									<option value="3">Books</option>
									<option value="4">Groceries</option>
								</select>
							</div>

							<div class="button-group">
								<button type="submit" name="action" value="update"
									class="update-btn">Update Product</button>
							</div>
						</form>
							
						<%
						
				}
				
			}
			
		 
		%>
		
		
		<!-- Update Form -->
		
		
	</div>

	<script>
		function clearForms() {
			document.getElementById('productId').value = '';
			document.querySelector('.update-form').classList.remove('show');
		}
	</script>
</body>
</html>