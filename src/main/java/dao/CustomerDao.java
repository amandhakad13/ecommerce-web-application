package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connect.DBConnection;
import model.Customer;

public class CustomerDao {
	
	public int insert(Customer c) throws SQLException {
		Connection con = DBConnection.getConnection();
		String query = "insert into customer(name, email, phone, address) values (?,?,?,?)";
		PreparedStatement pstmt =  con.prepareStatement(query);
		pstmt.setString(1, c.getName());
		pstmt.setString(2, c.getEmail());
		pstmt.setString(3, c.getPhone());
		pstmt.setString(4, c.getAddress());
		int insert = pstmt.executeUpdate();
		return insert;
	}
	
	public Customer searchById(int id) throws SQLException {
		Connection con = DBConnection.getConnection();
		String query = "select * from customer where c_id = ?";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setInt(1, id);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			Customer c = new Customer();
			c.setC_id(rs.getInt(1));
			c.setName(rs.getString(2));
			c.setEmail(rs.getString(3));
			c.setPhone(rs.getString(4));
			c.setAddress(rs.getString(5));
			c.setCreated_at(rs.getTimestamp(6));
			return c;
		}
		else {
			return null;
		}
	}
	
	public ArrayList<Customer> displayAll() throws SQLException {
		Connection con = DBConnection.getConnection();
		String query = "select * from customer";
		PreparedStatement pstmt = con.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery();
		ArrayList<Customer> al = new ArrayList<Customer>();
		while(rs.next()) {
			Customer c = new Customer();
			c.setC_id(rs.getInt(1));
			c.setName(rs.getString(2));
			c.setEmail(rs.getString(3));
			c.setPhone(rs.getString(4));
			c.setAddress(rs.getString(5));
			c.setCreated_at(rs.getTimestamp(6));
			al.add(c);
			c = null;
		}
		return al;
	}
	
	public int update(Customer c) throws SQLException {
		Connection con = DBConnection.getConnection();
		String query = "update customer set name = ?, email = ?, phone = ?, address = ? where c_id = ?";
		PreparedStatement pstmt =  con.prepareStatement(query);
		pstmt.setString(1, c.getName());
		pstmt.setString(2, c.getEmail());
		pstmt.setString(3, c.getPhone());
		pstmt.setString(4, c.getAddress());
		pstmt.setInt(5, c.getC_id());
		int update = pstmt.executeUpdate();
		return update;
	}
	
	public int delete(int id) throws SQLException {
		Connection con = DBConnection.getConnection();
		String query = "delete from customer where c_id = ?";
		PreparedStatement pstmt = con.prepareStatement(query);
		int delete = pstmt.executeUpdate();
		return delete;
	}
}
