package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import dao.ProductDao;

/**
 * Servlet implementation class UpdateProductServlet
 */
@WebServlet("/updateProduct")
public class UpdateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		
		
		
		String name = request.getParameter("productName");
		String desc = request.getParameter("description");
		String price = request.getParameter("price");
		String stock = request.getParameter("stock");
		String ca_id = request.getParameter("category");
		String p_id = request.getParameter("productId");
		
		if(name!=null && desc!=null && price!=null && stock!=null && ca_id!=null && p_id!=null) {
			
			ProductDao pdao = new ProductDao();
			
			Product p = new Product();
			
			float fPrice = Float.parseFloat(price);
			int iStock = Integer.parseInt(stock);
			int iCaId = Integer.parseInt(ca_id);
			int proId = Integer.parseInt(p_id);
			
			p.setId(proId);
			p.setName(name);
			p.setText(desc);
			p.setPrice(fPrice);
			p.setStock(iStock);
			p.setCaId(iCaId);
			
			try {
				int update = pdao.UpdateById(p);
				
				if(update>0) {
					response.sendRedirect("update_product.jsp");
				}
				else {
					out.println("Something Went Wrong");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}

}
