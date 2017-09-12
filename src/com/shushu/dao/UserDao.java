package com.shushu.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.shushu.domain.User;
import com.shushu.utils.JDBCUtils;

public class UserDao {
	private QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());

	/**
	 * 登录查询
	 */
	public User checkPwd(User user) {
		String sql;
		Object[] param;
		if (user.getEmail() == null) {
			sql = "select * from user where id = ? and pwd = ?";
			Object[] parmas = { user.getId(), user.getPwd() };
			param = parmas;
		} else {
			sql = "select * from user where email = ? and pwd = ?";
			Object[] parmas = { user.getEmail(), user.getPwd() };
			param = parmas;
		}
		try {
			User loginUser = queryRunner.query(sql, new BeanHandler<User>(
					User.class), param);
			return loginUser;
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	/**
	 * 用户注册
	 */
	public void regist(User user) {
		String sql = "insert into user(id,name,pwd,gender,tel,email,role,defunct,avatarpath,activecode) values(?,?,?,?,?,?,?,?,?,?)";
		Object[] params = { user.getId(), user.getName(), user.getPwd(),
				user.getGender(), user.getTel(), user.getEmail(), 0, "N",
				user.getAvatarpath(), user.getActivecode() };
		try {
			queryRunner.update(sql, params);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException();
		}
	}

	public List<User> findByCondition(User user) {
		// 根据用户id，姓名，性别，电话，邮箱，状态组合查询
		String sql = "select * from user where 1=1 ";
		List<String> params = new ArrayList<String>();// 参数列表
		if (user.getId() != null && user.getId().trim().length() > 0) {
			sql += " and id like ?";
			params.add("%" + user.getId() + "%");
		}
		if (user.getName() != null && user.getName().trim().length() > 0) {
			sql += " and name like ?";
			params.add("%" + user.getName() + "%");
		}
		if (user.getTel() != null && user.getTel().trim().length() > 0) {
			sql += " and tel = ?";
			params.add(user.getTel());
		}
		if (user.getEmail() != null && user.getEmail().trim().length() > 0) {
			sql += " and email = ?";
			params.add(user.getEmail());
		}
		if (user.getGender() != null && user.getGender().trim().length() > 0) {
			sql += " and gender = ?";
			params.add(user.getGender());
		}
		if (user.getDefunct() != null && user.getDefunct().trim().length() > 0) {
			sql += " and defunct = ?";
			params.add(user.getDefunct());
		}
		try {
			List<User> users = queryRunner.query(sql,
					new BeanListHandler<User>(User.class), params.toArray());
			return users;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException();
		}

	}

	public void delete(User user) {
		String sql = "delete from user where id = ?";
		try {
			queryRunner.update(sql, user.getId());
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException();
		}

	}

	public User findById(String id) {
		String sql = "select * from user where id = ?";
		try {
			User user = queryRunner.query(sql,
					new BeanHandler<User>(User.class), id);
			return user;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException();
		}
	}

	public void update(User user, boolean isEditUpload) {
		if (isEditUpload) {
			// 上传了头像
			String sql = "update user set name = ?, gender = ?, tel = ?, email = ?, avatarpath = ? where id = ?";
			Object[] params = { user.getName(), user.getGender(),
					user.getTel(), user.getEmail(), user.getAvatarpath(),
					user.getId() };
			String sql1 = "update article set userpath = ? where userid = ?";
			String sql2 = "update comment set avatarpath = ? where userid = ?";
			String sql3 = "update message set senderpath = ? where sender = ?";
			try {
				queryRunner.update(sql, params);
				queryRunner.update(sql1, user.getAvatarpath(), user.getId());
				queryRunner.update(sql2, user.getAvatarpath(), user.getId());
				queryRunner.update(sql3, user.getAvatarpath(), user.getId());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				throw new RuntimeException();
			}
		} else {
			// 没有上传头像
			String sql = "update user set name = ?,pwd=?, gender = ?, tel = ?, email = ?, state= ?,activecode=? ,role=? where id = ?";
			Object[] params = { user.getName(), user.getPwd(),
					user.getGender(), user.getTel(), user.getEmail(),
					user.getState(), user.getActivecode(), user.getRole(),
					user.getId() };
			try {
				queryRunner.update(sql, params);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				throw new RuntimeException();
			}
		}
	}

	public boolean checkid(String userid) {
		String sql = "select * from user where id = ?";
		try {
			User user = queryRunner.query(sql,
					new BeanHandler<User>(User.class), userid);
			if (user == null) {
				return false;
			} else {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException();
		}
	}

	public User findByCode(String code) {
		// TODO Auto-generated method stub
		String sql = "select * from user where activecode = ?";
		try {
			User user = queryRunner.query(sql,
					new BeanHandler<User>(User.class), code);
			return user;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException();
		}
	}

	public boolean checkemail(String useremail) {
		String sql = "select * from user where email = ?";
		try {
			User user = queryRunner.query(sql,
					new BeanHandler<User>(User.class), useremail);
			if (user == null) {
				return false;
			} else {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException();
		}
	}

}
