package com.shushu.web.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.interceptor.annotations.InputConfig;
import com.shushu.domain.Article;
import com.shushu.domain.User;
import com.shushu.service.ArticleService;
import com.shushu.service.UserService;
import com.shushu.utils.FileUtils;

public class ArticleAction extends ActionSupport implements
		ModelDriven<Article> {
	private Article article = new Article();
	private Boolean addflag = false;
	private ArticleService articleService = new ArticleService();
	private String content;
	private Boolean pass;
	private List<Article> articlelsits = new ArrayList<Article>();

	public List<Article> getArticlelsits() {
		return articlelsits;
	}

	public void setArticlelsits(List<Article> articlelsits) {
		this.articlelsits = articlelsits;
	}

	public void setPass(Boolean pass) {
		this.pass = pass;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Boolean getAddflag() {
		return addflag;
	}

	@Override
	public Article getModel() {
		// TODO Auto-generated method stub
		return article;
	}

	/**
	 * 添加新文章
	 * 
	 * @return
	 */
	@InputConfig(resultName = "articleaddINPUT")
	public String articleadd() {
		if (pass) {
			article.setOpen(2);
		} else {
			article.setOpen(1);
		}
		article.setArticlepath(FileUtils.write(content));
		User user = new UserService().findById(article.getUserid());
		article.setUsername(user.getName());
		article.setUserpath(user.getAvatarpath());
		articleService.articleadd(article);
		addflag = true;
		return "articleaddSUCCESS";
	}

	/**
	 * 检测新文章
	 * 
	 * @return
	 */
	public String checknewarticle() {
		articlelsits = articleService.checknewarticle(1);
		return "checknewarticleSUCCESS";
	}

	public String checkmyarticle() {
		articlelsits = articleService.checknewarticle(2);
		return "checkmyarticleSUCCESS";
	}

	/**
	 * 查看详细
	 */
	public String detail() {
		article = articleService.findById(ServletActionContext.getRequest()
				.getParameter("id"));
		content = FileUtils.read(article.getArticlepath());
		ServletActionContext.getRequest().setAttribute("content", content);
		return "detailSUCCESS";
	}

	public String list() {
		return "listSUCCESS";
	}

	public String editview() {
		return "editviewSUCCESS";
	}

	public String myview() {
		return "myviewSUCCESS";
	}
}
