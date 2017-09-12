package com.shushu.service;

import java.util.List;

import com.shushu.dao.CommentDao;
import com.shushu.domain.Comment;

public class CommentService {

	public void add(Comment comment) {
		// TODO Auto-generated method stub
		CommentDao commentDao = new CommentDao();
		commentDao.add(comment);
	}

	public List<Comment> check(Comment comment) {
		// TODO Auto-generated method stub
		CommentDao commentDao = new CommentDao();
		return commentDao.check(comment);
	}

}
