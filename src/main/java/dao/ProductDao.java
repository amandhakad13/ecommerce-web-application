package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connect.DBConnection;
import model.Product;

public class ProductDao {
	
	public int insert(Product p) throws SQLException {
		Connection con = DBConnection.getConnection();
		String query = "insert into product(p_name, description, price, stock, ca_id) values (?,?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setString(1, p.getName());
		pstmt.setString(2, p.getText());
		pstmt.setFloat(3, p.getPrice());
		pstmt.setInt(4, p.getStock());
		pstmt.setInt(5, p.getCaId());
		
		int insert = pstmt.executeUpdate();
		return insert;
	}
	
	public Product search(int id) throws SQLException {
		Connection con = DBConnection.getConnection();
		String query = "select * from product where p_id = ?";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setInt(1, id);
		ResultSet rs = pstmt.executeQuery();
		Product p = null;
		if(rs.next()) {
			p = new Product();
			p.setId(rs.getInt(1));
			p.setName(rs.getString(2));
			p.setText(rs.getString(3));
			p.setPrice(rs.getFloat(4));
			p.setStock(rs.getInt(5));
			p.setCaId(rs.getInt(6));
			
		}
		return p;
	}
	
	public ArrayList<Product> viewAllProduct() throws SQLException {
		Connection con = DBConnection.getConnection();
		String query = "select * from product";
		PreparedStatement pstmt = con.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery();
		ArrayList<Product> al = new ArrayList<>();
		while(rs.next()) {
			Product p = new Product();
			
			p.setId(rs.getInt(1));
			p.setName(rs.getString(2));
			p.setText(rs.getString(3));
			p.setPrice(rs.getFloat(4));
			p.setStock(rs.getInt(5));
			p.setCaId(rs.getInt(6));
			
			al.add(p);
		}
		
		return al;
	}
}
