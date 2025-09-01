<%@page import="dao.ProductDao"%>
<%@page import="model.Product"%>
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
    <title>Add Product</title>
    <link rel="stylesheet" href="css/add_product.css">
</head>
<body>
    <a href="product.jsp" class="back-btn">← Back to Product Management</a>

    <div class="insert-container">
        <div class="insert-header">
            <h1>📦➕ Add Product</h1>
            <p>Add a new product to the inventory</p>
        </div>

        <form action="add_product.jsp" method="POST">
            <div class="form-group">
                <label for="productName">Product Name <span class="required">*</span></label>
                <input type="text" id="productName" name="productName" placeholder="Enter product name" required>
            </div>

            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" rows="4" placeholder="Enter product description" required></textarea>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="price">Price <span class="required">*</span></label>
                    <input type="number" id="price" name="price" step="0.01" min="0" placeholder="0.00" required>
                </div>
                <div class="form-group">
                    <label for="stock">Stock Quantity <span class="required">*</span></label>
                    <input type="number" id="stock" name="stock" min="0" placeholder="Enter stock quantity" required>
                </div>
            </div>

            <div class="form-group">
                <label for="category">Category <span class="required">*</span></label>
                <select id="category" name="category" required>
                    <option value="0">Select a category</option>
                    <option value="1">Electronics</option>
                    <option value="2">Clothing</option>
                    <option value="3">Books</option>
                    <option value="4">Groceries</option>
                </select>
            </div>

            <div class="button-group">
                <button type="submit" name="action" value="insert" class="insert-btn">Add Product</button>
                <button type="button" class="cancel-btn" onclick="goBack()">Cancel</button>
            </div>
        </form>
    </div>
    
    <%
    	String name = request.getParameter("productName");
        String desc = request.getParameter("description");
        String price = request.getParameter("price");
        String stock = request.getParameter("stock");
        String category = request.getParameter("category");
        
        if(name!=null && desc!=null && price!=null && stock!=null && category!=null) {
        	float fprice = Float.parseFloat(price);
        	int istock = Integer.parseInt(stock);
        	int icategory = Integer.parseInt(category);
        	
        	ProductDao pdao = new ProductDao();
        	
        	Product p = new Product();
        	p.setName(name);
        	p.setText(desc);
        	p.setPrice(fprice);
        	p.setStock(istock);
        	p.setCaId(icategory);
        	
        	int insert = pdao.insert(p);
        	
        	if(insert>0) {
        		%><h3><% 
        		out.println("Product Added Successfully");
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
        function goBack() {
            if (confirm('Are you sure? Any unsaved changes will be lost.')) {
                window.location.href = 'product.jsp';
            }
        }
    </script>
</body>
</html>