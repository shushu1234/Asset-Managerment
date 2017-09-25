package com.shushu.service;

import java.util.List;

import com.shushu.dao.DepartmentDao;
import com.shushu.domain.Department;

public class DepartmentService {

	public void add(Department department) {
		DepartmentDao departmentDao = new DepartmentDao();
		departmentDao.add(department);
	}

	public List<Department> list(int userdepartmentid) {
		DepartmentDao departmentDao = new DepartmentDao();
		return departmentDao.list(userdepartmentid);
	}

	public Department findById(int id) {
		DepartmentDao departmentDao = new DepartmentDao();
		return departmentDao.findById(id);
	}

	public void addChildDepartment(Department department) {
		// TODO Auto-generated method stub
		DepartmentDao departmentDao = new DepartmentDao();
		departmentDao.addChildDepartment(department);
	}

	public void delete(int id) {
		DepartmentDao departmentDao = new DepartmentDao();
		departmentDao.delete(id);
	}

	public Department detail(int id) {
		// TODO Auto-generated method stub
		DepartmentDao departmentDao = new DepartmentDao();
		return departmentDao.findById(id);
	}

	public void update(Department department) {
		// TODO Auto-generated method stub
		DepartmentDao departmentDao = new DepartmentDao();
		departmentDao.update(department);
	}

	public List<Department> leaflist() {
		// TODO Auto-generated method stub
		DepartmentDao departmentDao = new DepartmentDao();
		return departmentDao.leaflist();
	}
}
