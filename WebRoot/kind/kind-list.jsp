<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">

	<head>
	
		<!-- Basic -->
    	<meta charset="UTF-8" />

		<title>用户类别</title>
	   
		<!-- Mobile Metas -->
	    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

		<!-- Favicon and touch icons -->
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" type="image/x-icon" />
		<link rel="apple-touch-icon" href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon.png" />
		<link rel="apple-touch-icon" sizes="57x57" href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-57x57.png" />
		<link rel="apple-touch-icon" sizes="72x72" href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-72x72.png" />
		<link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-76x76.png" />
		<link rel="apple-touch-icon" sizes="114x114" href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-114x114.png" />
		<link rel="apple-touch-icon" sizes="120x120" href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-120x120.png" />
		<link rel="apple-touch-icon" sizes="144x144" href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-144x144.png" />
		<link rel="apple-touch-icon" sizes="152x152" href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-152x152.png" />
		
	    <!-- start: CSS file-->
		
		<!-- Vendor CSS-->
		<link href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/assets/vendor/skycons/css/skycons.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/assets/vendor/css/pace.preloader.css" rel="stylesheet" />
		
		<!-- Plugins CSS-->
		<link href="${pageContext.request.contextPath}/assets/plugins/bootkit/css/bootkit.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/assets/plugins/jquery-ui/css/jquery-ui-1.10.4.min.css" rel="stylesheet" />					
		
		<!-- Theme CSS -->
		<link href="${pageContext.request.contextPath}/assets/css/jquery.mmenu.css" rel="stylesheet" />
		
		<!-- Page CSS -->		
		<link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/assets/css/add-ons.min.css" rel="stylesheet" />
		
		<!-- end: CSS file-->	
	    
		
		<!-- Head Libs -->
		<script src="${pageContext.request.contextPath}/assets/plugins/modernizr/js/modernizr.js"></script>
		
		<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->		
		
	</head>
	
	<body>

	<!-- Start: Header -->
	<div class="navbar" role="navigation">
		<div class="container-fluid container-nav">
			<!-- Navbar Action -->
			<ul class="nav navbar-nav navbar-actions navbar-left">
				<li class="visible-md visible-lg"><a href="#" id="main-menu-toggle"><i class="fa fa-th-large"></i></a></li>
				<li class="visible-xs visible-sm"><a href="#" id="sidebar-menu"><i class="fa fa-navicon"></i></a></li>
			</ul>
			<!-- Navbar Left -->
			<div class="navbar-left">
				<!-- Search Form -->

			</div>
			<!-- Navbar Right -->
			<div class="navbar-right">
				<!-- Notifications -->

				<!-- End Notifications -->
				<!-- Userbox -->
				<div class="userbox">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<!--<figure class="profile-picture hidden-xs">-->
						<!--<img src="assets/img/avatar.jpg" class="img-circle" alt="" />-->
						<!--</figure>-->
						<div class="profile-info">
							<span class="name" style="color: #dedede;">欢迎您：${loginUser.name}</span>
							<span class="role"><i class="fa fa-circle bk-fg-success"></i>
									<s:if test="%{#session.loginUser.role==1}">
										超级管理员
									</s:if>
									<s:else>
										用户
									</s:else>
								</span>
						</div>
						<i class="fa custom-caret"></i>
					</a>
					<div class="dropdown-menu">
						<ul class="list-unstyled">

							<hr>
							<li>
								<s:a  action="user_editview" namespace="/">
									<s:param name="id" value="%{#session.loginUser.id}"></s:param>
									<i class="fa fa-user"></i> 修改个人信息
								</s:a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/user_logout.action"><i class="fa fa-power-off"></i> 注 销 </a>
							</li>
						</ul>
					</div>
				</div>

				<!-- End Userbox -->
			</div>
			<!-- End Navbar Right -->
		</div>
	</div>
	<!-- End: Header -->
		
		<!-- Start: Content -->
		<div class="container-fluid content">	
			<div class="row">

				<!-- Sidebar -->
				<div class="sidebar">
					<div class="sidebar-collapse">
						<!-- Sidebar Header Logo-->
						<div class="sidebar-header">
							<img src="assets/img/logo.png" class="img-responsive" alt=""/>
						</div>
						<!-- Sidebar Menu-->
						<div class="sidebar-menu">
							<nav id="menu" class="nav-main" role="navigation">
								<ul class="nav nav-sidebar">
									<div class="panel-body text-center">
										<!--<div class="flag">-->
										<!--<img src="assets/img/flags/china.png" class="img-flags" alt="" />-->
										<!--</div>-->
										<div class="bk-avatar">
											<img src="${loginUser.avatarpath }" class="img-circle bk-img-60" alt=""/>
										</div>

									</div>
									<li><a href="${pageContext.request.contextPath }/user_view.action">
										<i class="fa  fa-user" aria-hidden="true"></i><span
											class="text"> 个人信息</span></a></li>
									<li><a href="${pageContext.request.contextPath }/file_list.action">
										<i class="fa  fa-th-large" aria-hidden="true"></i><span
											class="text">文件列表</span></a></li>

									<li><a href="${pageContext.request.contextPath }/article_list.action">
										<i class="fa   fa-file-text" aria-hidden="true"></i>
										<span class="text"> 文章列表</span></a>
									</li>

									<li>
										<a href="${pageContext.request.contextPath }/message_inbox.action">
											<i class="fa fa-envelope" aria-hidden="true"></i><span>收件箱</span>
										</a>
									</li>
									<li>

										<a href="${pageContext.request.contextPath }/file_uploadview.action">
											<i class="fa  fa-cloud-upload" aria-hidden="true"></i><span>文件上传</span>
										</a>
									</li>
									<li class="nav-parent">
										<a>
											<i class="fa fa-credit-card" aria-hidden="true"></i><span>个人中心</span>
										</a>
										<ul class="nav nav-children">
											<li><a href="${pageContext.request.contextPath}/user_recoversend.action"><span
													class="text"> 密码重置</span></a></li>
											<li><s:a  action="user_editview" namespace="/">
												<s:param name="id" value="%{#session.loginUser.id}"></s:param>
												<span class="text"> 修改个人信息</span>
											</s:a>
											</li>
											<li><a href="${pageContext.request.contextPath }/user_list.action"><span
													class="text">用户查询</span></a></li>
										</ul>
									</li>
									<li class="nav-parent">
										<a>
											<i class="fa fa-book" aria-hidden="true"></i><span>文章中心</span>
										</a>
										<ul class="nav nav-children">
											<li><a href="${pageContext.request.contextPath }/article_editview.action"><span class="text"> 撰写文章</span></a></li>
											<li><a href="${pageContext.request.contextPath }/article_myview.action"><span class="text"> 个人文章</span></a></li>
										</ul>
									</li>
									<li class="nav-parent">
										<a>
											<i class="fa  fa-envelope-o" aria-hidden="true"></i><span>信息中心</span>
										</a>
										<ul class="nav nav-children">
											<li>
												<a href="${pageContext.request.contextPath}/message_composeview.action"><span class="text">发邮件</span></a>
											</li>
											<li>
												<a href="${pageContext.request.contextPath}/message_sendview.action"><span class="text">发件箱</span></a>
											</li>
											<li>
												<a href="${pageContext.request.contextPath}/message_deleteview.action"><span class="text">回收站</span></a>
											</li>
										</ul>
									</li>
									<li class="nav-parent">
										<a>
											<i class="fa fa-list-alt" aria-hidden="true"></i><span>类别管理</span>
										</a>
										<ul class="nav nav-children">
											<li><a href="${pageContext.request.contextPath }/kind_addview.action"><span
													class="text"> 添加根类别</span></a></li>
											<li><a href="${pageContext.request.contextPath }/kind_list.action"><span>类别列表</span></a>
											</li>
										</ul>
									</li>
									<li>

										<a href="${pageContext.request.contextPath }/message_composeview.action?id=10000000">
											<i class="fa  fa-comment-o" aria-hidden="true"></i><span>意见反馈</span>
										</a>
									</li>
								</ul>
							</nav>
						</div>
						<!-- End Sidebar Menu-->
					</div>
					<!-- Sidebar Footer-->
					<div class="sidebar-footer">
						<div class="small-chart-visits">

						</div>

					</div>
					<!-- End Sidebar Footer-->
				</div>
				<!-- End Sidebar -->
						
				<!-- Main Page -->
				<div class="main ">
					<!-- Page Header -->
					<div class="page-header">
						<div class="pull-left">
													
						</div>
						<div class="pull-right">
							<h2>类别列表</h2>
						</div>					
					</div>
					<!-- End Page Header -->					
					<div class="row">

						<div class="col-sm-12">
							<div class="panel panel-default bk-bg-white">
								<div class="panel-heading bk-bg-white">
									<h6><i class="fa fa-outdent red"></i>类别列表</h6>
									<div class="panel-actions">
										<a href="#" class="btn-minimize"><i class="fa fa-caret-up"></i></a>
										<a href="#" class="btn-close"><i class="fa fa-times"></i></a>
									</div>
								</div>
								<div class="panel-body clearfix">
									<div class="dd" id="nestable3">
									<h4 style="color:red">点击类别名称添加子类别，点击左侧按钮查看详情</h4>
									<hr/>
									<ol class="dd-list">
										<s:iterator value="kinds" var="kind">
												<li class="dd-item dd3-item" data-id="13"  style="margin-left:<s:property value="grade"/>px">																		
													<s:a action="kind_detail" namespace="/" style="color:#777;text-decoration: none;">
														<div class="dd-handle dd3-handle btn-info">
															<s:param name="id" value="id"></s:param>
															<i class="fa fa-bars"></i>
														</div>
													</s:a>
													
													<a href="${pageContext.request.contextPath}/kind_addview.action?parentid=${id}" style="color:#777;text-decoration: none;">
														<div class="dd3-content">
															
															<s:property value="name"/>
														</div>
													</a>																										
										</s:iterator>
									</ol>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- End Main Page -->		

			</div>
		</div><!--/container-->
		
		
		<!-- Modal Dialog -->
		<div class="modal fade" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title bk-fg-primary">Modal title</h4>
					</div>
					<div class="modal-body">
						<p class="bk-fg-danger">Here settings can be configured...</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Save changes</button>
					</div>
				</div>
			</div>
		</div><!-- End Modal Dialog -->		
		
		<div class="clearfix"></div>		
		
		
		<!-- start: JavaScript-->
		
		<!-- Vendor JS-->				
		<script src="${pageContext.request.contextPath}/assets/vendor/js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/vendor/js/jquery-2.1.1.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/vendor/js/jquery-migrate-1.2.1.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/vendor/skycons/js/skycons.js"></script>	
		<script src="${pageContext.request.contextPath}/assets/vendor/js/pace.min.js"></script>
		
		<!-- Plugins JS-->
		<script src="${pageContext.request.contextPath}/assets/plugins/jquery-ui/js/jquery-ui-1.10.4.min.js"></script>			
		<script src="${pageContext.request.contextPath}/assets/plugins/sparkline/js/jquery.sparkline.min.js"></script>
		
		<!-- Theme JS -->		
		<script src="${pageContext.request.contextPath}/assets/js/jquery.mmenu.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/core.min.js"></script>
		
		<!-- Pages JS -->
		<script src="${pageContext.request.contextPath}/assets/js/pages/nestable.js"></script>
		
		<!-- end: JavaScript-->
		
	</body>
	
</html>