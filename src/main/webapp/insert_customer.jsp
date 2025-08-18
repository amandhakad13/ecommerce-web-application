<%@page import="model.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.CustomerDao" %>
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
    <title>Insert Customer</title>
    <link rel="stylesheet" href="css/insert_customer.css">
</head>
<body>
    <a href="customer.jsp" class="back-btn">← Back to Customer Management</a>
    
    <div class="insert-container">
        <div class="insert-header">
            <h1>👤➕ Insert Customer</h1>
            <p>Add a new customer to the database</p>
        </div>
        
        <form action="insert_customer.jsp" method="POST">
            <div class="form-group">
                <label for="customerName">Customer Name <span class="required">*</span></label>
                <input type="text" id="customerName" name="customerName" placeholder="Enter full name" required>
            </div>
            
            <div class="form-group">
                <label for="customerEmail">Email Address <span class="required">*</span></label>
                <input type="email" id="customerEmail" name="customerEmail" placeholder="Enter email address" required>
            </div>
            
            <div class="form-group">
                <label for="customerPhone">Phone Number <span class="required">*</span></label>
                <input type="tel" id="customerPhone" name="customerPhone" placeholder="Enter phone number" required>
            </div>
            
            <div class="form-group">
                <label for="customerAddress">Address</label>
                <textarea id="customerAddress" name="customerAddress" placeholder="Enter customer address (optional)"></textarea>
            </div>
            
            <div class="button-group">
                <button type="submit" name="action" value="insert" class="insert-btn">Insert Customer</button>
                <button type="button" class="cancel-btn" onclick="goBack()">Cancel</button>
            </div>
        </form>
    </div>

    <script>
        function goBack() {
            if (confirm('Are you sure? Any unsaved changes will be lost.')) {
                window.location.href = 'customer.jsp';
            }
        }
    </script>
    
    
    <%
    
    	String name = request.getParameter("customerName");
    	String email = request.getParameter("customerEmail");
    	String phone = request.getParameter("customerPhone");
    	String address = request.getParameter("customerAddress");
    	
    	if(name!=null && email!=null && phone!=null && address!=null) {
    		
    		CustomerDao cdao = new CustomerDao();
    		Customer c = new Customer();
    		c.setName(name);
    		c.setEmail(email);
    		c.setPhone(phone);
    		c.setAddress(address);
    		
    		int insert = cdao.insert(c);
    		
    		if(insert>0) {
    			
    			%> <h3><% 
    			
    			out.println("Customer Inserted Successfully");
    			
    			%></h3><%
    		}
    		else {
    			%> <h3> <%
    			out.println("Something Went Wrong");
    			 %> </h3> <%
    		}
    	}
    %>
</body>
</html>