package com.shushu.domain;

public class Kind {
	private int id; // 类别id
	private String name; // 类别名称
	private String descr; // 类别描述
	private int parentid; // 父亲id
	private int leaf; // 是否是叶子 1-是 2-不是
	private int grade; // 第几级

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescr() {
		return descr;
	}

	public void setDescr(String descr) {
		this.descr = descr;
	}

	public int getParentid() {
		return parentid;
	}

	public void setParentid(int parentid) {
		this.parentid = parentid;
	}

	public int getLeaf() {
		return leaf;
	}

	public void setLeaf(int leaf) {
		this.leaf = leaf;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	@Override
	public String toString() {
		return "Kind [id=" + id + ", name=" + name + ", descr=" + descr
				+ ", parentid=" + parentid + ", leaf=" + leaf + ", grade="
				+ grade + "]";
	}

}
