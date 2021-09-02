package com.example.bootweb01;

public class ServiceTO {
	private String seq;
	private String id;			//문의id
	private String adate;		//문의날짜
	private String asktitle;	//문의제목
	private String askcontent;	//문의내용
	private String replyid;		//답변id
	private String rdate;		//답변날짜
	private String replytitle;	//답변제목
	private String replycontent;//답변내용
	private String deleornot;	//삭제여부

	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAdate() {
		return adate;
	}
	public void setAdate(String adate) {
		this.adate = adate;
	}
	public String getAsktitle() {
		return asktitle;
	}
	public void setAsktitle(String asktitle) {
		this.asktitle = asktitle;
	}
	public String getAskcontent() {
		return askcontent;
	}
	public void setAskcontent(String askcontent) {
		this.askcontent = askcontent;
	}
	public String getReplyid() {
		return replyid;
	}
	public void setReplyid(String replyid) {
		this.replyid = replyid;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public String getReplytitle() {
		return replytitle;
	}
	public void setReplytitle(String replytitle) {
		this.replytitle = replytitle;
	}
	public String getReplycontent() {
		return replycontent;
	}
	public void setReplycontent(String replycontent) {
		this.replycontent = replycontent;
	}
	public String getDeleornot() {
		return deleornot;
	}
	public void setDeleornot(String deleornot) {
		this.deleornot = deleornot;
	}
	
	
}
