package com.shushu.domain;

public class Article {
	private int id;
	private String title;
	private String userid;
	private String articlepath; // 文章存放位置
	private String addtime; // 文章上传时间
	private int open;// 1-开放 2-个人
	private String username;// 用户姓名
	private String userpath;// 头像地址

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserpath() {
		return userpath;
	}

	public void setUserpath(String userpath) {
		this.userpath = userpath;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getArticlepath() {
		return articlepath;
	}

	public void setArticlepath(String articlepath) {
		this.articlepath = articlepath;
	}

	public String getAddtime() {
		return addtime;
	}

	public void setAddtime(String addtime) {
		this.addtime = addtime;
	}

	public int getOpen() {
		return open;
	}

	public void setOpen(int open) {
		this.open = open;
	}

	@Override
	public String toString() {
		return "Article [id=" + id + ", title=" + title + ", userid=" + userid
				+ ", articlepath=" + articlepath + ", addtime=" + addtime
				+ ", open=" + open + ", username=" + username + ", userpath="
				+ userpath + "]";
	}

}
