<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page import="java.util.List"%>
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
<title>View All Products</title>
<link rel="stylesheet" href="css/view_all_products.css">
</head>
<body>
	<a href="product.jsp" class="back-btn">← Back to Product
		Management</a>

	<div class="view-container">
		<div class="view-header">
			<h1>📊📦 View All Products</h1>
			<p>Complete product inventory overview</p>
		</div>

		<div class="products-container">
			<button class="refresh-btn" onclick="window.location.reload()">🔄
				Refresh</button>
			<div style="clear: both;"></div>

			<div class="products-count">
				Total Products: <strong></strong>
			</div>
			
			<%
			
				ProductDao pdao = new ProductDao();
			
				ArrayList<Product> al = pdao.viewAllProduct();
				
				if(al.isEmpty()) {
					%>
						<div class="no-products">
							📦❌ No products found in the inventory <br>
							<br> 
							<a href="add_product.jsp" style="color: #4CAF50; text-decoration: none; font-weight: 600;">➕Add your first product</a>
						</div>
					<% 
				}
				else {
					%> 
					<table class="products-table">
				<thead>
					<tr>
						<th>ID</th>
						<th>Product Name</th>
						<th>Description</th>
						<th>Price</th>
						<th>Stock</th>
						<th>Category</th>
					</tr>
				</thead>
				<tbody>
				 <%  
				 	for(Product p:al) {
				 		
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
					<tr>
						<td><%= p.getId() %></td>
						<td><%= p.getName() %></td>
						<td><%= p.getText() %></td>
						<td class="price-cell"><%= p.getPrice() %></td>
						<td class="stock-cell"><%= p.getStock() %></td>
						<td><span class="category-badge"><%= categoryName %></span></td>
					</tr>
				 <% } %>
				</tbody>
			</table>
					<% 
				}
				
			%> 

			

			

		</div>
	</div>

	<script>
		// Add loading effect for refresh
		document.querySelector('.refresh-btn').addEventListener('click',
				function() {
					this.innerHTML = '⏳ Refreshing...';
					this.disabled = true;
				});
	</script>
</body>
</html>