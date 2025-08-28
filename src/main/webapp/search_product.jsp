<%@page import="dao.ProductDao"%>
<%@page import="model.Product"%>
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
<title>Search Product</title>
<link rel="stylesheet" href="css/search_product.css">
</head>
<body>
	<a href="product.jsp" class="back-btn">← Back to Product
		Management</a>

	<div class="search-container">
		<div class="search-header">
			<h1>🔍📦 Search Product</h1>
			<p>Find product by ID or name</p>
		</div>

		<form action="search_product.jsp" method="POST">
			<div class="form-group">
				<label for="searchType">Search By <span class="required">*</span></label>
				<select id="searchType" name="searchType" required>
					<option value="">Select search type</option>
					<option value="id">Product ID</option>
					<option value="name">Product Name</option>
				</select>
			</div>

			<div class="form-group">
				<label for="searchValue">Search Value <span class="required">*</span></label>
				<input type="text" id="searchValue" name="searchValue"
					placeholder="Enter search value" required>
			</div>

			<div class="button-group">
				<button type="submit" name="action" value="search"
					class="search-btn">Search Product</button>
			</div>
		</form>
		
		<%
			
			String type = request.getParameter("searchType");
			
			if(type!=null) {
				if(type.equalsIgnoreCase("id")) {			
					String id = request.getParameter("searchValue");
					
					if(id!=null) {
						int intId = Integer.parseInt(id);
						
						ProductDao pdao = new ProductDao();
						
						Product p = pdao.search(intId);
						
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
			
							<div class="result-container">
							<div class="result-header">✅ Product Found</div>
							<div class="product-details">
								<div class="detail-item">
									<div class="detail-label">Product ID</div>
									<div class="detail-value"><%= p.getId() %></div>
								</div>
								<div class="detail-item">
									<div class="detail-label">Product Name</div>
									<div class="detail-value"><%= p.getName() %></div>
								</div>
								<div class="detail-item">
									<div class="detail-label">Description</div>
									<div class="detail-value"><%= p.getText() %></div>
								</div>
								<div class="detail-item">
									<div class="detail-label">Price</div>
									<div class="detail-value">$ <%= p.getPrice() %></div>
								</div>
								<div class="detail-item">
									<div class="detail-label">Stock</div>
									<div class="detail-value"><%= p.getStock() %></div>
								</div>
								<div class="detail-item">
									<div class="detail-label">Category</div>
									<div class="detail-value"><%= categoryName %></div>
								</div>
							</div>
						</div>
						<% 
						}
					}
				}
				else {
					out.println("This part under development");
				}
			}
			
		%>
		
		
	</div>
</body>
</html>