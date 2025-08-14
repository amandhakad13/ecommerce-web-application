package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import connect.DBConnection;

public class AdminsDao {
	
	public boolean login(String uname, String pword) throws SQLException {
		
		Connection con = DBConnection.getConnection();
		String query = "select * from admins where username = ? and password = ?";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setString(1, uname);
		pstmt.setString(2, pword);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			return true;
		}
		else {
			return false;
		}
	}
	
	public int register(String uname, String pword) throws SQLException {
		Connection con = DBConnection.getConnection();
		String query = "insert into admins(username, password) values(?, ?)";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setString(1, uname);
		pstmt.setString(2, pword);
		int insert = pstmt.executeUpdate();
		return insert;
	}
	
	public boolean edit_user(String uname, String c_pword) throws SQLException {
		Connection con = DBConnection.getConnection();
		String query = "select * from admins where username = ? and password = ?";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setString(1, uname);
		pstmt.setString(2, c_pword);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			return true;
		}
		else {
			return false;
		}
	}
	
	public int updateUser(String n_name,String n_pword, String uname, String c_pword) throws SQLException {
		Connection con = DBConnection.getConnection();
		String query = "update admins set username = ?, password = ? where username = ?";
		PreparedStatement pstmt = con.prepareStatement(query);
		if(n_name==null || n_name.trim().isEmpty()) {
			pstmt.setString(1, uname);
		}
		else {
			pstmt.setString(1, n_name);
		}
		if(n_pword==null || n_pword.trim().isEmpty()) {
			pstmt.setString(2, c_pword);
		}
		else {
			pstmt.setString(2, n_pword);
		}
		pstmt.setString(3, uname);
		int insert = pstmt.executeUpdate();
		return insert;
	}
	
}
