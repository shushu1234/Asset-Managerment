package com.shushu.web.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.interceptor.annotations.InputConfig;
import com.shushu.domain.UploadFile;
import com.shushu.domain.User;
import com.shushu.service.UploadFileService;
import com.sun.mail.util.BASE64EncoderStream;

public class FileAction extends ActionSupport implements
		ModelDriven<UploadFile> {
	private UploadFile uploadFile = new UploadFile();
	private File upload;
	private String uploadContentType;
	private String uploadFileName;
	private List<UploadFile> uploadFiles;
	private InputStream inputStream;
	private String queryuserid;
	private List<UploadFile> userfiles = new ArrayList<UploadFile>();
	private List<UploadFile> topfiles;
	private Logger log = Logger.getLogger(FileAction.class);
	private String loginuserid;

	public String getLoginuserid() {
		return loginuserid;
	}

	public void setLoginuserid(String loginuserid) {
		this.loginuserid = ((User) ServletActionContext.getRequest()
				.getSession().getAttribute("loginUser")).getId();
	}

	public List<UploadFile> getTopfiles() {
		return topfiles;
	}

	public List<UploadFile> getUserfiles() {
		return userfiles;
	}

	public void setQueryuserid(String queryuserid) {
		this.queryuserid = queryuserid;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
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

	public List<UploadFile> getUploadFiles() {
		return uploadFiles;
	}

	public void setUploadFiles(List<UploadFile> uploadFiles) {
		this.uploadFiles = uploadFiles;
	}

	@Override
	public UploadFile getModel() {
		// TODO Auto-generated method stub
		return uploadFile;
	}

	/**
	 * 文件上传
	 * 
	 * @return
	 * @throws IOException
	 */
	@InputConfig(resultName = "uploadINPUT")
	public String upload() throws IOException {
		UploadFileService uploadFileService = new UploadFileService();
		if (upload != null) {
			String fileName = UUID.randomUUID().toString();
			// System.out.println(uploadFileName);
			// System.out.println(uploadFileName.replace(" ", "-"));
			if (uploadFileName.indexOf(".") == -1) {
				this.addActionError("该文件的扩展名不符合要求");
				return "uploadINPUT";
			}
			String filepath = "/upload/" + fileName + "."
					+ uploadFileName.split("\\.")[1];
			File destFile = new File(ServletActionContext.getServletContext()
					.getRealPath(filepath));
			FileUtils.copyFile(upload, destFile);
			uploadFile.setFilepath(filepath);
			// System.out.println(upload.length());
			uploadFile.setFilesize(upload.length());
			uploadFile.setName(uploadFileName.replace(" ", "-"));
		}
		log.info(uploadFile.getUserid() + "上传文件" + uploadFile.getName()
				+ " 文件路径为" + uploadFile.getFilepath());
		uploadFileService.upload(uploadFile);
		return "uploadSUCCESS";
	}

	/**
	 * 文件查询
	 * 
	 * @return
	 */
	public String list() {
		UploadFileService uploadFileService = new UploadFileService();
		User user = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("loginUser");
		if (user.getRole() == 1) {
			uploadFiles = uploadFileService.list(uploadFile);
		} else {
			// uploadFile.setUserid(user.getId());
			uploadFile.setPrivatefile(1);
			uploadFile.setOpen(2);
			uploadFiles = uploadFileService.list(uploadFile);
		}
		return "listSUCCESS";
	}

	/**
	 * 文件下载
	 */
	public String download() {
		UploadFileService uploadFileService = new UploadFileService();
		uploadFile = uploadFileService.findById(uploadFile.getId());
		log.info(loginuserid + "下载文件" + uploadFile.getName());
		return "downloadSUCCESS";
	}

	/**
	 * 返回文件流
	 * 
	 * @return
	 * @throws FileNotFoundException
	 */
	public InputStream getInputStream() throws FileNotFoundException {
		// 为了避免在使用debug是出错
		if (uploadFile == null || uploadFile.getFilepath() == null) {
			return null;
		}
		File file = new File(ServletActionContext.getServletContext()
				.getRealPath(uploadFile.getFilepath()));
		UploadFileService uploadFileService = new UploadFileService();
		// 下载次数加一
		uploadFileService.addDowncount(uploadFile.getId(),
				uploadFile.getDowncount());
		InputStream inputStream = new FileInputStream(file);
		if (inputStream == null) {
			this.addActionError("申请下载错误，请稍后再试，或联系管理员...");
		}
		System.out.println(inputStream);
		return inputStream;
	}

	/**
	 * 返回文件的MIME类型
	 * 
	 * @return
	 */
	public String getContentType() {
		if (uploadFile == null || uploadFile.getName() == null) {
			return null;
		}
		return ServletActionContext.getServletContext().getMimeType(
				uploadFile.getName());
	}

	/**
	 * 返回编码后的文件名
	 * 
	 * @return
	 * @throws IOException
	 */
	public String getDownloadFilename() throws IOException {
		if (uploadFile == null || uploadFile.getName() == null) {
			return null;
		}
		return encodeDownloadFilename(uploadFile.getName(),
				ServletActionContext.getRequest().getHeader("user-agent"));
	}

	/**
	 * 下载文件时，针对不同的浏览器，进行附件名编码
	 * 
	 * @param filename
	 *            下载文件名
	 * @param agent
	 *            客户端浏览器
	 * @return
	 * @throws IOException
	 */
	public String encodeDownloadFilename(String filename, String agent)
			throws IOException {
		if (agent.contains("Firefox")) {
			filename = "=?UTF-8?B?"
					+ BASE64EncoderStream.encode(filename.getBytes("utf-8"))
					+ "?=";
		} else {
			filename = URLEncoder.encode(filename, "utf-8");
		}
		return filename;
	}

	public InputStream getImageStream() throws FileNotFoundException {
		if (uploadFile == null || uploadFile.getFilepath() == null) {
			return null;
		}
		File file = new File(ServletActionContext.getServletContext()
				.getRealPath(uploadFile.getFilepath()));
		UploadFileService uploadFileService = new UploadFileService();
		// 下载次数加一
		uploadFileService.addDowncount(uploadFile.getId(),
				uploadFile.getDowncount());
		return new FileInputStream(file);
	}

	/**
	 * 文件修改前查看
	 * 
	 * @return
	 */
	public String editview() {
		UploadFileService uploadFileService = new UploadFileService();
		uploadFile = uploadFileService.findById(uploadFile.getId());
		return "editviewSUCCESS";
	}

	/**
	 * 文件修改
	 * 
	 * @return
	 */
	public String edit() {
		UploadFileService uploadFileService = new UploadFileService();
		uploadFileService.edit(uploadFile);
		log.info(loginuserid + "修改文件" + uploadFile.getName());
		return "editSUCCESS";
	}

	/**
	 * 文件删除
	 * 
	 * @return
	 */
	public String delete() {
		UploadFileService uploadFileService = new UploadFileService();
		uploadFile = uploadFileService.findById(uploadFile.getId());
		if (uploadFile.getFilepath() != null) {
			File file = new File(ServletActionContext.getServletContext()
					.getRealPath(uploadFile.getFilepath()));
			file.delete();
		}
		uploadFileService.delete(uploadFile.getId());
		log.info(loginuserid + "删除文件" + uploadFile.getName());
		return "deleteSUCCESS";
	}

	/**
	 * 文件审核不通过时删除
	 * 
	 * @param fileid
	 */
	public void delfile(int fileid) {
		uploadFile.setId(fileid);
		this.delete();
	}

	/**
	 * 文件详情查询
	 * 
	 * @return
	 */
	public String detail() {
		UploadFileService uploadFileService = new UploadFileService();
		uploadFile = uploadFileService.findById(uploadFile.getId());
		return "detailSUCCESS";
	}

	/**
	 * 单个用户上传的文件情况
	 */
	public String listuserfiles() {
		// System.out.println("file" + queryuserid);
		UploadFileService uploadFileService = new UploadFileService();
		userfiles = uploadFileService.listuserfiles(queryuserid);
		return "listuserfilesSUCCESS";
	}

	/**
	 * 取出前三个
	 */

	public String topfile() {
		UploadFileService uploadFileService = new UploadFileService();
		topfiles = uploadFileService.topfiles();
		return "topfileSUCCESS";
	}

	public String uploadview() {
		return "uploadviewSUCCESS";
	}
}
