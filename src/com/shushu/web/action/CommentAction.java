package com.shushu.web.action;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.shushu.domain.Comment;
import com.shushu.domain.User;
import com.shushu.service.CommentService;
import com.shushu.service.UserService;

public class CommentAction extends ActionSupport implements
		ModelDriven<Comment> {
	private Comment comment = new Comment();
	private Boolean addflag = false;
	private List<Comment> commentlist = new ArrayList<Comment>();
	private String file;

	public void setFile(String file) {
		this.file = file;
	}

	public List<Comment> getCommentlist() {
		return commentlist;
	}

	public Boolean getAddflag() {
		return addflag;
	}

	@Override
	public Comment getModel() {
		// TODO Auto-generated method stub
		return comment;
	}

	public String commentadd() {
		CommentService commentService = new CommentService();
		User user = new UserService().findById(comment.getUserid());
		comment.setUsername(user.getName());
		comment.setAvatarpath(user.getAvatarpath());
		comment.setFileid(Integer.parseInt(file));
		commentService.add(comment);
		addflag = true;
		return "commentaddSUCCESS";
	}

	public String checkcomment() {
		CommentService commentService = new CommentService();
		comment.setFileid(Integer.parseInt(file));
		commentlist = commentService.check(comment);
		return "checkcommentSUCCESS";
	}
}
