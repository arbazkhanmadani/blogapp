package com.tech.blog.entities;

public class Comment {

	private int comId;
	private String comment;
	private int uid;
	private int poid;
	
	public Comment() {
	}
	
	public Comment(int comId, String comment, int uid, int poid) {
		super();
		this.comId = comId;
		this.comment = comment;
		this.uid = uid;
		this.poid = poid;
	}
	public int getComId() {
		return comId;
	}
	public void setComId(int comId) {
		this.comId = comId;
	}
	@Override
	public String toString() {
		return "Comment [comId=" + comId + ", comment=" + comment + ", uid=" + uid + ", poid=" + poid + "]";
	}

	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getPoid() {
		return poid;
	}
	public void setPoid(int poid) {
		this.poid = poid;
	}
	
}
