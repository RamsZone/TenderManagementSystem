package com.entity;

public class Tender_Order {
	
	private int id;
	private String orderid;
	
	private String crnno;
	private String email;
	private String phno;
	private String fullorder;
	private String tendername;
	private String price;
	private String deadline;
	private String message;
	private String vendorname;
	private String status;
	
	public String getVendorname() {
		return vendorname;
	}
	public void setVendorname(String vendorname) {
		this.vendorname = vendorname;
	}
	public String getTendername() {
		return tendername;
	}
	public void setTendername(String tendername) {
		this.tendername = tendername;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getDeadline() {
		return deadline;
	}
	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	public Tender_Order() {
		super();
		
			
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhno() {
		return phno;
	}
	public void setPhno(String phno) {
		this.phno = phno;
	}
	public String getFullorder() {
		return fullorder;
	}
	public void setFullorder(String fullorder) {
		this.fullorder = fullorder;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	@Override
	public String toString() {
		return "Tender_Order [id=" + id + ", email=" + email + ", phno=" + phno
				+ ", fullorder=" + fullorder + ", status=" + status + "]";
	}
	public String getCrnno() {
		return crnno;
	}
	public void setCrnno(String crnno) {
		this.crnno = crnno;
	}
	
	
	
	

}
