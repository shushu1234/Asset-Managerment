package com.shushu.service;

import java.util.List;

import com.shushu.dao.UserDao;
import com.shushu.domain.User;

public class UserService {
	private UserDao userDao = new UserDao();

	/**
	 * 登录
	 * 
	 * @param user
	 * @return
	 */
	public User login(User user) {
		return userDao.checkPwd(user);
	}

	public void regist(User user) {
		userDao.regist(user);
	}

	/**
	 * 根据输入条件查询用户
	 * 
	 * @return
	 */
	public List<User> list(User user) {
		UserDao userDao = new UserDao();
		return userDao.findByCondition(user);
	}

	/**
	 * 删除用户
	 * 
	 * @param user
	 */
	public void delete(User user) {
		UserDao userDao = new UserDao();
		userDao.delete(user);
	}

	public User findById(String id) {
		UserDao userDao = new UserDao();
		User user = userDao.findById(id);
		return user;
	}

	/**
	 * 修改用户信息
	 * 
	 * @param user
	 *            用户信息
	 * @param isEditUpload
	 *            是否修改头像
	 */
	public void edit(User user, boolean isEditUpload) {
		UserDao userDao = new UserDao();
		userDao.update(user, isEditUpload);
	}

	/**
	 * 检查用户id是否存在
	 * 
	 * @param userid
	 * @return
	 */
	public boolean checkid(String userid) {
		UserDao userDao = new UserDao();
		return userDao.checkid(userid);
	}

	public User findByCode(String code) {
		// TODO Auto-generated method stub
		UserDao userDao = new UserDao();
		return userDao.findByCode(code);
	}

	public boolean checkemail(String useremail) {
		UserDao userDao = new UserDao();
		return userDao.checkemail(useremail);
	}
}
