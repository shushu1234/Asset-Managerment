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

		<title>发件箱</title>
	 
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
	<i class="fa fa-user" aria-hidden="true"></i><span
	class="text"> 个人信息</span></a></li>


	<li><a href="${pageContext.request.contextPath }/file_userfilelist.action">
	<i class="fa fa-user" aria-hidden="true"></i><span
	class="text"> 个人资产</span></a></li>
	<s:if test="%{#session.loginUser.role==1}">
		<li>
		<a href="${pageContext.request.contextPath }/file_list.action">
		<i class="fa fa-th-large" aria-hidden="true"></i><span
		class="text">资产列表</span></a>
		</li>
		<li>
		<a href="${pageContext.request.contextPath }/user_list.action">
		<i class="fa fa-th-large" aria-hidden="true"></i><span
		class="text">用户列表</span></a>
		</li>
	</s:if>
	<li class="nav-parent">
	<a>
	<i class="fa fa-envelope-o" aria-hidden="true"></i><span>信息中心</span>
	</a>
	<ul class="nav nav-children">
	<li>
	<a href="${pageContext.request.contextPath }/message_inbox.action">
	<span>收件箱</span>
	</a>
	</li>
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
	<i class="fa fa-list-alt" aria-hidden="true"></i><span>资产管理</span>
	</a>
	<ul class="nav nav-children">
	<li>

	<a href="${pageContext.request.contextPath }/file_uploadview.action">
	<span>资产添加</span>
	</a>
	</li>
	<li><a href="${pageContext.request.contextPath }/kind_addview.action"><span
	class="text"> 添加资产根类别</span></a></li>
	<li><a href="${pageContext.request.contextPath }/kind_list.action"><span>资产类别列表</span></a>
	</li>
	</ul>
	</li>
	<s:if test="%{#session.loginUser.role==1}">
		<li class="nav-parent">
		<a>
		<i class="fa fa-list-alt" aria-hidden="true"></i><span>部门管理</span>
		</a>
		<ul class="nav nav-children">
		<li><a href="${pageContext.request.contextPath }/department_addview.action"><span
		class="text"> 添加根部门</span></a></li>
		<li><a href="${pageContext.request.contextPath }/department_list.action"><span>部门列表</span></a>
		</li>
		</ul>
		</li>
	</s:if>
	<li class="nav-parent">
	<a>
	<i class="fa fa-credit-card" aria-hidden="true"></i><span>个人中心</span>
	</a>
	<ul class="nav nav-children">
	<li><a href="${pageContext.request.contextPath}/user_recoversend.action"><span
	class="text"> 密码重置</span></a></li>
	<li>
	<s:a action="user_editview" namespace="/">
		<s:param name="id" value="%{#session.loginUser.id}"></s:param>
		<span class="text"> 修改个人信息</span>
	</s:a>
	</li>

	</ul>
	</li>
	<li>

	<a href="${pageContext.request.contextPath }/message_composeview.action?id=10000000">
	<i class="fa fa-comment-o" aria-hidden="true"></i><span>报废/异动申请</span>
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
							<h2>发件箱</h2>
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
											发件箱
										</h3>
									</div>
								</div>
							</div>
							<div class="panel bk-bg-white">
								<div class="panel-body">
									<%--<div class="col-md-12">--%>
										<%--<div class="btn-group bk-margin-bottom-10 bk-margin-top-10 pull-right">--%>
											<%--<button class="btn btn-sm btn-default">1-10 of 500</button>--%>
											<%--<button class="btn btn-sm btn-default"><span class="fa fa-chevron-left"></span></button>--%>
											<%--<button class="btn btn-sm btn-default"><span class="fa fa-chevron-right"></span></button>--%>
										<%--</div>--%>
									<%--</div>--%>
								</div>
								<div class="panel-body">
									<div class="col-md-12">
										<ul class="messages-list" id="messages-list">
										</ul>
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
		<script src="${pageContext.request.contextPath}/assets/plugins/sparkline/js/jquery.sparkline.min.js"></script>
		
		<!-- Theme JS -->		
		<script src="${pageContext.request.contextPath}/assets/js/jquery.mmenu.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/core.min.js"></script>
		
		<!-- Pages JS -->
		<script src="${pageContext.request.contextPath}/assets/js/pages/mailbox.js"></script>
		
		<!-- end: JavaScript-->
		<script type="text/javascript">

            $(function () {
                setInterval(checkmessage,1000);

                function checkmessage() {
                    $.post("${pageContext.request.contextPath}/ajax/checksendmsg.action",function (data) {
                        var str="";
                        var ul=$("#messages-list");
                        ul.find("li").remove(); 
                        var newmsgs=data.newmsgs;
                        $("#unreadcount").text(data.unreadcount);
                        $("#trashcount").text(data.trashcount);
                        $.each(newmsgs,function (n,newmsg) {
                            if(newmsg.hasread==1){
                                str+="<li class=\"unread\">";
                            }else {
                                str+="<li>";
                            }
                            str+="<a href=\"" +
                                "${pageContext.request.contextPath}/message_detail.action?id=" +
                                newmsg.id+
                                "\">\n" +
                                "\t\t\t\t\t\t\t\t\t\t\t\t\t<div class=\"header\">\n" +
                                "\t\t\t\t\t\t\t\t\t\t\t\t\t\t<span class=\"from\">" +
                                newmsg.sendername +
                                "</span>\n" +
                                "\t\t\t\t\t\t\t\t\t\t\t\t\t\t<span class=\"date\"><i class=\"fa fa-paperclip\"></i>" +
                                newmsg.sendtime +
                                "</span>\n" +
                                "\t\t\t\t\t\t\t\t\t\t\t\t\t</div>\n" +
                                "\t\t\t\t\t\t\t\t\t\t\t\t\t<div class=\"title\">\n" +
                                "\t\t\t\t\t\t\t\t\t\t\t\t\t\t<span class=\"action\"><i class=\"fa fa-star\"></i></span>\n" +
                                "\t\t\t\t\t\t\t\t\t\t\t\t\t\t" +
                                newmsg.title +
                                "\n" +
                                "\t\t\t\t\t\t\t\t\t\t\t\t\t</div>\t\n" +
                                "\t\t\t\t\t\t\t\t\t\t\t\t\t<div class=\"description\">\n" +
                                "\t\t\t\t\t\t\t\t\t\t\t\t\t\t" +
                                newmsg.content.slice(20)+
                                "\n" +
                                "\t\t\t\t\t\t\t\t\t\t\t\t\t</div>\n" +
                                "\t\t\t\t\t\t\t\t\t\t\t\t</a>\t\t\n" +
                                "\t\t\t\t\t\t\t\t\t\t\t</li>"
                        })
                        ul.append(str)
                    })
                }

            })
		</script>
	</body>
	
</html>