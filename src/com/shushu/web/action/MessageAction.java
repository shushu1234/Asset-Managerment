package com.shushu.web.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.shushu.domain.Message;
import com.shushu.domain.User;
import com.shushu.service.MessageService;
import com.shushu.service.UploadFileService;

public class MessageAction extends ActionSupport implements
		ModelDriven<Message> {
	private Message message = new Message();
	private int fileid;
	private Boolean addFlag = false;
	private Boolean pass;
	private String userid;
	private List<Message> newmsgs = new ArrayList<Message>();
	private int sendcount;
	private int unreadcount;
	private int trashcount;

	public int getsendcount() {
		return sendcount;
	}

	public int getUnreadcount() {
		return unreadcount;
	}

	public int getTrashcount() {
		return trashcount;
	}

	public List<Message> getNewmsgs() {
		return newmsgs;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid() {
		this.userid = ((User) ServletActionContext.getRequest().getSession()
				.getAttribute("loginUser")).getId();
	}

	public Boolean getPass() {
		return pass;
	}

	public void setPass(Boolean pass) {
		this.pass = pass;
	}

	public void setFileid(int fileid) {
		this.fileid = fileid;
	}

	public Boolean getAddFlag() {
		return addFlag;
	}

	@Override
	public Message getModel() {
		// TODO Auto-generated method stub
		return message;
	}

	/**
	 * 文件审核通知
	 * 
	 * @return
	 */
	public String messageadd() {
		MessageService messageService = new MessageService();
		addFlag = messageService.add(message);
		UploadFileService uploadFileService = new UploadFileService();
		if (pass) {
			uploadFileService.filepass(fileid);
		} else {
			FileAction fileAction = new FileAction();
			fileAction.delfile(fileid);
		}
		return "messageaddSUCCESS";
	}

	public String useraddmsg() {
		MessageService messageService = new MessageService();
		addFlag = messageService.add(message);
		UploadFileService uploadFileService = new UploadFileService();
		return "useraddmsgSUCCESS";
	}

	/**
	 * 检查未删除新消息
	 */
	public String checknewmsg() {
		this.setUserid();
		MessageService messageService = new MessageService();
		unreadcount = messageService.hasreadcount(1, userid);
		sendcount = messageService.sendcount(1, userid);
		trashcount = messageService.disablecount(2, userid);
		newmsgs = messageService.checknewmsg(userid, 1);
		return "checknewmsgSUCCESS";
	}

	/**
	 * 检查未删除新消息
	 */
	public String checksendmsg() {
		this.setUserid();
		MessageService messageService = new MessageService();
		unreadcount = messageService.hasreadcount(1, userid);
		sendcount = messageService.sendcount(2, userid);
		trashcount = messageService.disablecount(2, userid);
		newmsgs = messageService.checksendmsg(userid, 1);
		return "checksendmsgSUCCESS";
	}

	/**
	 * 检查删除的消息
	 */
	public String checkdelmsg() {
		this.setUserid();
		MessageService messageService = new MessageService();
		unreadcount = messageService.hasreadcount(1, userid);
		sendcount = messageService.sendcount(2, userid);
		trashcount = messageService.disablecount(2, userid);
		newmsgs = messageService.checkdelmsg(userid, 2);
		return "checkdelmsgSUCCESS";
	}

	/**
	 * 查看信息详细
	 */
	public String detail() {
		this.setUserid();
		MessageService messageService = new MessageService();
		message = messageService.findById(message.getId());
		if (!userid.equals(message.getSender())) {
			messageService.updatehasread(message.getId());
		}
		return "detailSUCCESS";
	}

	/**
	 * 删除信息
	 */
	public String delete() {
		this.setUserid();
		MessageService messageService = new MessageService();
		messageService.delete(message.getId(), userid);
		return "deleteSUCCESS";
	}

	public String composeview() {
		String receid = ServletActionContext.getRequest().getParameter("id");
		ServletActionContext.getRequest().setAttribute("id", receid);
		return "composeviewSUCCESS";
	}

	public String list() {
		return "listSUCCESS";
	}

	public String sendview() {
		return "sendviewSUCCESS";
	}

	public String deleteview() {
		return "deleteviewSUCCESS";
	}

	public String inbox() {
		return "inboxSUCCESS";
	}
}
