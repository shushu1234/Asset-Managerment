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

    <title>Fileware</title>

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
                <div class="login-box">
                    <div class="panel">
                        <div class="panel-body">
                            <div class="header bk-margin-bottom-20 text-center">
                                <img src="${pageContext.request.contextPath}/assets/img/logo.png"
                                     style="padding-left: 0px" class="img-responsive" alt=""/>
                                <h4> 用 户 登 录 </h4>
                            </div>
                            <%-- 									<form class="form-horizontal login" action="${pageContext.request.contextPath}/user_login.action" method="post"> --%>
                            <s:form action="user_login" namespace="/" method="post" cssClass="form-horizontal login"
                                    theme="simple">
                                <s:actionerror cssStyle="list-style:none;" cssClass="alert alert-danger"/>
                                <div class="bk-padding-left-20 bk-padding-right-20">
                                    <div class="form-group">
                                        <label>账号/邮箱 </label>
                                        <div class="input-group input-group-icon">
                                            <!-- <input type="text" class="form-control bk-radius" name="id" placeholder="请输入学号或工号"/> -->
                                            <s:textfield name="info" cssClass="form-control bk-radius"
                                                         placeholder="请输入账号或邮箱" id="info"></s:textfield>
                                            <span class="input-group-addon">
														<span class="icon">
															<i class="fa fa-user"></i>
														</span>
													</span>
                                        </div>
                                        <s:fielderror fieldName="id"
                                                      cssStyle="margin-top:5px;color: #ff0714;list-style: none;"></s:fielderror>
                                        <div id="useridinfo1" style="color: red;display: none;">该账号不存在,请检查或去注册</div>
                                        <div id="useridinfo2" style="color: red;display: none;">该邮箱不存在,请检查或去注册</div>
                                    </div>
                                    <div class="form-group">
                                        <label> 密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码 </label>
                                        <div class="input-group input-group-icon">
                                            <!-- 								<input type="password" class="form-control bk-radius" name="pwd" placeholder="请输入密码"/> -->
                                            <s:password name="pwd" cssClass="form-control bk-radius"
                                                        placeholder="请输入密码"></s:password>
                                            <span class="input-group-addon">
														<span class="icon">
															<i class="fa fa-key"></i>
														</span>
													</span>
                                        </div>
                                        <s:fielderror fieldName="pwd"
                                                      cssStyle="margin-top:5px;color: #ff0714;list-style: none;"></s:fielderror>
                                    </div>
                                    <div class="row bk-margin-top-20 bk-margin-bottom-10">
                                        <div class="col-sm-8">
                                            <div class="checkbox-custom checkbox-default">
                                                <%--<input id="RememberMe" name="rememberme" type="checkbox"/>--%>
                                                <%--<label for="RememberMe">记住该账户</label>--%>
                                            </div>
                                        </div>
                                        <div class="col-sm-4 text-right">
                                            <button type="submit" class="btn btn-primary hidden-xs"> 登 录</button>
                                            <button type="submit"
                                                    class="btn btn-primary btn-block btn-lg visible-xs bk-margin-top-20">
                                                登 录
                                            </button>
                                        </div>
                                    </div>

                                    <p class="text-center">
                                        忘记了密码？<a
                                            href="${pageContext.request.contextPath}/user/user-recover.jsp">去重置!&nbsp;&nbsp;</a>还没有账户？<a
                                            href="${pageContext.request.contextPath}/user/user-regist.jsp">去注册!</a>
                                    </p>
                                </div>
                            </s:form>
                            <!-- </form> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Main Page -->
    </div>
</div><!--/container-->


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
<script src="${pageContext.request.contextPath}/assets/js/pages/page-login.js"></script>

<!-- end: JavaScript-->
<script type="text/javascript">
    $("#info").blur(function () {
        var userid = $("#info").val();
        var test=userid.split(".")[1];
        if(test=="com"){
           // alert(1);
            $.post("${pageContext.request.contextPath}/ajax/checkemail.action", {"useremail": userid}, function (data) {
                if (data.isExist == false) {
                    $("#useridinfo2").show();
                }
            });
        }
        else{
            //alert(2);
 //alert(userid);
            $.post("${pageContext.request.contextPath}/ajax/checkid.action", {"userid": userid}, function (data) {
                if (data.isExist == false) {
                    $("#useridinfo1").show();
                }
            });
        }
    })

    $("#id").keydown(function () {
        $("#useridinfo1").hide();
        $("#useridinfo2").hide();
    })

</script>
</body>

</html>