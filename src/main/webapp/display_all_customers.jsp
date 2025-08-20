<%@page import="model.Customer"%>
<%@page import="dao.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>

<%

	HttpSession hs = request.getSession(false);
	if(hs.getAttribute("username")==null || hs==null) {
		response.sendRedirect("login.jsp");
	}

%>

<head>
    <title>All Customers</title>
    <link rel="stylesheet" href="css/display_all_customers.css"/>
</head>
<body>
    <div class="display-container">
        <div class="display-header">
            <h1>📋 All Customers</h1>
            <p>Complete list of customers in the database</p>
        </div>
        
        <div class="controls">
            <a href="customer.jsp" class="back-btn">← Back to Customer Management</a>
        </div>
        
        <div class="customer-table">
            <div class="table-header">
                <div>ID</div>
                <div>Name</div>
                <div>Email</div>
                <div>Phone</div>
                <div>Address</div>
            </div>
            
            <%
            	CustomerDao cdao = new CustomerDao();
            
            	ArrayList<Customer> al = cdao.displayAll();
           		
            	for(Customer c : al) {
           	%>
                <div class="customer-row">
                    <div><%= c.getC_id() %></div>
                    <div><%= c.getName() %></div>
                    <div><%= c.getEmail() %></div>
                    <div><%= c.getPhone() %></div>
                    <div><%= c.getAddress() %></div>
                </div>
            <%
            	}
            %>
        </div>
    </div>

    <script>
        
        function editCustomer() {
            window.location.href = 'update_customer.jsp';
        }
        
        function deleteCustomer() {
                window.location.href = 'delete_customer.jsp';
            }
        }
    </script>
</body>
</html>