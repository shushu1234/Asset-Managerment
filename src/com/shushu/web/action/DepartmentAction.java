package com.shushu.web.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.shushu.domain.Department;
import com.shushu.service.DepartmentService;
import com.shushu.utils.ListUtils;

public class DepartmentAction extends ActionSupport implements ModelDriven<Department> {
	private Department department = new Department();
	private List<Department> departments = new ArrayList<Department>();
	private List<Department> leaflist = new ArrayList<Department>();
	private List<Department> alllist = new ArrayList<Department>();
	private int userdepartmentid;

	public void setUserdepartmentid() {
		// this.userdepartmentid = ((User)
		// ServletActionContext.getRequest().getSession().getAttribute("loginUser"))
		// .getDepartmentid();
	}

	public int getUserdepartmentid() {
		return userdepartmentid;
	}

	public List<Department> getAlllist() {
		return alllist;
	}

	public List<Department> getLeaflist() {
		return leaflist;
	}

	@Override
	public Department getModel() {
		// TODO Auto-generated method stub
		return department;
	}

	public List<Department> getDepartments() {
		return departments;
	}

	public void setDepartments(List<Department> departments) {
		this.departments = departments;
	}

	/**
	 * 添加根,子类别
	 * 
	 * @return
	 */
	public String add() {
		this.setUserdepartmentid();
		DepartmentService departmentService = new DepartmentService();
		System.out.println(department.getParentid());
		if (department.getParentid() == 0) {
			department.setParentid(0);
			departmentService.add(department);
		} else {
			departmentService.addChildDepartment(department);
		}
		return "addSUCCESS";
	}

	/**
	 * 返回类别
	 * 
	 * @return
	 */
	public String list() {
		this.setUserdepartmentid();
		DepartmentService departmentService = new DepartmentService();
		departments = departmentService.list(0);
		return "listSUCCESS";
	}

	/**
	 * 删除类别
	 */
	public String delete() {
		DepartmentService departmentService = new DepartmentService();
		departmentService.delete(department.getId());
		return "deleteSUCCESS";
	}

	/**
	 * 查看详细
	 */
	public String detail() {
		DepartmentService departmentService = new DepartmentService();
		department = departmentService.detail(department.getId());
		return "detailSUCCESS";
	}

	/**
	 * 修改前查看
	 */
	public String updateview() {
		this.detail();
		return "updateviewSUCCESS";
	}

	/**
	 * 修改
	 */
	public String update() {
		DepartmentService departmentService = new DepartmentService();
		departmentService.update(department);
		return "updateSUCCESS";
	}

	/**
	 * 读取所有叶子list
	 */
	public String leaflist() {
		DepartmentService departmentService = new DepartmentService();
		leaflist = departmentService.leaflist();
		leaflist = new ListUtils().removedRepeat2(leaflist);
		return "leaflistSUCCESS";
	}

	/**
	 * 类别选择列出该用户所有department
	 */

	public String departmentlist() {
		this.setUserdepartmentid();
		DepartmentService departmentService = new DepartmentService();
		alllist = departmentService.list(0);
		return "departmentlistSUCCESS";
	}

	public String addview() {
		String testid = ServletActionContext.getRequest().getParameter("id");
		ServletActionContext.getRequest().setAttribute("id", testid);
		return "addviewSUCCESS";
	}
}
