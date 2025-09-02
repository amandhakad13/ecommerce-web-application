package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
	
	public Category search(int id) throws SQLException {
		Connection con = DBConnection.getConnection();
		String query = "select * from category where ca_id = ?";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setInt(1, id);
		ResultSet rs = pstmt.executeQuery();
		Category c = null;
		if(rs.next()) {
			c = new Category();
			
			c.setId(rs.getInt(1));
			c.setName(rs.getString(2));
			c.setDesc(rs.getString(3));
			
		}
		return c;
	}
	
	public ArrayList<Category> viewAllCategory() throws SQLException {
		Connection con = DBConnection.getConnection();
		String query = "select * from category";
		PreparedStatement pstmt = con.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery();
		ArrayList<Category> al = new ArrayList<>();
		while(rs.next()) {
			Category c = new Category();
			
			c.setId(rs.getInt(1));
			c.setName(rs.getString(2));
			c.setDesc(rs.getString(3));
			
			al.add(c);
		}
		
		return al;
	}
	
	public int UpdateById(Category c) throws SQLException {
		Connection con = DBConnection.getConnection();
		String query = "update category set c_name = ?, description = ? where ca_id = ?";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setString(1, c.getName());
		pstmt.setString(2, c.getDesc());
		pstmt.setInt(3, c.getId());
		int update = pstmt.executeUpdate();
		return update;
	}
	
	public int delete(int id) throws SQLException {
		Connection con = DBConnection.getConnection();
		String query = "delete from category where ca_id = ?";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setInt(1, id);
		int delete = pstmt.executeUpdate();
		return delete;
	}
	
}
