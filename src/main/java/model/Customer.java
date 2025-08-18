package model;

import java.sql.Timestamp;

public class Customer {
	private int c_id;
	private String name;
	private String email;
	private String phone;
	private String address;
	private Timestamp created_at;
	
	public Customer() {
		
	}
	
	public Customer(int c_id, String name, String email, String phone, String address, Timestamp created_at) {
		super();
		this.c_id = c_id;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.created_at = created_at;
	}

	public int getC_id() {
		return c_id;
	}

	public void setC_id(int c_id) {
		this.c_id = c_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Timestamp getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Timestamp created_at) {
		this.created_at = created_at;
	}

	@Override
	public String toString() {
		return "Customer [c_id=" + c_id + ", name=" + name + ", email=" + email + ", phone=" + phone + ", address="
				+ address + ", created_at=" + created_at + "]";
	}
}
