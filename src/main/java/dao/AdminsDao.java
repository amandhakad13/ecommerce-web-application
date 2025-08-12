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
	
}
