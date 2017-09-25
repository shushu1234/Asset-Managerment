package com.shushu.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.shushu.domain.Department;
import com.shushu.utils.JDBCUtils;

public class DepartmentDao {
	private QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());

	/**
	 * 存储分类
	 * 
	 * @param department
	 */
	public void add(Department department) {
		// TODO Auto-generated method stub
		String sql = "insert into department (name,descr,parentid) values(?,?,?)";
		Object[] params = { department.getName(), department.getDescr(), department.getParentid() };
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
	 * @param department
	 */
	public void addChildDepartment(Department department) {
		Department parentDepartment = new Department();
		parentDepartment = this.findById(department.getParentid());
		this.updateParent(parentDepartment);
		String sql = "insert into department (name,descr,parentid,grade) values(?,?,?,?)";
		Object[] params = { department.getName(), department.getDescr(), department.getParentid(),
				parentDepartment.getGrade() + 30 };
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
	public List<Department> list(int userdepartmentid) {
		List<Department> departmentlists = new ArrayList<Department>();
		this.listAll(departmentlists, userdepartmentid);
		return departmentlists;
	}

	/**
	 * 列表递归查询
	 * 
	 * @param departmentlists
	 * @param id
	 */
	private void listAll(List<Department> departmentlists, int id) {
		String sql = "select * from department where parentid = ?";
		try {
			List<Department> departments = queryRunner.query(sql, new BeanListHandler<Department>(Department.class),
					id);
			for (Department department : departments) {
				departmentlists.add(department);
				if (department.getLeaf() != 1) {
					this.listAll(departmentlists, department.getId());
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
	public Department findById(int id) {
		String sql = "select * from department where id = ?";
		try {
			Department department = queryRunner.query(sql, new BeanHandler<Department>(Department.class), id);
			return department;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException();
		}
	}

	/**
	 * 插入子节点更新父分类
	 * 
	 * @param department
	 */
	public void updateParent(Department department) {
		String sql = "update department set leaf = ? where id = ?";
		try {
			queryRunner.update(sql, 2, department.getId());
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
		List<Department> departmentlists = new ArrayList<Department>();
		this.listAll(departmentlists, id);
		String sql = "delete from department where id = ?";
		try {
			queryRunner.update(sql, id);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			throw new RuntimeException();
		}
		for (Department department : departmentlists) {
			try {
				queryRunner.update(sql, department.getId());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				throw new RuntimeException();
			}
		}
	}

	public void update(Department department) {
		// TODO Auto-generated method stub
		String sql = "update department set name=?,descr=? where id = ?";
		Object[] params = { department.getName(), department.getDescr(), department.getId() };
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
	public List<Department> leaflist() {
		// TODO Auto-generated method stub
		String sql = "select * from department where leaf = 1";
		try {
			List<Department> leaflist = queryRunner.query(sql, new BeanListHandler<Department>(Department.class));
			return leaflist;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException();
		}
	}
}
