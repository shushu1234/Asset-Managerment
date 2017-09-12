package com.shushu.service;

import java.util.List;

import com.shushu.dao.ArticleDao;
import com.shushu.domain.Article;

public class ArticleService {

	public void articleadd(Article article) {
		// TODO Auto-generated method stub
		ArticleDao articleDao = new ArticleDao();
		articleDao.articleadd(article);
	}

	public List<Article> checknewarticle(int flag) {
		// TODO Auto-generated method stub
		ArticleDao articleDao = new ArticleDao();
		return articleDao.checknewarticle(flag);
	}

	public Article findById(String parameter) {
		// TODO Auto-generated method stub
		ArticleDao articleDao = new ArticleDao();
		return articleDao.findById(parameter);
	}

}
