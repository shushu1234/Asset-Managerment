package com.shushu.domain;

public class UploadFile {
	private int id; // 文件id 自增
	private String name; // 文件名
	private int kindid; // 类别id
	private String kind;
	private String remark; // 文件备注
	private long filesize; // 文件大小
	private String authorname1; // 第一作者
	private String authorname2; // 第二作者
	private String authorname3; // 第三作者
	private String authorname4; // 第四作者
	private String authorname5; // 第五作者
	private int open; // 是否开放下载 2：开放 1：不开放 默认不开放
	private String userid; // 上传用户id
	private String uploaddate; // 上传时间
	private String filepath; // 文件对象的路径
	private int downcount;// 下载次数
	private int privatefile;// 私人文件 1-公开 2-私人

	public UploadFile(int id, String name, int kindid, String kind,
			String remark, long filesize, String authorname1,
			String authorname2, String authorname3, String authorname4,
			String authorname5, int open, String userid, String uploaddate,
			String filepath, int downcount) {
		super();
		this.id = id;
		this.name = name;
		this.kindid = kindid;
		this.kind = kind;
		this.remark = remark;
		this.filesize = filesize;
		this.authorname1 = authorname1;
		this.authorname2 = authorname2;
		this.authorname3 = authorname3;
		this.authorname4 = authorname4;
		this.authorname5 = authorname5;
		this.open = open;
		this.userid = userid;
		this.uploaddate = uploaddate;
		this.filepath = filepath;
		this.downcount = downcount;
	}

	public int getPrivatefile() {
		return privatefile;
	}

	public void setPrivatefile(int privatefile) {
		this.privatefile = privatefile;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public int getDowncount() {
		return downcount;
	}

	public void setDowncount(int downcount) {
		this.downcount = downcount;
	}

	public UploadFile() {
		super();
	}

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

	public int getKindid() {
		return kindid;
	}

	public void setKindid(int kindid) {
		this.kindid = kindid;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public long getFilesize() {
		return filesize;
	}

	public void setFilesize(long filesize) {
		this.filesize = filesize;
	}

	public String getAuthorname1() {
		return authorname1;
	}

	public void setAuthorname1(String authorname1) {
		this.authorname1 = authorname1;
	}

	public String getAuthorname2() {
		return authorname2;
	}

	public void setAuthorname2(String authorname2) {
		this.authorname2 = authorname2;
	}

	public String getAuthorname3() {
		return authorname3;
	}

	public void setAuthorname3(String authorname3) {
		this.authorname3 = authorname3;
	}

	public String getAuthorname4() {
		return authorname4;
	}

	public void setAuthorname4(String authorname4) {
		this.authorname4 = authorname4;
	}

	public String getAuthorname5() {
		return authorname5;
	}

	public void setAuthorname5(String authorname5) {
		this.authorname5 = authorname5;
	}

	public int getOpen() {
		return open;
	}

	public void setOpen(int open) {
		this.open = open;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUploaddate() {
		return uploaddate;
	}

	public void setUploaddate(String uploaddate) {
		this.uploaddate = uploaddate;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	@Override
	public String toString() {
		return "UploadFile [id=" + id + ", name=" + name + ", kindid=" + kindid
				+ ", kind=" + kind + ", remark=" + remark + ", filesize="
				+ filesize + ", authorname1=" + authorname1 + ", authorname2="
				+ authorname2 + ", authorname3=" + authorname3
				+ ", authorname4=" + authorname4 + ", authorname5="
				+ authorname5 + ", open=" + open + ", userid=" + userid
				+ ", uploaddate=" + uploaddate + ", filepath=" + filepath
				+ ", downcount=" + downcount + ", privatefile=" + privatefile
				+ "]";
	}

}
