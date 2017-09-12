package com.shushu.dao;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.shushu.domain.Article;
import com.shushu.utils.JDBCUtils;

public class ArticleDao {
	private QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());

	public void articleadd(Article article) {
		// TODO Auto-generated method stub
		Date nowDate = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(
				"yyyy-MM-dd HH:dd:ss");
		String nowtime = simpleDateFormat.format(nowDate);
		String sql = "insert into article (title,userid,articlepath,addtime,open,username,userpath) values(?,?,?,?,?,?,?)";
		Object[] params = { article.getTitle(), article.getUserid(),
				article.getArticlepath(), nowtime, article.getOpen(),
				article.getUsername(), article.getUserpath() };
		try {
			queryRunner.update(sql, params);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException();
		}

	}

	public List<Article> checknewarticle(int flag) {
		// TODO Auto-generated method stub
		String sql = "select * from article where open = ? order by id desc";
		try {
			List<Article> articlelist = queryRunner.query(sql,
					new BeanListHandler<Article>(Article.class), flag);
			return articlelist;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException();
		}
	}

	public Article findById(String parameter) {
		// TODO Auto-generated method stub
		String sql = "select * from article where id = ?";
		try {
			Article article = queryRunner.query(sql, new BeanHandler<Article>(
					Article.class), parameter);
			return article;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException();
		}
	}

}
