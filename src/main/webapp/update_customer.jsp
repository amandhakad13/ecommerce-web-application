<%@page import="model.Customer"%>
<%@page import="dao.CustomerDao"%>
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
    <title>Update Customer</title>
    <link rel="stylesheet" href="css/update_customer.css"/>
    <style>
        
    </style>
</head>
<body>
    <a href="customer.jsp" class="back-btn">← Back to Customer Management</a>
    
    <div class="update-container">
        <div class="update-header">
            <h1>✏️ Update Customer</h1>
            <p>Search and modify customer information</p>
        </div>
        
        <!-- Search Section -->
        <div class="search-section">
            <div class="section-title">🔍 Search Customer</div>
            <form action="update_customer.jsp" method="GET">
                <div class="form-group">
                    <label for="searchId">Customer ID</label>
                    <input type="number" id="searchId" name="customerId" placeholder="Enter customer ID to search" required>
                </div>
                <button type="submit" name="action" value="searchForUpdate" class="search-btn">Search Customer</button>
            </form>
        </div>
       
       	<%
		
       		String strid = request.getParameter("customerId");
        	if(strid!=null) {            		
        		int id = Integer.parseInt(strid);
        		
        		CustomerDao cdao = new CustomerDao();
        		
        		Customer c = cdao.searchById(id);
        		
        		if(c==null) {
        			%>
        				<h3>
        			<% 
        			out.println("Record Not Found");
        			%>
        				</h3>
        			<%
        		}
        		else {
        			%>
        			<div class="update-section">
                    <div class="section-title">📝 Update Information</div>
                    <form action="updatecustomer" method="POST">
                        <input type="hidden" name="customerId" value="<%= c.getC_id() %>">
                        
                        <div class="form-group">
                            <label for="customerName">Customer Name</label>
                            <input type="text" id="customerName" name="customerName" placeholder="Enter new customer name" value="<%= c.getName() %>">
                        </div>
                        
                        <div class="form-group">
                            <label for="customerEmail">Email Address</label>
                            <input type="email" id="customerEmail" name="customerEmail" placeholder="Enter new email address" value="<%= c.getEmail() %>">
                        </div>
                        
                        <div class="form-group">
                            <label for="customerPhone">Phone Number</label>
                            <input type="tel" id="customerPhone" name="customerPhone" placeholder="Enter new phone number" value="<%= c.getPhone() %>">
                        </div>
                        
                        <div class="form-group">
                            <label for="customerAddress">Address</label>
                            <textarea id="customerAddress" name="customerAddress" placeholder="Enter new address"><%= c.getAddress() %></textarea>
                        </div>
                        
                        <div class="button-group">
                            <button type="submit" name="action" value="update" class="update-btn">Update Customer</button>
                            <button type="button" class="cancel-btn" onclick="goBack()">Cancel</button>
                        </div>
                    </form>
                </div>
                <%
        		}
        	}
           
       	%>
       
        <!-- Update Section -->
        
    </div>

    <script>
        function goBack() {
            if (confirm('Are you sure? Any unsaved changes will be lost.')) {
                window.location.href = 'customer.jsp';
            }
        }
    </script>
</body>
</html>
