
<!DOCTYPE html>
<html lang="en">
<!-- header -->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title> 模拟考试系统 - 修改密码</title>

    <!-- Bootstrap -->
    <link href="${basePath}/static/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${basePath}/static/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="${basePath}/static//vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- 自定义样式 -->
    <link href="${basePath}/static/build/css/custom.css" rel="stylesheet">
    <style>
        .title{
            display: block;
            font-size: 2em;
            -webkit-margin-before: 0.67em;
            -webkit-margin-after: 0.67em;
            -webkit-margin-start: 0px;
            -webkit-margin-end: 0px;
            font-weight: bold;
            color: #000000;
        }
        .black{
            color: #000000;
        }
        .btn-bg-color{
            background-color:#00FFFF;
        }


    </style>
</head>
<!-- /header -->
<body class="nav-md">
<div class="container body">
    <div class="main_container">

        <!-- 左侧导航 -->
        <div class="col-md-3 left_col">

        <@left.left 1/>

        </div>

        <!-- 右侧顶部导航 -->
        <div class="top_nav">
        <@top.top 1/>
        </div>
        <!-- /右侧顶部导航 -->

        <!-- 页面内容 -->
        <div class="right_col black" role="main">
            <div class="row">

                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>密码修改</h2>

                            <!-- 右侧工具栏 -->
                            <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                <li><a class="close-link"><i class="fa fa-close"></i></a></li>
                            </ul>

                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">

                            <form id="formId" enctype="multipart/form-data" action="${basePath}/user/updatePswd.shtml" method="post">
                            <table class="table table-bordered">

                                <tbody>
                                <tr>
                                    <td class="text-center">
                                        <span class="form-control col-md-6 col-xs-12 ">
                                             原密码:
                                        </span>
                                    </td>
                                    <td class="text-center">
                                        <input type="password" id="pswd" maxlength="20" name="pswd"  placeholder="原密码" class="form-control col-md-6 col-xs-12 ">
                                    </td>
                                </tr>

                                <tr>
                                    <td class="text-center">
                                        <span class="form-control col-md-6 col-xs-12 ">
                                             新密码:
                                        </span>
                                    </td>
                                    <td class="text-center">
                                        <input type="password" id="newPswd" maxlength="20" name="newPswd" placeholder="新密码" class="form-control col-md-6 col-xs-12 " >
                                    </td>
                                </tr>

                                <tr>
                                    <td class="text-center">
                                        <span class="form-control col-md-6 col-xs-12 ">
                                             新密码（再输入一次）:
                                        </span>
                                    </td>
                                    <td class="text-center">
                                        <input type="password" id="reNewPswd" maxlength="20" name="reNewPswd" placeholder="新密码（再输入一次）" class="form-control col-md-6 col-xs-12 " >
                                    </td>
                                </tr>

                                <tr>
                                    <th class="text-center" colspan="2">
                                        <button type="submit" class="btn btn-success btn-lg">确定修改</button>
                                    </th>
                                </tr>
                                </tbody>
                            </table>
                            </form>



                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /页面内容 -->

        <!-- 脚部内容 -->
    <@footer.footer 1/>
        <!-- /脚部内容  -->
    </div>
</div>
<!-- jQuery -->
<script src="${basePath}/static/vendors/jquery/dist/jquery.min.js "></script>
<!-- Bootstrap -->
<script src="${basePath}/static/vendors/bootstrap/dist/js/bootstrap.min.js "></script>
<!-- NProgress -->
<script src="${basePath}/static/vendors/nprogress/nprogress.js"></script>
<!-- 工具类 -->
<script src="${basePath}/static/src/js/util.js "></script>
<!-- Layer -->
<script type="text/javascript" charset="utf8" src="${basePath}/static/src/js/layer/layer.js"></script>
<!-- 自定义扩展JS -->
<script src="${basePath}/static/build/js/custom.js"></script>
<!-- 退出url -->
<script baseUrl="${basePath}" src="${basePath}/static/build/js/user.login.js"></script>
<!-- jquery-form -->
<script src="${basePath}/static/assets/js/jquery.form-2.82.js?${_v}"></script>
<script>
    $(function(){
        var load;
        $("#formId").ajaxForm({
            success:function (result){
                layer.close(load);
                if(result && result.status != 200){
                    return layer.msg(result.message,function(){}),!1;
                }else{
                    layer.msg('操作成功！');
                    $("form :password").val('');
                }
            },
            beforeSubmit:function(){
                //判断参数
                if($.trim($("#pswd").val()) == ''){
                    layer.msg('请输入原密码',function(){});
                    $("#pswd").parent().removeClass('has-success').addClass('has-error');
                    return !1;
                }else{
                    $("#pswd").parent().removeClass('has-error').addClass('has-success');
                }
                if($.trim($("#newPswd").val()) == ''){
                    layer.msg('请输入新密码',function(){});
                    $("#newPswd").parent().removeClass('has-success').addClass('has-error');
                    return !1;
                }else{
                    $("#newPswd").parent().removeClass('has-error').addClass('has-success');
                }
                if($.trim($("#reNewPswd").val()) == ''){
                    layer.msg('请再次输入新密码',function(){});
                    $("#reNewPswd").parent().removeClass('has-success').addClass('has-error');
                    return !1;
                }else{
                    $("#reNewPswd").parent().removeClass('has-error').addClass('has-success');
                }
                if($("#reNewPswd").val() != $("#newPswd").val()){
                    return layer.msg('2次新密码输入不一致。',function(){}),!1;
                }
                load = layer.load('正在提交！！！');
            },
            dataType:"json",
            clearForm:false
        });

    });
</script>

</body>
</html>
