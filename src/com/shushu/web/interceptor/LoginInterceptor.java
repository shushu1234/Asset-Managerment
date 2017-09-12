package com.shushu.web.interceptor;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/**
 * 登录校验拦截器
 * 
 * @author shushu
 *
 */
public class LoginInterceptor extends AbstractInterceptor {
	private String excludeMethods;

	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {
		// 判断Session中是否含有loginUser对象
		if (ServletActionContext.getRequest().getSession()
				.getAttribute("loginUser") == null) {
			// 未登录--判断是否放行
			if (excludeMethods != null) {
				String[] methods = excludeMethods.split(",");
				// 判读methods数组是否包含当前访问
				String currentMethod = ActionContext.getContext().getName(); // 获得当前action名字
				for (String method : methods) {
					if (method.equals(currentMethod)) {
						// 当前action被配置放行
						return actionInvocation.invoke();
					}
				}
			}
			// 未在放行数组中拦截
			ActionSupport actionSupport = (ActionSupport) actionInvocation
					.getAction();
			actionSupport.addActionError(actionSupport.getText("nologin"));
			return "login";// 登录视图
		} else {
			// 已登录
			return actionInvocation.invoke();
		}
	}

	public void setExcludeMethods(String excludeMethods) {
		this.excludeMethods = excludeMethods;
	}
}
