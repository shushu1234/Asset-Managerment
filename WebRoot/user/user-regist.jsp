<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <!-- Basic -->
    <meta charset="UTF-8"/>

    <title>用户注册</title>

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
                                <h4> 用 户 注 册 </h4>
                            </div>

                            <s:form cssClass="form-horizontal register" action="user-regist" method="post" namespace="/"
                                    theme="simple" enctype="multipart/form-data" name="regist-form">
                                    <s:token></s:token>
                                <s:actionerror cssStyle="list-style:none;" cssClass="alert alert-danger"/>
                                <div class="bk-padding-left-20 bk-padding-right-20">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 bk-vcenter text-center">
                                        <div class="bk-avatar">
                                            <img id="preview"
                                                 src="${pageContext.request.contextPath}/assets/img/avatar.png"
                                                 height="200" alt="头像预览"
                                                 class="img-circle bk-img-120 bk-border-light-gray bk-border-3x"><br>
                                            <a href="javascript:;" class="file">点击更换头像
                                                <s:file name="upload" id="upload" onchange="previewFile()"></s:file>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>呢&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称</label>
                                        <!-- 												<input name="name" type="text" class="form-control" placeholder="请输入姓名" id="name"/>
                                         --> <s:textfield name="name" cssClass="form-control" placeholder="请输入姓名"
                                                          id="name"></s:textfield>
                                        <s:fielderror fieldName="name" cssClass="fielderrors"></s:fielderror>
                                    </div>
                                    <div class="form-group">
                                        <label>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱</label>
                                        <!-- 												<input name="email" type="email" class="form-control" placeholder="请输入邮箱" id="email"/>
                                         --> <s:textfield name="email" cssClass="form-control" placeholder="请输入邮箱"
                                                              id="useremail"></s:textfield>
                                        <s:fielderror fieldName="email" cssClass="fielderrors"></s:fielderror>
                                        <span style="color: red;display: none;" id="emailinfo">该邮箱已注册账户:(</span>
                                    </div>
                                    <div class="form-group">
                                        <label>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</label>
                                    <s:radio list="{'男','女'}" name="gender" value="男"></s:radio>
                                    </div>
                                    <div class="form-group">
                                        <label>电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话</label>
                                      <s:textfield name="tel" cssClass="form-control" placeholder="请输入电话号码"
                                        id="tel"></s:textfield>
                                        <s:fielderror fieldName="tel" cssClass="fielderrors"></s:fielderror>
                                        <span style="color: red;display: none;" id="telinfo">电话号码输入不正确</span>
                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <label>密码</label>
                                                <s:password name="pwd" cssClass="form-control bk-margin-bottom-10"
                                                                 placeholder="请输入密码" id="pwd"></s:password>
                                            </div>
                                            <div class="col-sm-6">
                                                <label>确认密码</label>
                                                <input name="pwdConfirm" type="password"
                                                       class="form-control bk-margin-bottom-10" placeholder="请确认密码"
                                                       id="pwdConfirm"/>
                                            </div>
                                        </div>
                                        <s:fielderror fieldName="pwd" cssClass="fielderrors"></s:fielderror>
                                        <span style="color: red;display: none;" id="pwdinfo">两次密码不一致,请检查</span>
                                    </div>
                                    <div class="row bk-margin-top-20 bk-margin-bottom-10">
                                        <div class="col-sm-8">
                                            <div class="checkbox-custom checkbox-default">
                                                <%--<input id="AgreeTerms" name="agreeterms" type="checkbox"/>--%>
                                                <%--<label for="AgreeTerms">我同意 <a href="#">用户协议</a></label>--%>
                                            </div>
                                        </div>
                                        <div class="col-sm-4 text-right">
                                            <button type="submit" class="btn btn-primary hidden-xs"  > 注 册</button>
                                            <button type="submit"
                                                    class="btn btn-primary btn-block btn-lg visible-xs bk-margin-top-20">
                                                注 册
                                            </button>
                                        </div>
                                    </div>
                                    <p class="text-center">已经有账号? <a
                                            href="${pageContext.request.contextPath}/user/user-login.jsp">去登录!</a>
                                </div>
                            </s:form>

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

    $("#useremail").blur(function () {
        var useremail=$("#useremail").val();
//        alert(useremail);
        $.post("${pageContext.request.contextPath}/ajax/checkemail.action",{"useremail":useremail},function (data) {
            if (data.isExist == true) {
                $("#emailinfo").show();
            }

        })
    });
     $("#useremail").keydown(function () {
         $("#emailinfo").hide();
     })
    $("#tel").blur(function () {
        var tel=$("#tel").val();
        if (tel.length<11){
            $("#telinfo").show();
        }
    })

    $("#tel").keydown(function () {
        $("#telinfo").hide();
    })

    $("#pwdConfirm").blur(function () {
        var pwd=$("#pwd").val();
        var pwdcon=$("#pwdConfirm").val();

        if (pwd!=pwdcon){
            $("#pwdinfo").show();
        }
    })
    $("#pwd").keydown(function () {
        $("#pwdinfo").hide();
    })
    $("#pwdConfirm").keydown(function () {
        $("#pwdinfo").hide();
    })
</script>

</body>

</html>