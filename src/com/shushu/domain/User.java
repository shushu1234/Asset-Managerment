package com.shushu.domain;

public class User {
	private String id; // 学号或工号
	private String name; // 姓名
	private String pwd; // 密码
	private String gender; // 性别
	private String tel; // 电话
	private String email; // 邮箱
	private int role; // 角色 0-普通用户 1-管理员
	private String defunct; // 删除标志 Y-删除 N-未删除
	private String avatarpath;// 头像UUID
	private int kindid;// 类别的父id
	private int state;// 激活状态 1-未激活 2-激活
	private String activecode;// 激活码

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getActivecode() {
		return activecode;
	}

	public void setActivecode(String activecode) {
		this.activecode = activecode;
	}

	public int getKindid() {
		return kindid;
	}

	public void setKindid(int kindid) {
		this.kindid = kindid;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	public String getDefunct() {
		return defunct;
	}

	public void setDefunct(String defunct) {
		this.defunct = defunct;
	}

	public String getAvatarpath() {
		return avatarpath;
	}

	public void setAvatarpath(String avatarpath) {
		this.avatarpath = avatarpath;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", pwd=" + pwd
				+ ", gender=" + gender + ", tel=" + tel + ", email=" + email
				+ ", role=" + role + ", defunct=" + defunct + ", avatarpath="
				+ avatarpath + ", kindid=" + kindid + ", state=" + state
				+ ", activecode=" + activecode + "]";
	}

}
