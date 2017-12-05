
<!DOCTYPE html>
<html lang="en">
<!-- header -->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title> 模拟考试系统 </title>

    <!-- Bootstrap -->
    <link href="${basePath}/static/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${basePath}/static/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
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
        <div class="right_col" role="main">
            <div class="row black">

                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>资料修改</h2>

                            <!-- 右侧工具栏 -->
                            <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>

                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="#">Settings 1</a></li>
                                        <li><a href="#">Settings 2</a></li>
                                    </ul>
                                </li>
                                <li><a class="close-link"><i class="fa fa-close"></i></a></li>
                            </ul>

                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">

                            <div class="x_content">
                                <br>
                                <!-- 验证 -->
                                <div class="alert alert-warning hidden" id="alert-warning">
                                    状态
                                </div>

                                <form class="form-horizontal form-label-left input_mask" id="form">

                                    <input type="hidden" value="${token.id}" id="id" name="id">
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">昵称: </label>

                                        <div class="col-md-2 col-sm-2 col-xs-12" id="nickname">
                                            <input readonly="readonly"  class="form-control col-md-2 col-xs-12" value="${token.nickname?default('未设置')}" placeholder="请输入昵称">
                                        </div>

                                        <div class="col-md-2 col-sm-2 col-xs-12 hidden" id="nickname_change">
                                            <input type="text" required="required" class="form-control col-md-2 col-sm-2 col-xs-12" name="nickname" maxlength="8" autocomplete="off" value="">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Email（不准修改）:</label>
                                        <div class="col-md-2 col-sm-2 col-xs-12" id="email">
                                            <input readonly="readonly" class="form-control col-md-2 col-xs-12" value="${token.email?default('未设置')}" placeholder="请输入帐号" readonly="true">
                                        </div>

                                        <div class="col-md-2 col-sm-2 col-xs-12 hidden" id="email_change">
                                            <input type="text" required="required" class="form-control col-md-2 col-sm-2 col-xs-12" name="email" value="">
                                        </div>
                                    </div>

                                </form>


                                <div class="ln_solid"></div>
                                <div class="form-group">
                                    <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">

                                        <button type="button" class="btn btn-primary" id="go_back">返回列表</button>
                                        <button type="button" class="btn btn-warning" id="edit">修改</button>
                                        <button type="button" class="btn btn-success hidden" id="submit">提交</button>
                                    </div>
                                </div>


                            </div>

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
<!-- 工具类 -->
<script src="${basePath}/static/src/js/util.js "></script>
<!-- Layer -->
<script type="text/javascript" charset="utf8" src="${basePath}/static/src/js/layer/layer.js"></script>
<!-- 自定义扩展JS -->
<script src="${basePath}/static/build/js/custom.js"></script>
<!-- 退出url -->
<script baseUrl="${basePath}" src="${basePath}/static/build/js/user.login.js"></script>

<!-- jquery.serializeJSON -->
<script src="${basePath}/static/src/js/jquery.serializeJSON/jquery.serializejson.js"></script>

<script>
    $(document).ready(function() {
        //编辑
        $("#edit").click(function(){
            $("input").removeAttr("readonly");
            $("textarea").removeAttr("readonly");

            $("#nickname").addClass("hidden");
            $("#email").addClass("hidden");

            $("#nickname_change").removeClass("hidden");
            $("#email_change").removeClass("hidden");

            $("#submit").removeClass("hidden");
        });
        //返回列表
        $("#go_back").click(function(){
            history.go(-1);
        });

        //提交
        $("#submit").click(function(){
            var url = "${basePath}/user/updateSelf.shtml";
            var form = $('#form').serializeJSON();

            var data = {
                form : form,
            };

            if($("input[name = 'nickname']").val() == ""){
                layer.msg('昵称不能为空！',function(){});

                //添加验证状态
                $("#alert-warning").removeClass("hidden");
                $("#alert-warning").html("昵称不能为空");
                return;
            }

            var result = Util.ajaxHelper(url, 'POST', data);
            if(result.is_true){
                Util.notify(result.data.message, 1);

                $("input").attr("readonly", "readonly");
                $("textarea").attr("readonly", "readonly");
            }
        });
    } );

</script>
</body>
</html>
