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

		<title>Widgets | Fire - Admin Template</title>
	   
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
		<link href="${pageContext.request.contextPath}/assets/plugins/scrollbar/css/mCustomScrollbar.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/assets/plugins/bootkit/css/bootkit.css" rel="stylesheet" />			
		<link href="${pageContext.request.contextPath}/assets/plugins/jquery-ui/css/jquery-ui-1.10.4.min.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/assets/plugins/magnific-popup/css/magnific-popup.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/assets/plugins/pnotify/css/pnotify.custom.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/assets/plugins/fullcalendar/css/fullcalendar.css" rel="stylesheet" />
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
							<ol class="breadcrumb visible-sm visible-md visible-lg">								
								
							</ol>						
						</div>
						<div class="pull-right">
							<h2>文件详情</h2>
						</div>					
					</div>
					<!-- End Page Header -->
					<div class="row">
						<div class="col-md-12">
							<div class="panel bk-widget bk-border-off">
								<div class="panel-body">
									<div class="bk-bg-white text-center bk-padding-top-15 bk-padding-bottom-15">
										<div class="row">
											<div class="col-xs-8 text-left bk-vcenter">
												<div class="">
													<h2 class="bk-margin-off">文件详情</h2>
												</div>
											</div>
											<div class="col-xs-4 bk-vcenter text-right">
												<i class="fa fa-file fa-4x"></i>
											</div>
										</div>
									</div>
								
									<ul class="list-group">
										<li class="list-group-item">
<%-- 											<s:text cssClass="badge bk-bg-info" ></s:text>
 --%>											<span class="badge bk-bg-info" id="fileid">
 													<s:property value="%{model.id}"/> </span>
											文件id
										</li>
										<li class="list-group-item">
											<span class="badge bk-bg-primary"><s:property value="%{model.name}"/></span>
											文件名称
										</li>
										<li class="list-group-item">
											<span class="badge bk-bg-success">
												<s:property value="%{model.kind}"/>
											</span>
											文件类型
										</li>
										<li class="list-group-item">
											<span class="badge bk-bg-danger">
												<s:property value="%{model.filesize}"/>&nbsp;Bytes
											</span>
											文件大小
										</li>
										<li class="list-group-item">
											<span class="badge bk-bg-inverse-darker" id="userid"><s:property value="%{model.userid}"/></span>
											上传用户id
										</li>
										<li class="list-group-item">
											<span class="badge bk-bg-warning"><s:property value="%{model.authorname1}"/></span>
											第一作者
										</li>
										<li class="list-group-item">
										<span class="badge bk-bg-info"><s:property value="%{model.authorname2}"/></span>
											第二作者
										</li>
										<li class="list-group-item">
											<span class="badge bk-bg-primary"><s:property value="%{model.authorname3}"/></span>					
											第三作者
										</li>
										<li class="list-group-item">
											<span class="badge bk-bg-success"><s:property value="%{model.authorname4}"/></span>					
											第四作者
										</li>
										<li class="list-group-item">
											<span class="badge bk-bg-danger"><s:property value="%{model.authorname5}"/></span>
											第五作者
										</li>
										<li class="list-group-item">
											<span class="badge bk-bg-inverse-darker">
												<s:if test="%{model.open==2}">
	                                        		已开放下载
	                                       		 </s:if>
	                                       		 <s:else>
	                                        		未开放
	                                       		 </s:else>
	                                        </span>
											开放状态
										</li>
										<li class="list-group-item">
											<span class="badge bk-bg-warning"><s:property value="%{model.uploaddate}"/></span>
											上传时间
										</li>
										<li class="list-group-item">
											<span class="badge bk-bg-info"><span id="ip"></span><span>:8080</span><span>${pageContext.request.contextPath}</span><s:property value="%{model.filepath}"/></span>
											文件地址
										</li>
										<li class="list-group-item">
											<span class="badge bk-bg-primary">
												<s:if test="%{model.privatefile==1}">
													公开文件
												</s:if>
	                                       		 <s:else>
													 个人文件
												 </s:else>
	                                        </span>
											开放状态
										</li>
										<li class="list-group-item">

											<span class="badge bk-bg-info">
											<a class=" popup-with-zoom-anim btn btn-default" href="#small-dialog" style="background-color:#2dc9b7;font-size:10px;padding:0px;color:#fff;border-bottom:0px">点击查看详情</a>
											</span>
											<div id="small-dialog" class="dialog dialog-sm zoom-anim-dialog mfp-hide">
											<h1>备注信息</h1>
											<p><s:property value="%{model.remark}"/></p>
											</div>
											备注信息
										</li>
										<li class="list-group-item">
											<span class="badge bk-bg-danger"><s:property value="%{model.downcount}"/></span>
											下载次数
										</li>
									</ul>
									<div>
									<s:a class="btn btn-success" action="file_detail" namespace="/">
                                           		 <s:param name="id" value="%{model.id}"></s:param>
                                                <i class="fa fa-search-plus "></i>
                                            </s:a>
                                            
                                            <s:a cssClass="btn btn-primary" action="file_download" namespace="/">
                                            	<s:param name="id" value="%{model.id}"></s:param>
                                            	<i class="fa fa-download "></i>
                                            </s:a>
                                           	<input type="hidden" name="loginuserid" id="loginuserid" value="${loginUser.id }">
                                            <s:a id="edit" cssClass="btn btn-info" action="file_editview" namespace="/">
                                            	<s:param name="id" value="%{model.id}"></s:param>
                                                <i class="fa fa-edit "></i>
                                            </s:a>
                                            
                                           
                                             <a id="del" class="modal-basic btn btn-danger" href="#modalIcon" data-delid=%{model.id}><i class="fa fa-trash-o "></i></a>
                                     	   <div id="modalIcon" class="modal-block modal-block-primary mfp-hide">
                                        <div class="panel panel-default">
                                        <div class="panel-heading">
                                        <h2 class="panel-title">请确认:</h2>
                                        </div>
                                        <div class="panel-body bk-noradius">
                                        <div class="modal-wrapper">
                                        <div class="modal-icon">
                                        <i class="fa fa-question-circle"></i>
                                        </div>
                                        <div class="modal-text">
                                        <p> 你确认要删除&nbsp;<span style="color:red;"
	><s:property value="%{model.name}"></s:property></span>&nbsp;吗?</p>
                                        </div>
                                        </div>
                                        </div>
                                        <div class="panel-footer">
                                        <div class="row">
                                        <div class="col-md-12 text-right">
                                        <s:a action="file_delete" namespace="/" >
                                                 <s:param name="id" value="%{model.id}"></s:param>
                                                 <button class="btn btn-info modal-confirm1" >确认</button>
                                        </s:a>
                                        <button class="btn btn-default modal-dismiss">取消</button>
                                        </div>
                                        </div>
                                        </div>
                                        </div>
                                        </div>
                                    	
                                      </div>
								</div>
							</div>
							
							<div class="panel bk-widget bk-border-off bk-webkit-fix">
								<div class="panel-body bk-bg-very-light-gray bk-bg-lighten">
									<div class="bk-bg-very-light-gray text-center bk-padding-top-10 bk-padding-bottom-10">
										<div class="row">
											<div class="col-xs-8 text-left bk-vcenter">
												<h5 class="bk-margin-off"><em>下载前三甲</em></h5>
											</div>
											<div class="col-xs-4 bk-vcenter text-right">
												<i class="fa fa-cloud-download fa-2x"></i>
											</div>
										</div>
									</div>
									<hr class="bk-margin-off" />
									<div class="bs-example">
										<div id="carousel-example-generic3" class="carousel bk-carousel-fade slide" data-ride="carousel">


										</div>
									</div>
								</div>
							</div>                          
						</div>
					</div>
					<s:if test="%{#session.loginUser.role==1}">

					<div class="row">
						<div class="col-xs-12">
							<div class="panel panel-default">
								<div class="panel-heading bk-bg-white">
									<h6><i class="fa fa-edit red"></i>文件审核</h6>
									<div class="panel-actions">
										<a href="#" class="btn-minimize"><i class="fa fa-caret-up"></i></a>
										<a href="#" class="btn-close"><i class="fa fa-times"></i></a>
									</div>
								</div>
								<div class="panel-body bk-bg-white bk-padding-top-30 bk-padding-bottom-20" style="height: 550px">
									<form class="form-horizontal form-bordered" >
										<div class="form-group">
											<div class="col-md-10">
											<textarea id="passcontent" name="content" data-plugin-markdown-editor rows="10" style="height: 300px"></textarea>
											</div>
											<div class="col-md-2">
												<div class="checkbox-custom checkbox-default bk-margin-top-10">
													<input id="pass" name="pass" type="checkbox">
													<label for="pass">是否通过</label>
												</div>
												<hr/>
												<button type="button" class="btn btn-primary" id="passbtn">提交</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					</s:if>
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
		<script src="${pageContext.request.contextPath}/assets/plugins/jquery-ui/js/jquery-ui-1.10.4.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/plugins/scrollbar/js/jquery.mCustomScrollbar.concat.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/plugins/bootkit/js/bootkit.js"></script>
		<script src="${pageContext.request.contextPath}/assets/plugins/flot/js/jquery.flot.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/plugins/flot/js/jquery.flot.pie.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/plugins/flot/js/jquery.flot.resize.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/plugins/flot/js/jquery.flot.stack.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/plugins/flot/js/jquery.flot.time.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/plugins/flot-tooltip/js/jquery.flot.tooltip.js"></script>
		<script src="${pageContext.request.contextPath}/assets/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
		<script src="${pageContext.request.contextPath}/assets/plugins/bootstrap-markdown/js/markdown.js"></script>
		<script src="${pageContext.request.contextPath}/assets/plugins/bootstrap-markdown/js/to-markdown.js"></script>
		<script src="${pageContext.request.contextPath}/assets/plugins/sparkline/js/jquery.sparkline.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/plugins/moment/js/moment.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/plugins/magnific-popup/js/magnific-popup.js"></script>
		<script src="${pageContext.request.contextPath}/assets/plugins/pnotify/js/pnotify.custom.js"></script>

	<!-- Theme JS -->
		<script src="${pageContext.request.contextPath}/assets/js/jquery.mmenu.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/core.min.js"></script>
		
		<!-- Pages JS -->
		<script src="${pageContext.request.contextPath}/assets/js/pages/widgets.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/pages/ui-lightbox.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/pages/ui-modals.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/pages/form-editors.js"></script>
	<!-- end: JavaScript-->
	<script type="text/javascript">
		$(function () {
            var ip_addr = "47.94.254.242";
			$("#ip").text(ip_addr);
        })

		$(document).on('click', '#modal-confirm1', function (e) {
			e.preventDefault();
			$.magnificPopup.close();
			var delid=$("#del").data('delid');
			alert(delid);
			new PNotify({
				title: 'Success!',
				text: 'Modal Confirm Message.',
				type: 'success'
			});
		});

		$("#passbtn").click(function () {
		    var passcontent=$("#passcontent").val();
			var pass=document.getElementById("pass").checked;
            var userid=$("#userid").text();
            var fileid=$.trim($("#fileid").text());
            var loginuserid=$("#loginuserid").val();
//            alert(passcontent);
//            alert(pass);
//			alert(userid);
//			alert(fileid);
			$.post("${pageContext.request.contextPath}/ajax/messageadd.action",{
			    "title":"文件审核通知",
			    "sender":loginuserid,
				"receiver":userid,
				"fileid":fileid,
				"content":passcontent,
				"pass":pass
			},function (data) {
				if(data.addFlag){
				    alert("文件审核成功");
				    window.location.href="${pageContext.request.contextPath}/file_list.action";
				}else{
				    alert("文件审核失败");
				}
            });
        })

		function topfiles() {
			$.post("${pageContext.request.contextPath}/ajax/topfile.action",function (data) {
				var str="";
				//alert(data.topfiles);
				str+="\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t<div class=\"carousel-inner\">\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t<div class=\"item active\">\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t\t<a class=\"panel-body bk-bg-very-light-gray bk-bg-lighten bk-padding-off-top bk-padding-off-bottom\">\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t\t\t<div class=\"pull-left bk-margin-top-10 bk-margin-right-10\">\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<div class=\"bk-round bk-bg-darken bk-border-off bk-icon bk-icon-2x bk-icon-default bk-bg-warning\">\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<i class=\"fa  fa-plane fa-2x\"></i>\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</div>\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t\t\t</div>\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t\t\t<h5 class=\"bk-fg-warning bk-fg-darken bk-margin-off-bottom\"><strong>" +
					"No.1 "+
					data.topfiles[0].name +
					"</strong></h5>\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t\t\t<p>\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<small>" +
					data.topfiles[0].remark +
					"</small>\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t\t\t</p>\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t\t</a>\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t\t<hr class=\"bk-margin-off\" />\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t\t<div class=\"panel-body bk-bg-very-light-gray bk-padding-5 text-center\">\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t\t\t<a href=\"" +
					"${pageContext.request.contextPath}/file_detail.action?id=" +
                    data.topfiles[0].id	+
					"\" class=\"bk-fg-warning bk-fg-lighten\"><small><i class=\"fa fa-file-text-o\"></i> 点击这里了解详情 </small></a>\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t\t</div>\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t</div>\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t<div class=\"item\">\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t\t<a class=\"panel-body bk-bg-very-light-gray bk-bg-lighten bk-padding-off-top bk-padding-off-bottom\">\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t\t\t<div class=\"pull-left bk-margin-top-10 bk-margin-right-10\">\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<div class=\"bk-round bk-bg-darken bk-border-off bk-icon bk-icon-2x bk-icon-default bk-bg-info\">\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<i class=\"fa  fa-truck fa-2x\"></i>\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</div>\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t\t\t</div>\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t\t\t<h5 class=\"bk-fg-info bk-fg-darken bk-margin-off-bottom\"><strong>" +
                    "No.2 "+
                    data.topfiles[1].name +
					"</strong></h5>\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t\t\t<p>\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<small>" +
                    data.topfiles[1].remark +
					"</small>\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t\t\t</p>\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t\t</a>\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t\t<hr class=\"bk-margin-off\" />\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t\t<div class=\"panel-body bk-bg-very-light-gray bk-padding-5 text-center\">\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t\t\t<a href=\"" +
                    "${pageContext.request.contextPath}/file_detail.action?id=" +
                    data.topfiles[1].id	+
					"\" class=\"bk-fg-info bk-fg-lighten\"><small><i class=\"fa fa-file-text-o\"></i> 点击这里了解详情 </small></a>\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t\t</div>\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t</div>\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t<div class=\"item\">\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t\t<a class=\"panel-body bk-bg-very-light-gray bk-bg-lighten bk-padding-off-top bk-padding-off-bottom\">\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t\t\t<div class=\"pull-left bk-margin-top-10 bk-margin-right-10\">\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<div class=\"bk-round bk-bg-darken bk-border-off bk-icon bk-icon-2x bk-icon-default bk-bg-primary\">\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<i class=\"fa fa-send-o fa-2x\"></i>\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</div>\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t\t\t</div>\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t\t\t<h5 class=\"bk-fg-primary bk-fg-darken bk-margin-off-bottom\"><strong>" +
                    "No.3 "+
                    data.topfiles[2].name +
					"</strong></h5>\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t\t\t<p>\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<small>" +
                    data.topfiles[2].remark+
                	"</small>\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t\t\t</p>\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t\t</a>\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t\t<hr class=\"bk-margin-off\" />\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t\t<div class=\"panel-body bk-bg-very-light-gray bk-padding-5 text-center\">\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t\t\t<a href=\"" +
                    "${pageContext.request.contextPath}/file_detail.action?id=" +
                    data.topfiles[2].id	+
					"\" class=\"bk-fg-primary bk-fg-lighten\"><small><i class=\"fa fa-file-text-o\"></i> 点击这里了解详情 </small></a>\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t\t</div>\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t</div>\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t</div>\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t"+"<a class=\"left carousel-control bk-carousel-control bk-carousel-control-white bk-carousel-hide-init\" href=\"#carousel-example-generic3\" role=\"button\" data-slide=\"prev\">\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t<span class=\"fa fa-angle-left icon-prev bk-bg-very-light-gray\"></span>\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t</a>\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t<a class=\"right carousel-control bk-carousel-control bk-carousel-control-white bk-carousel-hide-init\" href=\"#carousel-example-generic3\" role=\"button\" data-slide=\"next\">\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t\t<span class=\"fa fa-angle-right icon-next\"></span>\n" +
                    "\t\t\t\t\t\t\t\t\t\t\t</a>";
				var topfilediv=$("#carousel-example-generic3");
				topfilediv.append(str);
            })
        }
        topfiles();
        
       	function judge() {
			var loginuserid=$("#loginuserid").val();
			var userid=$.trim($("#userid").text());
//			alert(loginuserid);
//			alert(userid);
			if(loginuserid==userid){
//			    alert(1);
			    $("#edit").show();
			    $("#del").show();
			}else {
//			    alert(2);
                $("#edit").hide();
                $("#del").hide();
			}
        }
        judge();
	</script>
	</body>
	
</html>