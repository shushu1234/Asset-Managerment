package com.shushu.dao;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.shushu.domain.Message;
import com.shushu.utils.JDBCUtils;

public class MessageDao {
	private QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());

	/**
	 * 文件审核信息
	 * 
	 * @param message
	 */
	public Boolean add(Message message) {
		// TODO Auto-generated method stub
		String sql = "insert into message (title,content,sender,receiver,sendtime,sendername,receivername,senderpath) values(?,?,?,?,?,?,?,?)";
		Date nowDate = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(
				"yyyy-MM-dd HH:dd:ss");
		String nowtime = simpleDateFormat.format(nowDate);
		UserDao userDao = new UserDao();
		String sendername = userDao.findById(message.getSender()).getName();
		String recivername = userDao.findById(message.getReceiver()).getName();
		String senderpath = userDao.findById(message.getSender())
				.getAvatarpath();
		Object[] params = { message.getTitle(), message.getContent(),
				message.getSender(), message.getReceiver(), nowtime,
				sendername, recivername, senderpath };
		try {
			queryRunner.update(sql, params);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException();
		}
	}

	public List<Message> checknewmsg(String userid, int flag) {
		// TODO Auto-generated method stub
		String sql = "select * from message where receiver = ?  and receiverdisable = ? order by id desc";
		try {
			List<Message> newmsg = queryRunner.query(sql,
					new BeanListHandler<Message>(Message.class), userid, flag);
			return newmsg;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException();
		}
	}

	public List<Message> checkdelmsg(String userid, int flag) {
		// TODO Auto-generated method stub
		String sql = "select * from message where (receiver = ? or sender = ?) and (receiverdisable = ? or senderdisable = ?) order by id desc";
		try {
			List<Message> newmsg = queryRunner.query(sql,
					new BeanListHandler<Message>(Message.class), userid,
					userid, flag, flag);
			return newmsg;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException();
		}
	}

	public List<Message> checksendmsg(String userid, int flag) {
		// TODO Auto-generated method stub
		String sql = "select * from message where sender = ? and senderdisable = ? order by id desc";
		try {
			List<Message> newmsg = queryRunner.query(sql,
					new BeanListHandler<Message>(Message.class), userid, flag);
			return newmsg;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException();
		}
	}

	/**
	 * 根据id查找
	 * 
	 * @param id
	 * @return
	 */
	public Message findById(int id) {
		// TODO Auto-generated method stub
		String sql = "select * from message where id = ?";
		try {
			Message message = queryRunner.query(sql, new BeanHandler<Message>(
					Message.class), id);
			return message;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException();
		}
	}

	/**
	 * 设置信息已读
	 */

	public void updatehasread(int id) {
		String sql = "update  message set hasread = ? where id = ?";
		try {
			queryRunner.update(sql, 2, id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException();
		}
	}

	/**
	 * 检测读与未读信息数量
	 * 
	 * @param flag
	 * @param userid
	 * @return
	 */
	public int hasreadcount(int flag, String userid) {
		String sql = "select count(*) from message where hasread = ? and receiver = ? and receiverdisable = ?";
		try {
			int count = queryRunner.query(sql, new ResultSetHandler<Integer>() {
				@Override
				public Integer handle(java.sql.ResultSet rs)
						throws SQLException {
					if (rs.next()) {
						return rs.getInt(1); // 或者rs.getLong("count");
					}
					return 0;
				}
			}, flag, userid, 1);
			return count;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException();
		}
	}

	/**
	 * 检测已删除的数量
	 * 
	 * @param flag
	 * @param userid
	 * @return
	 */
	public int disablecount(int flag, String userid) {
		String sql = "select count(*) from message where (receiver = ? or sender = ?) and (receiverdisable = ? or senderdisable = ?) ";
		try {
			int count = queryRunner.query(sql, new ResultSetHandler<Integer>() {
				@Override
				public Integer handle(java.sql.ResultSet rs)
						throws SQLException {
					if (rs.next()) {
						return rs.getInt(1); // 或者rs.getLong("count");
					}
					return 0;
				}
			}, userid, userid, flag, flag);
			return count;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException();
		}
	}

	public int sendcount(int flag, String userid) {
		String sql = "select count(*) from message where sender = ? and senderdisable = ?";
		try {
			int count = queryRunner.query(sql, new ResultSetHandler<Integer>() {
				@Override
				public Integer handle(java.sql.ResultSet rs)
						throws SQLException {
					if (rs.next()) {
						return rs.getInt(1); // 或者rs.getLong("count");
					}
					return 0;
				}
			}, userid, flag);
			return count;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException();
		}
	}

	public void delete(int id, String userid) {
		// TODO Auto-generated method stub
		Message message = this.findById(id);
		String sql = "";
		if (message.getSender().equals(userid)) {
			sql = "update message set senderdisable = 2 where id = ?";
		} else {
			sql = "update message set receiverdisable = 2 where id = ?";
		}
		try {
			queryRunner.update(sql, id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException();
		}
	}

}
