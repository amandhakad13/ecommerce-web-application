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
    <title>Delete Customer</title>
    <link rel="stylesheet" href="css/delete_customer.css"/>
</head>
<body>
	<a href="customer.jsp" class="back-btn0">← Back to Customer Management</a>

    <div class="delete-container">
        <div class="delete-header">
            <h1>🗑️ Delete Customer</h1>
            <p>Search and remove customer from database</p>
        </div>
        
        <form action="delete_customer.jsp" method="POST">
            <!-- Search Section -->
            <div class="search-section">
                <div class="section-title">🔍 Find Customer</div>
                <div class="form-group">
                    <label for="customerId">Customer ID</label>
                    <input type="number" id="customerId" name="customerId" placeholder="Enter customer ID to search" required value="${customer.id}">
                </div>
                <button type="submit" name="action" value="searchForDelete" class="search-btn">Search Customer</button>
            </div>
         </form>
            
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
            			<form action="deleteCustomer" method="post">
	            			<div class="info-section">
		                        <div class="section-title">⚠️ Customer Information</div>
		                        
		                        <div class="info-grid">
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
		                            <div class="info-item">
		                                <div class="info-label">Address</div>
		                                <div class="info-value"><%= c.getAddress() %></div>
		                            </div>
		                            <input type="text" name="cid" hidden value="<%= c.getC_id() %>">
		                        </div>
		                        
		                        <div class="button-group">
		                            <button type="submit" name="action" class="delete-btn">🗑️ Delete Customer</button>
		                            <button type="button" class="cancel-btn" onclick="goBack()">Cancel</button>
		                        </div>
	                    	</div>
                    	</form>
                    <%
            		}
            	}
            
            %>
            
    </div>

    <script>
        function deleteCustomer() {
            window.location.href="deleteCustomer";
        }
        
        function goBack() {
            window.location.href = 'customer.jsp';
        }
    </script>
</body>
</html>