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

		<title>邮件详情</title>
	
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
		<link href="${pageContext.request.contextPath}/assets/plugins/magnific-popup/css/magnific-popup.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/assets/plugins/pnotify/css/pnotify.custom.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/assets/plugins/summernote/css/summernote.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/assets/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css" rel="stylesheet" />

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
							<h2>邮件详情</h2>
						</div>					
					</div>
					<!-- End Page Header -->				
					<div class="row mailbox">
						<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
							<div class="panel">
								<div class="panel-body bk-bg-very-light-gray mailbox-menu">
									<a href="message-compose.html" class="btn btn-primary btn-block">栏目</a>
									<ul>
										<li>
											<a href="${pageContext.request.contextPath}/message_composeview.action">发邮件</a>
										</li>
										<li>
											<a href="${pageContext.request.contextPath}/message_inbox.action">收件箱</a>
										</li>
										<li>
											<a href="${pageContext.request.contextPath}/message_sendview.action">发件箱</a>
										</li>
										<li>
											<a href="${pageContext.request.contextPath}/message_deleteview.action">回收站</a>
										</li>

									</ul>
								</div>
							</div>
						</div>
						<div class="col-lg-9 col-md-8 col-sm-8 col-xs-12">
							<div class="panel">
								<div class="panel-body bk-bg-very-light-gray">
									<div class="mailbox-email-header">
										<h3 class="mailbox-email-subject bk-fg-primary">
											邮件详情
										</h3>								
									</div>
								</div>
							</div>						
							<div class="panel">
								<div class="panel-heading bk-bg-white mailbox-btn-action bk-padding-top-20 bk-padding-bottom-20">

									<span class="item-action-group text-left">
										<a class="item-action fa fa-mail-reply" href="${pageContext.request.contextPath}/message_composeview.action?id=${model.sender}"></a>
										<a id="del" class="modal-basic item-action fa fa-trash-o" href="#modalIcon" data-delid=%{model.id}></a>
										<div id="modalIcon" class="modal-block modal-block-primary mfp-hide">
                                        <div class="panel panel-default">
                                        <div class="panel-heading">
                                        <h2 class="panel-title">请确认</h2>
                                        </div>
                                        <div class="panel-body bk-noradius">
                                        <div class="modal-wrapper">
                                        <div class="modal-icon">
                                        <i class="fa fa-question-circle"></i>
                                        </div>
                                        <div class="modal-text">
                                        <p> 你确认要删除&nbsp;<span style="color:red;"
										><s:property value="%{model.title}"></s:property></span>&nbsp;这封信息吗?你将在回收站看到它^_^.</p>
                                        </div>
                                        </div>
                                        </div>
                                        <div class="panel-footer">
                                        <div class="row">
                                        <div class="col-md-12 text-right">
                                        <s:a action="message_delete" namespace="/" >
											<s:param name="id" value="%{model.id}"></s:param>
											<button class="btn btn-info modal-confirm1" >确认</button>
										</s:a>
                                        <button class="btn btn-default modal-dismiss">取消</button>
                                        </div>
                                        </div>
                                        </div>
                                        </div>
                                        </div>

									</span>

								</div>
								<div class="panel-body message">	
									<div class="col-md-12">
										<div class="message-title"><s:property value="%{model.title}"/> </div>										
										<div class="header">
											<img class="avatar" src="<s:property value="%{model.senderpath}"/>" />
											<div class="from">
												<span><s:property value="%{model.sendername}"/></span>
												<s:property value="%{model.sender}"/>
											</div>											
											<div class="date">												
												<span class="btn-group">
													<a href="#" class="fa fa-paperclip fa-2x dropdown-toggle" data-toggle="dropdown"></a>
													<ul class="dropdown-menu" role="menu">
														<li><a href="#"><i class="fa fa-download"></i>Download</a></li>
														<li><a href="#"><i class="fa fa-desktop"></i>View on Screen</a></li>
														<li><a href="#"><i class="fa fa-trash-o"></i>Delete</a></li>
														<li class="divider"></li>
														<li><a href="#">More</a></li>
													</ul>											
												</span>
												 <b><s:property value="%{model.sendtime}"/></b>
											</div>
											<div class="menu"></div>
										</div>
										<div class="content">

											<div class="form-group">
												<div class="col-md-12">
													<textarea name="content" data-plugin-markdown-editor rows="10"><s:property value="%{model.content}"/></textarea>
												</div>
											</div>

										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
				<!-- End Main Page -->			
		
			</div>
		</div><!--/container-->
		
		
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
		<script src="${pageContext.request.contextPath}/assets/plugins/summernote/js/summernote.js"></script>
		<script src="${pageContext.request.contextPath}/assets/plugins/bootstrap-markdown/js/bootstrap-markdown1.js"></script>
		<script src="${pageContext.request.contextPath}/assets/plugins/bootstrap-markdown/js/markdown.js"></script>
		<script src="${pageContext.request.contextPath}/assets/plugins/bootstrap-markdown/js/to-markdown.js"></script>
		<script src="${pageContext.request.contextPath}/assets/plugins/sparkline/js/jquery.sparkline.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/plugins/magnific-popup/js/magnific-popup.js"></script>
		<script src="${pageContext.request.contextPath}/assets/plugins/pnotify/js/pnotify.custom.js"></script>

		<!-- Theme JS -->		
		<script src="${pageContext.request.contextPath}/assets/js/jquery.mmenu.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/core.min.js"></script>
		
		<!-- Pages JS -->
		<script src="${pageContext.request.contextPath}/assets/js/pages/mailbox.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/pages/ui-modals.js"></script>

		<script src="${pageContext.request.contextPath}/assets/js/pages/form-editors.js"></script>

		<!-- end: JavaScript-->
	
	</body>
	
</html>