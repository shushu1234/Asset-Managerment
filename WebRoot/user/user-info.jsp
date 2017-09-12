<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">

<head>

    <!-- Basic -->
    <meta charset="UTF-8"/>

    <title>个人中心</title>

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>


    <!-- Favicon and touch icons -->
    <link rel="shortcut icon" href="assets/ico/favicon.ico" type="image/x-icon"/>
    <link rel="apple-touch-icon" href="assets/ico/apple-touch-icon.png"/>
    <link rel="apple-touch-icon" sizes="57x57" href="assets/ico/apple-touch-icon-57x57.png"/>
    <link rel="apple-touch-icon" sizes="72x72" href="assets/ico/apple-touch-icon-72x72.png"/>
    <link rel="apple-touch-icon" sizes="76x76" href="assets/ico/apple-touch-icon-76x76.png"/>
    <link rel="apple-touch-icon" sizes="114x114" href="assets/ico/apple-touch-icon-114x114.png"/>
    <link rel="apple-touch-icon" sizes="120x120" href="assets/ico/apple-touch-icon-120x120.png"/>
    <link rel="apple-touch-icon" sizes="144x144" href="assets/ico/apple-touch-icon-144x144.png"/>
    <link rel="apple-touch-icon" sizes="152x152" href="assets/ico/apple-touch-icon-152x152.png"/>

    <!-- start: CSS file-->

    <!-- Vendor CSS-->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="assets/vendor/skycons/css/skycons.css" rel="stylesheet"/>
    <link href="assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
    <link href="assets/vendor/css/pace.preloader.css" rel="stylesheet"/>

    <!-- Plugins CSS-->
    <link href="assets/plugins/bootkit/css/bootkit.css" rel="stylesheet"/>
    <link href="assets/plugins/scrollbar/css/mCustomScrollbar.css" rel="stylesheet"/>
    <link href="assets/plugins/magnific-popup/css/magnific-popup.css" rel="stylesheet"/>
    <link href="assets/plugins/jquery-ui/css/jquery-ui-1.10.4.min.css" rel="stylesheet"/>

    <!-- Theme CSS -->
    <link href="assets/css/jquery.mmenu.css" rel="stylesheet"/>

    <!-- Page CSS -->
    <link href="assets/css/style.css" rel="stylesheet"/>
    <link href="assets/css/add-ons.min.css" rel="stylesheet"/>

    <!-- end: CSS file-->


    <!-- Head Libs -->
    <script src="assets/plugins/modernizr/js/modernizr.js"></script>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        .file {
            position: relative;
            display: inline-block;
            background: #D0EEFF;
            border: 1px solid #99D3F5;
            border-radius: 4px;
            padding: 4px 12px;
            overflow: hidden;
            color: #1E88C7;
            text-decoration: none;
            text-indent: 0;
            line-height: 20px;
        }

        .file input {
            position: absolute;
            font-size: 100px;
            right: 0;
            top: 0;
            opacity: 0;
        }

        .file:hover {
            background: #AADFFD;
            border-color: #78C3F3;
            color: #004974;
            text-decoration: none;
        }

        }
    </style>

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
        <div class="main">
            <!-- Page Header -->
            <div class="page-header">
                <div class="pull-left">
                </div>
                <div class="pull-right">
                    <h2>个人信息</h2>
                </div>
            </div>
            <!-- End Page Header -->
            <div class="row profile">
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <div class="panel">
                        <div class="panel-body">
                            <div class="text-left bk-bg-white bk-padding-top-40 bk-padding-bottom-10">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 bk-vcenter text-center">
                                        <div class="bk-avatar">
                                            <%--<img src="assets/img/avatar.jpg" alt="" class="img-circle bk-img-120 bk-border-light-gray bk-border-3x" />--%>
                                            <img id="preview" src="
													<s:if test="%{op=='login'}">
														 <s:property value="%{#session.loginUser.avatarpath}"/>
													</s:if>
													<s:elseif test="%{model==null}">
														 <s:property value="%{#session.loginUser.avatarpath}"/>
													</s:elseif>
													<s:else>
														 <s:property value="model.avatarpath"/>
													</s:else>" height="200" alt="头像预览"
                                                 class="img-circle bk-img-120 bk-border-light-gray bk-border-3x"><br><br>
                                            <%--<a href="javascript:;" class="file">点击更换头像--%>
                                                <%--<input type="file" name="" id="" onchange="previewFile()">--%>
                                            <%--</a>--%>
                                        </div>
                                        <h4 class="bk-margin-top-10 bk-docs-font-weight-300">
                                            <s:if test="%{op=='login'}">
                                                <s:property value="%{#session.loginUser.name}"/>
                                            </s:if>
                                            <s:elseif test="%{model==null}">
                                                <s:property value="%{#session.loginUser.name}"/>
                                            </s:elseif>
                                            <s:else>
                                                <s:property value="model.name"/>
                                            </s:else>
                                        </h4>
                                    </div>
                                    <hr class="bk-margin-off"/>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <a class="col-xs-4 bk-bg-white bk-fg-primary bk-padding-top-20 bk-padding-bottom-20 text-center">
                                            <i class="fa fa-phone">&nbsp;
                                                <s:if test="%{op=='login'}">
                                                    <s:property value="%{#session.loginUser.tel}"/>
                                                </s:if>
                                                <s:elseif test="%{model==null}">
                                                    <s:property value="%{#session.loginUser.tel}"/>
                                                </s:elseif>
                                                <s:else>
                                                    <s:property value="model.tel"/>
                                                </s:else>
                                            </i>
                                        </a>
                                        <a class="col-xs-4 bk-bg-white bk-fg-success bk-padding-top-20 bk-padding-bottom-20 text-center">
                                            <i class="fa fa-envelope">&nbsp;
                                                <s:if test="%{op=='login'}">
                                                    <s:property value="%{#session.loginUser.email}"/>
                                                </s:if>
                                                <s:elseif test="%{model==null}">
                                                    <s:property value="%{#session.loginUser.email}"/>
                                                </s:elseif>
                                                <s:else>
                                                    <s:property value="model.email"/>
                                                </s:else>
                                            </i>
                                        </a>
                                        <a class="col-xs-4 bk-bg-white bk-fg-danger bk-padding-top-20 bk-padding-bottom-20 text-center">
                                            <i class="fa fa-male">&nbsp;
                                                <s:if test="%{op=='login'}">
                                                    <s:property value="%{#session.loginUser.gender}"/>
                                                </s:if>
                                                <s:elseif test="%{model==null}">
                                                    <s:property value="%{#session.loginUser.gender}"/>
                                                </s:elseif>
                                                <s:else>
                                                    <s:property value="model.gender"/>
                                                </s:else>
                                            </i>
                                        </a>
                                    </div>
                                  </div>
                            </div>
                            <hr class="bk-margin-off"/>
                           <div class="bk-ltr bk-padding-bottom-20 bk-padding-left-20">
                                <div class="row">
                                    <div class="col-12-4 col-md-12 col-sm-12 col-xs-12 bk-bg-white bk-padding-top-10">
                                        <i class="fa fa-credit-card"></i>
                                        <span id="userid">
                                             <s:if test="%{op=='login'}">
                                                 <s:property value="%{#session.loginUser.id}"/>
                                             </s:if>
                                        <s:elseif test="%{model==null}">
                                            <s:property value="%{#session.loginUser.id}"/>
                                        </s:elseif>
                                        <s:else>
                                            <s:property value="model.id"/>
                                        </s:else>
                                        </span>
                                    </div>
                                    <div class="col-12-4 col-md-12 col-sm-12 col-xs-12 bk-bg-white bk-padding-top-10">
                                        <i class="fa fa-user"></i>
                                        <span id="role">
                                             <s:if test="%{op=='login'}">
                                                 <s:if test="%{#session.loginUser.role=='1'.toString()}">管理员</s:if>
                                                 <s:else>用户</s:else>
                                             </s:if>
                                        <s:elseif test="%{model==null}">
                                            <s:if test="%{#session.loginUser.role=='1'.toString()}">管理员</s:if>
                                                 <s:else>用户</s:else>
                                        </s:elseif>
                                        <s:else>
                                            <s:if test="%{model.role=='1'.toString()}">管理员</s:if>
                                                 <s:else>用户</s:else>
                                        </s:else>
                                        </span>
                                    </div>


                                </div>
                            </div>

                            <s:if test="%{#session.loginUser.role==1}">
                            <div class="form-group">
                                <div class="col-md-9">
                                    <div class="checkbox-custom checkbox-inline">
                                        <input type="checkbox" id="admin" name="inline-checkbox1" value="option1">
                                        <label for="admin">设为管理员</label>
                                    </div>
                                    <button class="bk-margin-5 btn btn-info" id="adminbtn">提交</button>
                                </div>
                            </div>
                            </s:if>
                        </div>
                    </div>
                </div>
            </div>

            <div class="timeline">
                <div class="tm-body">
                    <div class="tm-title">
                        <h3 class="h5 text-uppercase">June 2017</h3>
                    </div>
                    <ol class="tm-items">
                        <%--<li>--%>
                            <%--<div class="tm-info">--%>
                                <%--<div class="tm-icon"><i class="fa fa-file"></i></div>--%>
                                <%--<time class="tm-datetime" datetime="2015-03-27 09:34">--%>
                                    <%--<div class="tm-datetime-date bk-bg-white bk-radius text-center bk-padding-5">3months ago.</div>--%>
                                    <%--<div class="tm-datetime-time">09:34 PM</div>--%>
                                <%--</time>--%>
                            <%--</div>--%>
                            <%--<div class="tm-box">--%>
                                <%--<p>--%>
                                    <%--Lorem <span class="text-primary">#Responsive Admin</span>--%>
                                <%--</p>--%>
                            <%--</div>--%>
                        <%--</li>--%>

                    </ol>
              </div>
            </div>

        </div>
        <!-- End Main Page -->


    </div>
</div><!--/container-->


<div class="clearfix"></div>


<!-- start: JavaScript-->

<!-- Vendor JS-->
<script src="assets/vendor/js/jquery.min.js"></script>
<script src="assets/vendor/js/jquery-2.1.1.min.js"></script>
<script src="assets/vendor/js/jquery-migrate-1.2.1.min.js"></script>
<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/vendor/skycons/js/skycons.js"></script>
<script src="assets/vendor/js/pace.min.js"></script>

<!-- Plugins JS-->
<script src="assets/plugins/jquery-ui/js/jquery-ui-1.10.4.min.js"></script>
<script src="assets/plugins/scrollbar/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="assets/plugins/bootkit/js/bootkit.js"></script>
<script src="assets/plugins/moment/js/moment.min.js"></script>
<script src="assets/plugins/magnific-popup/js/magnific-popup.js"></script>
<script src="assets/plugins/sparkline/js/jquery.sparkline.min.js"></script>

<!-- Theme JS -->
<script src="assets/js/jquery.mmenu.min.js"></script>
<script src="assets/js/core.min.js"></script>

<!-- Pages JS -->
<script src="assets/js/pages/profile.js"></script>

<!-- end: JavaScript-->
<script type="text/javascript">

    function previewFile() {
        var preview = document.getElementById('preview');
        var file = document.querySelector('input[type=file]').files[0];
        var reader = new FileReader();

        reader.addEventListener("load", function () {
            preview.src = reader.result;
        }, false);

        if (file) {
            reader.readAsDataURL(file);
        }
    }
    
    function activity() {
    	
        var queryuserid=$.trim($("#userid").text());
       // alert(queryuserid);
        var ol=$(".tm-items");
        $.post("${pageContext.request.contextPath}/ajax/listuserfiles.action",{"queryuserid":queryuserid},function (data){
            var str="";
            var files=data.userfiles;
            $.each(files,function (n,file) {
//               alert(file.uploaddate);
                str+="<li>\n" +
                    "                            <div class=\"tm-info\">\n" +
                    "                                <div class=\"tm-icon\"><i class=\"fa fa-file\"></i></div>\n" +
                    "                                <time class=\"tm-datetime\" datetime=\"2015-03-27 09:34\">\n" +
                    "                                    <div class=\"tm-datetime-date bk-bg-white bk-radius text-center bk-padding-5\">" +
                    file.uploaddate.slice(0,10)+
                    "</div>\n" +
                    "                                    <div class=\"tm-datetime-time\">" +
                    file.uploaddate.slice(10) +
                    "</div>\n" +
                    "                                </time>\n" +
                    "                            </div>\n" +
                    "                        <a href=\'" +
                     " ${pageContext.request.contextPath}/file_detail.action?id="+
                        file.id+
                    "\'>    <div class=\"tm-box\">\n" +
                    "                                <p>\n" +
                    "上传文件："+file.name +
                    " <span class=\"text-primary\"></span>\n" +
                    "                                </p>\n" +
                    "                            </div></a>\n" +
                    "                        </li>";

            })
            ol.append(str);



        })
    }
    activity();

    $("#adminbtn").click(function () {

            if ($("#admin").is(":checked")){
                var userid=$.trim($("#userid").text());
               // alert(userid);
                $.post("${pageContext.request.contextPath}/ajax/setadmin.action",{"userid":userid},function (data) {
                    if (data.setadmin){
                        alert("设置管理员成功");
                    }else {
                        alert("设置管理员失败");
                    }
                })
            }
    })
</script>

</body>

</html>