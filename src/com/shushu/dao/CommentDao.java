package com.shushu.dao;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.shushu.domain.Comment;
import com.shushu.utils.JDBCUtils;

public class CommentDao {
	private QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());

	public void add(Comment comment) {
		// TODO Auto-generated method stub
		String sql = "insert into comment (content,fileid,userid,username,avatarpath,addtime) values(?,?,?,?,?,?)";
		Date nowDate = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(
				"yyyy-MM-dd HH:dd:ss");
		String nowtime = simpleDateFormat.format(nowDate);
		Object[] params = { comment.getContent(), comment.getFileid(),
				comment.getUserid(), comment.getUsername(),
				comment.getAvatarpath(), nowtime };
		try {
			queryRunner.update(sql, params);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException();
		}
	}

	public List<Comment> check(Comment comment) {
		// TODO Auto-generated method stub
		String sql = "select * from comment where fileid =? order by id desc";
		try {
			List<Comment> comments = queryRunner.query(sql,
					new BeanListHandler<Comment>(Comment.class),
					comment.getFileid());
			return comments;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException();
		}
	}

}
