package com.shushu.domain;

public class Message {
	private int id; // 信息id
	private String title; // 标题
	private String content;// 内容
	private String sender;// 发送人id
	private String receiver;// 接收认id
	private String sendtime;// 发送时间
	private int senderdisable;// 发送认删除标志 1 未删除 2删除
	private int receiverdisable;// 接收认删除标志
	private int hasread;// 接收人阅读标志 1未阅读 2 阅读
	private int parentid;// 父级id
	private int level;// 消息级别 默认0
	private String sendername;// 发送人姓名
	private String receivername;// 接收人姓名
	private String senderpath;// 发件人头像地址

	public Message(int id, String title, String content, String sender,
			String receiver, String sendtime, int senderdisable,
			int receiverdisable, int hasread, int parentid, int level,
			String sendername, String receivername, String senderpath) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.sender = sender;
		this.receiver = receiver;
		this.sendtime = sendtime;
		this.senderdisable = senderdisable;
		this.receiverdisable = receiverdisable;
		this.hasread = hasread;
		this.parentid = parentid;
		this.level = level;
		this.sendername = sendername;
		this.receivername = receivername;
		this.senderpath = senderpath;
	}

	public Message() {
		super();
		// TODO Auto-generated constructor stub
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getSendtime() {
		return sendtime;
	}

	public void setSendtime(String sendtime) {
		this.sendtime = sendtime;
	}

	public int getSenderdisable() {
		return senderdisable;
	}

	public void setSenderdisable(int senderdisable) {
		this.senderdisable = senderdisable;
	}

	public int getReceiverdisable() {
		return receiverdisable;
	}

	public void setReceiverdisable(int receiverdisable) {
		this.receiverdisable = receiverdisable;
	}

	public int getHasread() {
		return hasread;
	}

	public void setHasread(int hasread) {
		this.hasread = hasread;
	}

	public int getParentid() {
		return parentid;
	}

	public void setParentid(int parentid) {
		this.parentid = parentid;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public String getSendername() {
		return sendername;
	}

	public void setSendername(String sendername) {
		this.sendername = sendername;
	}

	public String getReceivername() {
		return receivername;
	}

	public void setReceivername(String receivername) {
		this.receivername = receivername;
	}

	public String getSenderpath() {
		return senderpath;
	}

	public void setSenderpath(String senderpath) {
		this.senderpath = senderpath;
	}

	@Override
	public String toString() {
		return "Message [id=" + id + ", title=" + title + ", content="
				+ content + ", sender=" + sender + ", receiver=" + receiver
				+ ", sendtime=" + sendtime + ", senderdisable=" + senderdisable
				+ ", receiverdisable=" + receiverdisable + ", hasread="
				+ hasread + ", parentid=" + parentid + ", level=" + level
				+ ", sendername=" + sendername + ", receivername="
				+ receivername + ", senderpath=" + senderpath + "]";
	}

}
