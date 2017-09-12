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

    <title>文件列表</title>

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>


    <!-- Favicon and touch icons -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" type="image/x-icon"/>
    <link rel="apple-touch-icon" href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon.png"/>
    <link rel="apple-touch-icon" sizes="57x57"
          href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-57x57.png"/>
    <link rel="apple-touch-icon" sizes="72x72"
          href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-72x72.png"/>
    <link rel="apple-touch-icon" sizes="76x76"
          href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-76x76.png"/>
    <link rel="apple-touch-icon" sizes="114x114"
          href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-114x114.png"/>
    <link rel="apple-touch-icon" sizes="120x120"
          href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-120x120.png"/>
    <link rel="apple-touch-icon" sizes="144x144"
          href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-144x144.png"/>
    <link rel="apple-touch-icon" sizes="152x152"
          href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-152x152.png"/>

    <!-- start: CSS file-->

    <!-- Vendor CSS-->
    <link href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/assets/vendor/skycons/css/skycons.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/assets/vendor/font-awesome/css/font-awesome.min.css"
          rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/assets/vendor/css/pace.preloader.css" rel="stylesheet"/>

    <!-- Plugins CSS-->
    <link href="${pageContext.request.contextPath}/assets/plugins/bootkit/css/bootkit.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/assets/plugins/select2/select2.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/assets/plugins/jquery-datatables-bs3/css/datatables.css"
          rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/assets/plugins/pnotify/css/pnotify.custom.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/assets/plugins/magnific-popup/css/magnific-popup.css"
          rel="stylesheet"/>

    <!-- Theme CSS -->

    <link href="${pageContext.request.contextPath}/assets/css/jquery.mmenu.css" rel="stylesheet"/>

    <!-- Page CSS -->
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/assets/css/add-ons.min.css" rel="stylesheet"/>

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
        <div class="main sidebar-minified">
            <!-- Page Header -->
            <div class="page-header">
                <div class="pull-left">

                </div>
                <div class="pull-right">
                    <h2>文件列表</h2>
                </div>
            </div>
            <!-- End Page Header -->
            <!-- Modal Danger -->

            <s:form namespace="/" action="file_list" theme="simple" method="post">
                <div class="form-group col-md-4">
                    <label class="col-md-3 control-label" for="id">文件id</label>
                    <div class="col-md-9">
                        <input id="id" name="id" class="form-control" placeholder="请输入文件id">
                    </div>
                </div>
                <div class="form-group col-md-4">
                    <label class="col-md-3 control-label" for="name">文件名称</label>
                    <div class="col-md-9">
                        <s:textfield id="name" name="name" cssClass="form-control" placeholder="请输入文件名称"></s:textfield>
                    </div>
                </div>
                <s:if test="%{#session.loginUser.role==1 }">
                <div class="form-group col-md-4">
                    <label class="col-md-3 control-label" for="userid">用户id</label>
                    <div class="col-md-9">
                        <s:textfield id="userid" name="userid" cssClass="form-control"
                                     placeholder="请输入上传用户id"></s:textfield>
                    </div>
                </div>
               
                
                <div class="form-group col-md-4">
                    <label class="col-md-3 control-label" for="open">状态</label>
                    <div class="col-md-9">
                            <%--                         <s:select list="#{'0':'未开放','1':'已开放下载' }" id="open" name="open" cssClass="form-control" size="1" headerKey="" headerValue="--选择状态--"></s:select>
                             --%> <select id="open" name="open" class="form-control" size="1">
                        <option selected value="">--选择状态--</option>
                        <option value="1">未开放</option>
                        <option value="2">已开放下载</option>
                    </select>
                    </div>
                </div>
                 </s:if>
                <div class="form-group col-md-4">
                    <label class="col-md-3 control-label" for="kindid">类别</label>
                    <div class="col-md-9" id="kindlist">
                            <%--<s:select list="#{'1':'资料','2':'图片','3':'视频','4':'音乐' }" id="kindid" name="kindid" cssClass="form-control" size="1" headerKey="" headerValue="--选择类别--"></s:select>--%>
                    </div>
                </div>
                <div class="form-group col-md-12">
                    <button class="bk-margin-5 btn btn-labeled btn-success" type="submit" style="margin-right: 10px">
                        <span class="btn-label"><i class="fa fa-check"></i></span>查询
                    </button>
                    <button class="bk-margin-5 btn btn-labeled btn-info" type="reset">
                        <span class="btn-label"><i class="fa fa-refresh"></i></span>重置
                    </button>
                </div>
            </s:form>

            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="panel panel-default bk-bg-white">
                        <div class="panel-heading bk-bg-white">
                            <h6><i class="fa fa-user red"></i><span class="break"></span>文件列表</h6>
                            <div class="panel-actions">
                                <a href="#" class="btn-minimize"><i class="fa fa-caret-up"></i></a>
                                <a href="#" class="btn-close"><i class="fa fa-times"></i></a>
                            </div>
                        </div>
                        <div class="panel-body">
                            <table class="table table-bordered table-striped" id="datatable-default">
                                <thead>
                                <tr>
                                    <th>文件id</th>
                                    <th>文件名称</th>
                                    <th>文件类型</th>
                                    <th>文件大小</th>
                                    <th>上传用户id</th>
                                    <th>上传日期</th>
                                    <th>文件状态</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <s:iterator value="uploadFiles" var="uploadFile">
                                    <tr>
                                        <td id="fileid">
                                            <s:property value="id"/>
                                        </td>
                                        <td>
                                            <s:property value="name"/>
                                        </td>
                                        <td>
                                            <s:property value="kind"/>
                                        </td>
                                        <td>
                                            <s:if test="%{#uploadFile.filesize<1048576}">
                                                <s:text name="global.format.number"><s:param
                                                        value="filesize/1024.0"/></s:text>
                                                <span>&nbsp;KB</span>
                                            </s:if>
                                            <s:else>
                                                <s:text name="global.format.number"><s:param
                                                        value="filesize/1048576.0"/></s:text>
                                                <span>&nbsp;MB</span>
                                            </s:else>
                                        </td>
                                        <td>
                                            <s:property value="userid"/>
                                        </td>
                                        <td>
                                            <s:property value="uploaddate"/>
                                        </td>
                                        <td>
                                            <s:if test="%{#uploadFile.open==2}">
                                                <span class="label label-success">已开放下载</span>
                                            </s:if>
                                            <s:else>
                                                <span class="label label-danger">未开放</span>
                                            </s:else>
                                        </td>
                                        <td>
                                            <s:a class="btn btn-success" action="file_detail" namespace="/">
                                                <s:param name="id" value="id"></s:param>
                                                <i class="fa fa-search-plus "></i>
                                            </s:a>
                                            <s:a cssClass="btn btn-primary" action="file_download" namespace="/">
                                                <s:param name="id" value="id"></s:param>
                                                <i class="fa fa-download "></i>
                                            </s:a>
                                            
											<s:if test="%{#session.loginUser.id==userid}">
                                            <s:a cssClass="btn btn-info" action="file_editview" namespace="/">
                                                <s:param name="id" value="id"></s:param>
                                                <i class="fa fa-edit "></i>
                                            </s:a>

                                            <s:a cssClass="btn btn-danger" action="file_delete" namespace="/">
                                                <s:param name="id" value="id"></s:param>
                                                <i class="fa fa-trash-o "></i>
                                            </s:a>
                                            </s:if>
                                        </td>
                                    </tr>
                                </s:iterator>
                                </tbody>
                            </table>
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
<script src="${pageContext.request.contextPath}/assets/plugins/moment/js/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/select2/select2.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/jquery-datatables/media/js/jquery.dataTables.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/jquery-datatables/extras/TableTools/js/dataTables.tableTools.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/jquery-datatables-bs3/js/datatables.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/sparkline/js/jquery.sparkline.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/pnotify/js/pnotify.custom.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/magnific-popup/js/magnific-popup.js"></script>

<!-- Theme JS -->
<script src="${pageContext.request.contextPath}/assets/js/jquery.mmenu.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/core.min.js"></script>

<!-- Pages JS -->
<script src="${pageContext.request.contextPath}/assets/js/pages/table-advanced.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/pages/ui-modals.js"></script>


<!-- end: JavaScript-->

<script type="text/javascript">
    function kindlist() {
        var kindlist = $("#kindlist");
        $.post("${pageContext.request.contextPath}/ajax/leaflist.action", function (data) {
            var str = "<select id=\"select\" name=\"kindid\" class=\"form-control required\" size=\"1\">\n" +
                "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<option value=\"0\">--选择类别--</option>";
            var kind = data.leaflist;
            $.each(kind, function (n, kind) {
                str += "<option value=\"" +
                    kind.id +
                    "\">" +
                    kind.name +
                    "</option>"

            })
            str += "</select>";
            str.slice(10);
            kindlist.append(str);
        })
    }

    kindlist();
</script>

</body>

</html>