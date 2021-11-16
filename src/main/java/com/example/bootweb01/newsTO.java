package com.example.bootweb01;

public class newsTO {
	private String seq;
	private String newstitle;
	private String newscontent;
	private String newswdate;
	private int newsview;
	private String id;
	private String classify;
	private String newsimage;
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getNewstitle() {
		return newstitle;
	}
	public void setNewstitle(String newstitle) {
		this.newstitle = newstitle;
	}
	public String getNewscontent() {
		return newscontent;
	}
	public void setNewscontent(String newscontent) {
		this.newscontent = newscontent;
	}
	public String getNewswdate() {
		return newswdate;
	}
	public void setNewswdate(String newswdate) {
		this.newswdate = newswdate;
	}
	public int getNewsview() {
		return newsview;
	}
	public void setNewsview(int newsview) {
		this.newsview = newsview;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getClassify() {
		return classify;
	}
	public void setClassify(String classify) {
		this.classify = classify;
	}
	public String getNewsimage() {
		return newsimage;
	}
	public void setNewsimage(String newsimage) {
		this.newsimage = newsimage;
	}
}