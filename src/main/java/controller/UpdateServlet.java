package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Customer;

import java.io.IOException;
import java.sql.SQLException;

import dao.CustomerDao;

/**
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/updatecustomer")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String strid = request.getParameter("customerId");
		int id = Integer.parseInt(strid);
		String name = request.getParameter("customerName");
		String email = request.getParameter("customerEmail");
		String phone = request.getParameter("customerPhone");
		String address = request.getParameter("customerAddress");
		
		CustomerDao cdao = new CustomerDao();
		
		Customer c = new Customer();
		c.setC_id(id);
		c.setName(name);
		c.setEmail(email);
		c.setPhone(phone);
		c.setAddress(address);
		
		
		try {
			int update = cdao.update(c);
			if(update>0) {
				RequestDispatcher rs = request.getRequestDispatcher("update_customer.jsp");
				rs.forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
