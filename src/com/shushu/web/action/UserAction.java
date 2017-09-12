package com.shushu.web.action;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.apache.log4j.MDC;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.interceptor.annotations.InputConfig;
import com.opensymphony.xwork2.util.ValueStack;
import com.shushu.domain.User;
import com.shushu.service.UserService;
import com.shushu.utils.MailTemplate;
import com.shushu.utils.MailUtils;
import com.shushu.utils.RandomUtils;

/**
 * 用户Action
 */

public class UserAction extends ActionSupport implements ModelDriven<User> {
	private User user = new User();
	private File upload;
	private String uploadContentType;
	private String uploadFileName;
	private List<User> users;
	private boolean isExist;
	private String userid;
	private String useremail;
	private UserService userService = new UserService();
	private Logger log = Logger.getLogger(UserAction.class);
	private Boolean setadmin = false;

	public Boolean getSetadmin() {
		return setadmin;
	}

	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}

	public boolean getIsExist() {
		return isExist;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public List<User> getUsers() {
		return users;
	}

	@Override
	public User getModel() {
		return user;
	}

	public String index() {
		return "indexSUCCESS";
	}

	/**
	 * 用户登录
	 * 
	 * @return
	 */
	@InputConfig(resultName = "loginINPUT")
	public String login() {
		// 登录数据在user中，传递业务层，查询
		String info = ServletActionContext.getRequest().getParameter("info");
		// System.out.println(info);
		if (info.indexOf(".") != -1) {
			user.setEmail(info);
		} else {
			user.setId(info);
		}
		User loginUser = userService.login(user);
		// 判断是否登录成功
		if (loginUser == null) {
			this.addActionError(this.getText("pwdfail"));
			return "loginINPUT";
		} else if (loginUser.getState() == 1) {
			// 登录失败
			this.addActionError(this.getText("loginfail"));
			return "loginINPUT";
		} else if (loginUser.getDefunct().equals("Y")) {
			this.addActionError(this.getText("userfail"));
			return "loginINPUT";
		} else {
			// 登录成功
			// System.out.println(loginUser.toString());
			MDC.put("userid", loginUser.getId());
			log.info(loginUser.getId() + "登录");
			ValueStack valueStack = ActionContext.getContext().getValueStack();
			ServletActionContext.getRequest().getSession()
					.setAttribute("loginUser", loginUser);
			valueStack.set("op", "login");
			return "loginSUCCESS";
		}
	}

	/**
	 * 注册用户
	 * 
	 * @return
	 * @throws IOException
	 */
	@InputConfig(resultName = "registINPUT")
	public String regist() throws IOException {
		// System.out.println(user.toString());
		// 上传头像
		String testid = String.valueOf(new RandomUtils().getRandomNum(10000000,
				99999999));
		while (userService.checkid(testid)) {
			testid = String.valueOf(new RandomUtils().getRandomNum(10000000,
					99999999));
		}
		user.setId(testid);
		if (upload != null) {
			String avatarName = UUID.randomUUID().toString();
			String path = "user/avatars/" + avatarName + "."
					+ uploadFileName.split("\\.")[1];
			File destFile = new File(ServletActionContext.getServletContext()
					.getRealPath(path));
			FileUtils.copyFile(upload, destFile);
			user.setAvatarpath(path);
		} else {
			user.setAvatarpath("user/avatars/f4d5575a-d5aa-4cdd-9898-fcd6aee28c2f.png");
		}
		// System.out.println(user.toString());
		String activecode = UUID.randomUUID().toString().replace("-", "")
				+ UUID.randomUUID().toString().replace("-", "");
		user.setActivecode(activecode);
		String emailcontent = MailTemplate.registtmp(user.getName(),
				user.getActivecode());
		MailUtils.sendMail(user.getEmail(), "Fileware用户注册确认", emailcontent);
		log.info(user.getId() + "注册");
		userService.regist(user);
		ValueStack valueStack = ActionContext.getContext().getValueStack();
		valueStack.set("userRole", user.getRole());
		ServletActionContext.getRequest().getSession()
				.setAttribute("loginUser", user);
		return "registSUCCESS";
	}

	/**
	 * 用户注销
	 */

	public String logout() {
		log.info(userid + "注销");
		ServletActionContext.getRequest().getSession().invalidate();
		return "logoutSUCCESS";
	}

	/**
	 * 用户列表查询
	 * 
	 * @return
	 */
	public String list() {
		// 获得查询结果,放到值栈里面
		// System.out.println(user.toString());
		User user1 = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("loginUser");
		if (user1.getRole() == 0) {
			user.setDefunct("N");
			users = userService.list(user);
		} else {
			users = userService.list(user);
		}
		log.info(user1.getId() + "查询用户");
		return "listSUCCESS";
	}

	/**
	 * 用户删除
	 * 
	 * @return
	 */
	public String delete() {
		// 删除头像
		user = userService.findById(user.getId());
		if (!user.getAvatarpath().equals(
				"user/avatars/f4d5575a-d5aa-4cdd-9898-fcd6aee28c2f.png")) {
			File file = new File(ServletActionContext.getServletContext()
					.getRealPath(user.getAvatarpath()));
			file.delete();
		}
		userService.delete(user);
		return "deleteSUCCESS";
	}

	/**
	 * 查看用户详细信息
	 * 
	 * @return
	 */
	public String view() {
		// id已经自动封装到了model对象
		user = userService.findById(user.getId());
		ValueStack valueStack = ActionContext.getContext().getValueStack();
		valueStack.set("op", "view");
		return "viewSUCCESS";
	}

	/**
	 * 修改用户信息前查看数据
	 * 
	 * @return
	 */
	public String editview() {
		user = userService.findById(user.getId());
		return "editviewSUCCESS";
	}

	/**
	 * 修改用户信息
	 * 
	 * @return
	 * @throws IOException
	 */
	@InputConfig(resultName = "editINPUT")
	public String edit() throws IOException {
		user.setPwd(userService.findById(user.getId()).getPwd());
		if (upload == null) {
			// 用户没有上传新头像
			// System.out.println("not " + user.toString());
			userService.edit(user, false);
		} else {
			// 用户上传了新头像
			// 1.上传新头像
			String avatarName = UUID.randomUUID().toString();
			String path = "user/avatars/" + avatarName + "."
					+ uploadFileName.split("\\.")[1];
			File destFile = new File(ServletActionContext.getServletContext()
					.getRealPath(path));
			FileUtils.copyFile(upload, destFile);
			user.setAvatarpath(path);
			// 2.删除旧头像
			User oldUser = userService.findById(user.getId());
			if (!oldUser.getAvatarpath().equals(
					"user/avatars/f4d5575a-d5aa-4cdd-9898-fcd6aee28c2f.png")) {
				File oldFile = new File(ServletActionContext
						.getServletContext().getRealPath(
								oldUser.getAvatarpath()));
				oldFile.delete();
			}
			// System.out.println("yes " + user.toString());
			log.info(user.getId() + "修改个人信息");
			userService.edit(user, true);
		}
		return "editSUCCESS";
	}

	/**
	 * 检查用户是否存在
	 * 
	 * @return
	 */
	public String checkid() {
		// System.out.println(userid);
		isExist = userService.checkid(userid);
		return "checkidSUCCESS";
	}

	/**
	 * 用户邮箱激活
	 */
	public String active() {
		String code = ServletActionContext.getRequest().getParameter("code");
		user = userService.findByCode(code);
		if (user == null) {
			this.addActionError("该激活码不存在或已经激活，请检查:(");
		} else {
			user.setState(2);
			user.setActivecode(null);
			log.info(user.getId() + "用户激活");
			this.addActionError("恭喜你，激活成功:)");
			userService.edit(user, false);
		}
		// System.out.println(code);
		return "activeSUCCESS";
	}

	/**
	 * 检测邮箱
	 */
	public String checkemail() {
		isExist = userService.checkemail(useremail);
		return "checkemailSUCCESS";
	}

	/**
	 * 重置密码
	 */
	public String recover() {
		System.out.println(user.getEmail());
		String testpwd = user.getPwd();
		if (user.getEmail() != null) {
			List<User> users = userService.list(user);
			user = users.get(0);
			String emailcontent = MailTemplate.resetpwdtmp(user.getName(),
					user.getId());
			MailUtils.sendMail(user.getEmail(), "Fileware用户密码重置", emailcontent);
			return "recoveremailSUCCESS";
		} else if (user.getPwd() != null) {
			user = userService.findById(user.getId());
			user.setPwd(testpwd);
			log.info(user.getId() + "重置密码");
			userService.edit(user, false);
			return "logoutSUCCESS";
		} else {
			user.setId(ServletActionContext.getRequest().getParameter("id"));
			System.out.println(user.getId());
			user = userService.findById(user.getId());
			return "recoverSUCCESS";
		}
	}

	public String setadmin() {
		user = userService.findById(userid);
		user.setRole(1);
		userService.edit(user, false);
		setadmin = true;
		return "setadminSUCCESS";
	}

	public String recoversend() {
		return "recoversendSUCCESS";
	}
}
