<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <!-- Basic -->
    <meta charset="UTF-8"/>

    <title>修改密码</title>

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

    <!-- Plugins CSS-->
    <link href="${pageContext.request.contextPath}/assets/plugins/bootkit/css/bootkit.css" rel="stylesheet"/>

    <!-- Theme CSS -->
    <link href="${pageContext.request.contextPath}/assets/css/jquery.mmenu.css" rel="stylesheet"/>

    <!-- Page CSS -->
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/assets/css/add-ons.min.css" rel="stylesheet"/>

    <style>
        footer {
            display: none;
        }
    </style>

    <!-- end: CSS file-->
    <style>
        .fielderrors {
            list-style: none;
            color: red;
            padding-top: 5px;
        }
    </style>
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
<!-- Start: Content -->
<div class="container-fluid content">
    <div class="row">
        <!-- Main Page -->
        <div id="content" class="col-sm-12 full">
            <div class="row">
                <div class="register-box">
                    <div class="panel">
                        <div class="panel-body">
                            <div class="header bk-margin-bottom-20 text-center">
                                <img src="${pageContext.request.contextPath}/assets/img/logo.png"
                                     style="padding-left: 0px" class="img-responsive" alt=""/>
                                <h4> 重 置 密 码 </h4>
                            </div>
                            <form class="form-horizontal login" action="${pageContext.request.contextPath}/user_recover.action" method="post">
                            	<input type="hidden" name="id" value='<s:property value="id"/>'>
                                <div class="bk-padding-left-20 bk-padding-right-20">
                                    <div class="form-group">
                                        <label>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</label>
                                        <div class="input-group input-group-icon">
                                            <input type="password" class="form-control bk-radius" name="pwd"
                                                   placeholder="请输入密码"/>
                                            <span class="input-group-addon">
														<span class="icon">
															<i class="fa fa-key"></i>
														</span>
													</span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label> 确认密码 </label>
                                        <div class="input-group input-group-icon">
                                            <input type="password" class="form-control bk-radius" id="password"
                                                   placeholder="请确认密码"/>
                                            <span class="input-group-addon">
														<span class="icon">
															<i class="fa fa-key"></i>
														</span>
													</span>
                                        </div>
                                    </div>
                                    <div class="row bk-margin-top-20 bk-margin-bottom-10">
                                        <div class="col-sm-8">
                                            <div class="checkbox-custom checkbox-default">
                                            </div>
                                        </div>
                                        <div class="col-sm-4 text-right">
                                            <button type="submit" class="btn btn-primary hidden-xs">  重 置</button>
                                            <button type="submit"
                                                    class="btn btn-primary btn-block btn-lg visible-xs bk-margin-top-20">
                                                重 置
                                            </button>
                                        </div>
                                    </div>

                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Main Page -->
    </div>
</div><!--/container-->
<!-- Modal Dialog -->


<!-- start: JavaScript-->

<!-- Vendor JS-->
<script src="${pageContext.request.contextPath}/assets/vendor/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/js/jquery-2.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/js/jquery-migrate-1.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/skycons/js/skycons.js"></script>

<!-- Plugins JS-->
<script src="${pageContext.request.contextPath}/assets/plugins/bootkit/js/bootkit.js"></script>

<!-- Theme JS -->
<script src="${pageContext.request.contextPath}/assets/js/jquery.mmenu.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/core.min.js"></script>

<!-- Pages JS -->
<script src="${pageContext.request.contextPath}/assets/js/pages/page-register.js"></script>

<!-- end: JavaScript-->
<script type="text/javascript">


</script>

</body>

</html>