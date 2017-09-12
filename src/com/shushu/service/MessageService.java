package com.shushu.service;

import java.util.List;

import com.shushu.dao.MessageDao;
import com.shushu.domain.Message;

public class MessageService {

	public Boolean add(Message message) {
		// TODO Auto-generated method stub
		MessageDao messageDao = new MessageDao();
		return messageDao.add(message);
	}

	/**
	 * 收件箱
	 * 
	 * @param userid
	 * @param flag
	 * @return
	 */
	public List<Message> checknewmsg(String userid, int flag) {
		// TODO Auto-generated method stub
		MessageDao messageDao = new MessageDao();
		return messageDao.checknewmsg(userid, flag);
	}

	/**
	 * 垃圾箱
	 * 
	 * @param userid
	 * @param flag
	 * @return
	 */
	public List<Message> checkdelmsg(String userid, int flag) {
		// TODO Auto-generated method stub
		MessageDao messageDao = new MessageDao();
		return messageDao.checkdelmsg(userid, flag);
	}

	/**
	 * 已发送
	 * 
	 * @param userid
	 * @param flag
	 * @return
	 */
	public List<Message> checksendmsg(String userid, int flag) {
		// TODO Auto-generated method stub
		MessageDao messageDao = new MessageDao();
		return messageDao.checksendmsg(userid, flag);
	}

	public Message findById(int id) {
		MessageDao messageDao = new MessageDao();
		return messageDao.findById(id);
	}

	public void updatehasread(int id) {
		// TODO Auto-generated method stub
		MessageDao messageDao = new MessageDao();
		messageDao.updatehasread(id);
	}

	public int hasreadcount(int flag, String userid) {
		MessageDao messageDao = new MessageDao();
		return messageDao.hasreadcount(flag, userid);
	}

	public int disablecount(int flag, String userid) {
		MessageDao messageDao = new MessageDao();
		return messageDao.disablecount(flag, userid);
	}

	public int sendcount(int flag, String userid) {
		MessageDao messageDao = new MessageDao();
		return messageDao.sendcount(flag, userid);
	}

	public void delete(int id, String userid) {
		// TODO Auto-generated method stub
		MessageDao messageDao = new MessageDao();
		messageDao.delete(id, userid);
	}
}
