package com.shushu.domain;

public class Comment {
	private int id;
	private String content;
	private int fileid;
	private String userid;
	private String avatarpath;
	private String addtime;
	private String username;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getFileid() {
		return fileid;
	}

	public void setFileid(int fileid) {
		this.fileid = fileid;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getAvatarpath() {
		return avatarpath;
	}

	public void setAvatarpath(String avatarpath) {
		this.avatarpath = avatarpath;
	}

	public String getAddtime() {
		return addtime;
	}

	public void setAddtime(String addtime) {
		this.addtime = addtime;
	}

	@Override
	public String toString() {
		return "Comment [id=" + id + ", content=" + content + ", fileid="
				+ fileid + ", userid=" + userid + ", avatarpath=" + avatarpath
				+ ", addtime=" + addtime + ", username=" + username + "]";
	}

}
