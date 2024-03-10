package com.entity;

public class NoticeDtls {
	private int nid;
	private String ntitle;
	private String ndesc;
	
	
	public NoticeDtls() {
		
		
	}


	public NoticeDtls(String ntitle, String ndesc) {
		super();
		this.ntitle = ntitle;
		this.ndesc = ndesc;
	}


	public int getNid() {
		return nid;
	}


	public void setNid(int nid) {
		this.nid = nid;
	}


	public String getNtitle() {
		return ntitle;
	}


	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}


	public String getnDesc() {
		return ndesc;
	}


	public void setDesc(String ndesc) {
		this.ndesc = ndesc;
	}


	@Override
	public String toString() {
		return "NoticeDtls [nid=" + nid + ", ntitle=" + ntitle + ", ndesc=" + ndesc + "]";
	}

	
	
}
