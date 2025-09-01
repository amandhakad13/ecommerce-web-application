package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import connect.DBConnection;
import model.Category;

public class CategoryDao {
	
	public int insert(Category c) throws SQLException {
		Connection con = DBConnection.getConnection();
		String query = "insert into category(ca_name, description) values (?,?)";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setString(1, c.getName());
		pstmt.setString(2, c.getDesc());
		int insert = pstmt.executeUpdate();
		return insert;
	}
	
}
