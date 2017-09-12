package com.shushu.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.shushu.domain.Kind;
import com.shushu.utils.JDBCUtils;

public class KindDao {
	private QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());

	/**
	 * 存储分类
	 * 
	 * @param kind
	 */
	public void add(Kind kind) {
		// TODO Auto-generated method stub
		String sql = "insert into kind (name,descr,parentid) values(?,?,?)";
		Object[] params = { kind.getName(), kind.getDescr(), kind.getParentid() };
		try {
			queryRunner.update(sql, params);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException();
		}
	}

	/**
	 * 插入子分类
	 * 
	 * @param kind
	 */
	public void addChildKind(Kind kind) {
		Kind parentKind = new Kind();
		parentKind = this.findById(kind.getParentid());
		this.updateParent(parentKind);
		String sql = "insert into kind (name,descr,parentid,grade) values(?,?,?,?)";
		Object[] params = { kind.getName(), kind.getDescr(),
				kind.getParentid(), parentKind.getGrade() + 30 };
		try {
			queryRunner.update(sql, params);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException();
		}
	}

	/**
	 * 列表查询
	 * 
	 * @return
	 */
	public List<Kind> list(int userkindid) {
		List<Kind> kindlists = new ArrayList<Kind>();
		this.listAll(kindlists, userkindid);
		return kindlists;
	}

	/**
	 * 列表递归查询
	 * 
	 * @param kindlists
	 * @param id
	 */
	private void listAll(List<Kind> kindlists, int id) {
		String sql = "select * from kind where parentid = ?";
		try {
			List<Kind> kinds = queryRunner.query(sql,
					new BeanListHandler<Kind>(Kind.class), id);
			for (Kind kind : kinds) {
				kindlists.add(kind);
				if (kind.getLeaf() != 1) {
					this.listAll(kindlists, kind.getId());
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 根据id查找
	 * 
	 * @param id
	 * @return
	 */
	public Kind findById(int id) {
		String sql = "select * from kind where id = ?";
		try {
			Kind kind = queryRunner.query(sql,
					new BeanHandler<Kind>(Kind.class), id);
			return kind;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException();
		}
	}

	/**
	 * 插入子节点更新父分类
	 * 
	 * @param kind
	 */
	public void updateParent(Kind kind) {
		String sql = "update kind set leaf = ? where id = ?";
		try {
			queryRunner.update(sql, 2, kind.getId());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException();
		}
	}

	/**
	 * 类别递归删除
	 * 
	 * @param id
	 */
	public void delete(int id) {
		// TODO Auto-generated method stub
		List<Kind> kindlists = new ArrayList<Kind>();
		this.listAll(kindlists, id);
		String sql = "delete from kind where id = ?";
		try {
			queryRunner.update(sql, id);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			throw new RuntimeException();
		}
		for (Kind kind : kindlists) {
			try {
				queryRunner.update(sql, kind.getId());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				throw new RuntimeException();
			}
		}
	}

	public void update(Kind kind) {
		// TODO Auto-generated method stub
		String sql = "update kind set name=?,descr=? where id = ?";
		Object[] params = { kind.getName(), kind.getDescr(), kind.getId() };
		try {
			queryRunner.update(sql, params);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException();
		}
	}

	/**
	 * 获取所有叶子类别
	 * 
	 * @return
	 */
	public List<Kind> leaflist() {
		// TODO Auto-generated method stub
		String sql = "select * from kind where leaf = 1";
		try {
			List<Kind> leaflist = queryRunner.query(sql,
					new BeanListHandler<Kind>(Kind.class));
			return leaflist;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException();
		}
	}
}
