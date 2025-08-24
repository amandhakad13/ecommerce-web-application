package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
}
