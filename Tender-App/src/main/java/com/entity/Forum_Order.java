package com.entity;

public class Forum_Order {
	
	private int id;
	private String forumid;
	private String vfcrnno;
	private String vfemail;
	private String vfphno;
	private String tname;
	//private String ftitle;
	private String fquestion;
	private String vfname;
	private String status;
	
	
	public Forum_Order() {
		super();
		
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getVfcrnno() {
		return vfcrnno;
	}


	public void setVfcrnno(String vfcrnno) {
		this.vfcrnno = vfcrnno;
	}


	public String getVfemail() {
		return vfemail;
	}


	public void setVfemail(String vfemail) {
		this.vfemail = vfemail;
	}


	public String getVfphno() {
		return vfphno;
	}


	public void setVfphno(String vfphno) {
		this.vfphno = vfphno;
	}


	public String getTname() {
		return tname;
	}


	public void setTname(String tname) {
		this.tname = tname;
	}


//	public String getFtitle() {
//		return ftitle;
//	}
//
//
//	public void setFtitle(String ftitle) {
//		this.ftitle = ftitle;
//	}


	public String getFquestion() {
		return fquestion;
	}


	public void setFquestion(String fquestion) {
		this.fquestion = fquestion;
	}


	public String getVfname() {
		return vfname;
	}


	public void setVfname(String vfname) {
		this.vfname = vfname;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "Forum_Order [id=" + id + ", vfcrnno=" + vfcrnno + ", vfemail=" + vfemail + ", vfphno=" + vfphno
				+ ", tname=" + tname + ", fquestion=" + fquestion + ", vfname=" + vfname
				+ ", status=" + status + "]";
	}


	public String getForumid() {
		return forumid;
	}


	public void setForumid(String forumid) {
		this.forumid = forumid;
	}
	
	
	
	

}
