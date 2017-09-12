package com.shushu.web.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.shushu.domain.Kind;
import com.shushu.domain.User;
import com.shushu.service.KindService;
import com.shushu.utils.ListUtils;

public class KindAction extends ActionSupport implements ModelDriven<Kind> {
	private Kind kind = new Kind();
	private List<Kind> kinds = new ArrayList<Kind>();
	private List<Kind> leaflist = new ArrayList<Kind>();
	private List<Kind> alllist = new ArrayList<Kind>();
	private int userkindid;

	public void setUserkindid() {
		this.userkindid = ((User) ServletActionContext.getRequest()
				.getSession().getAttribute("loginUser")).getKindid();
	}

	public int getUserkindid() {
		return userkindid;
	}

	public List<Kind> getAlllist() {
		return alllist;
	}

	public List<Kind> getLeaflist() {
		return leaflist;
	}

	@Override
	public Kind getModel() {
		// TODO Auto-generated method stub
		return kind;
	}

	public List<Kind> getKinds() {
		return kinds;
	}

	public void setKinds(List<Kind> kinds) {
		this.kinds = kinds;
	}

	/**
	 * 添加根,子类别
	 * 
	 * @return
	 */
	public String add() {
		this.setUserkindid();
		KindService kindService = new KindService();
		System.out.println(kind.getParentid());
		if (kind.getParentid() == 0) {
			kind.setParentid(userkindid);
			kindService.add(kind);
		} else {
			kindService.addChildKind(kind);
		}
		return "addSUCCESS";
	}

	/**
	 * 返回类别
	 * 
	 * @return
	 */
	public String list() {
		this.setUserkindid();
		KindService kindService = new KindService();
		kinds = kindService.list(userkindid);
		return "listSUCCESS";
	}

	/**
	 * 删除类别
	 */
	public String delete() {
		KindService kindService = new KindService();
		kindService.delete(kind.getId());
		return "deleteSUCCESS";
	}

	/**
	 * 查看详细
	 */
	public String detail() {
		KindService kindService = new KindService();
		kind = kindService.detail(kind.getId());
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
		KindService kindService = new KindService();
		kindService.update(kind);
		return "updateSUCCESS";
	}

	/**
	 * 读取所有叶子list
	 */
	public String leaflist() {
		KindService kindService = new KindService();
		leaflist = kindService.leaflist();
		leaflist = new ListUtils().removedRepeat(leaflist);
		return "leaflistSUCCESS";
	}

	/**
	 * 类别选择列出该用户所有kind
	 */

	public String alllist() {
		this.setUserkindid();
		KindService kindService = new KindService();
		alllist = kindService.list(userkindid);
		return "alllistSUCCESS";
	}

	public String addview() {
		String testid = ServletActionContext.getRequest().getParameter("id");
		ServletActionContext.getRequest().setAttribute("id", testid);
		return "addviewSUCCESS";
	}
}
