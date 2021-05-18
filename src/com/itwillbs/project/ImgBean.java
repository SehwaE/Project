package com.itwillbs.project;

public class ImgBean {
	private int num;
	private String id;
	private String pass;
	private String subject;
	private String msg;
	private String filename;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	@Override
	public String toString() {
		return "ImgBean [num=" + num + ", id=" + id + ", pass=" + pass + ", subject=" + subject + ", msg=" + msg
				+ ", filename=" + filename + "]";
	}

	
	
	
	
	
	
}