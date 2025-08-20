<%@page import="model.Customer"%>
<%@page import="dao.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Search Customer</title>
    <link rel="stylesheet" href="css/search_by_id_customer.css">
</head>
<body>
	<a href="customer.jsp" class="back-btn0">← Back to Customer Management</a>

    <div class="search-container">
        <div class="search-header">
            <h1>🔍 Search Customer</h1>
            <p>Find customer information by ID</p>
        </div>
        
        <form action="search_by_id_customer.jsp" method="post">
            <!-- Search Section -->
            <div class="search-section">
                <div class="section-title">🔍 Enter Customer ID</div>
                <div class="form-group">
                    <label for="customerId">Customer ID</label>
                    <input type="number" id="customerId" name="customerId" placeholder="Enter customer ID to search" required value="${searchId}">
                </div>
                <button type="submit" name="action" value="search" class="search-btn">Search Customer</button>
            </div>
            
          <%
          
          	String idstr = request.getParameter("customerId");
          	
          	if(idstr!=null) {
          		int id = Integer.parseInt(idstr);
          		
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
          			<div class="result-section">
                    <div class="section-title">📋 Customer Details</div>
                    
                        <div class="info-grid">
                            <div class="info-item">
                                <div class="info-label">Customer ID</div>
                                <div class="info-value"><%= c.getC_id() %></div>
                            </div>
                            <div class="info-item">
                                <div class="info-label">Name</div>
                                <div class="info-value"><%= c.getName() %></div>
                            </div>
                            <div class="info-item">
                                <div class="info-label">Email</div>
                                <div class="info-value"><%= c.getEmail() %></div>
                            </div>
                            <div class="info-item">
                                <div class="info-label">Phone</div>
                                <div class="info-value"><%= c.getPhone() %></div>
                            </div>
                            <div class="info-item" style="grid-column: 1 / -1;">
                                <div class="info-label">Address</div>
                                <div class="info-value"><%= c.getAddress() %></div>
                            </div>
                        </div>
                        
                        <div class="action-buttons">
                            <a href="customer.jsp" class="back-btn">← Back to Management</a>
                        </div>
                </div>
                <%
          		}
          	
          	}
          	
          	
          %>
            
            <!-- Results Section -->
            
        </form>
    </div>

    <script>
        function editCustomer() {
            window.location.href = 'update_customer.jsp';
        }
    </script>
</body>
</html>