package com.entity;

public class Tenderdtls {
	private int tenderid;
	private String tendername;
	private String tendertype;
	private String baseprice;
	private String deadline;
	private String location;
	private String description;
	private String status;
	private String message;

	public Tenderdtls() {

	}

	public Tenderdtls(String tendername, String tendertype, String baseprice, String deadline, String location,
			String description ,String status, String message) {
		super();
		this.tendername = tendername;
		this.tendertype = tendertype;
		this.baseprice = baseprice;
		this.deadline = deadline;
		this.location = location;
		this.description = description;
		this.status=status;
		this.message=message;
	}

	public int getTenderid() {
		return tenderid;
	}

	public void setTenderid(int tenderid) {
		this.tenderid = tenderid;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getTendername() {
		return tendername;
	}

	public void setTendername(String tendername) {
		this.tendername = tendername;
	}

	public String getTendertype() {
		return tendertype;
	}

	public void setTendertype(String tendertype) {
		this.tendertype = tendertype;
	}

	public String getBaseprice() {
		return baseprice;
	}

	public void setBaseprice(String baseprice) {
		this.baseprice = baseprice;
	}

	public String getDeadline() {
		return deadline;
	}

	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "Tenderdtls [tenderid=" + tenderid + ", tendername=" + tendername + ", tendertype=" + tendertype
				+ ", baseprice=" + baseprice + ", deadline=" + deadline + ", location=" + location + ", description="
				+ description + ", status=" + status + ", message=" + message + "]";
	}

}
