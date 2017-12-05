
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
            <div class="row">

                <div class="panel panel-primary">
                    <div class="panel-body">
                        <h4>个人资料</h4>
                    </div>

                    <div class="ln_solid"></div>

                    <form action="" method="post" id="_form">
                        <input type="hidden" name="id" value="${token.id}" id="id">
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th class="text-center" colspan="4"><span style="color:#FF4500;">您的到期时间为：2019-2-1 9:42:57</span></th>
                            </tr>
                            </thead>
                            <tbody>

                            <tr>
                                <td class="text-center">
                                <span class="form-control col-md-3 col-xs-12 ">
                                    账号名：
                                </span>
                                </td>
                                <td class="text-center">
                                    <input readonly="readonly"  class="form-control col-md-2 col-xs-12 "
                                           name= "nickname" id="nickname" value="${token.nickname?default('未设置')}" placeholder="请输入昵称">
                                </td>

                                <td class="text-center">
                            <span class="form-control col-md-3 col-xs-12">
                                    真实姓名：
                                </span>
                                </td>
                                <td class="text-center">
                                    <input readonly="readonly"  class="form-control col-md-3 col-xs-12 " value="${token.nickname?default('未设置')}" placeholder="密码">
                                </td>
                            </tr>

                            <tr>
                                <td class="text-center">
                            <span class="form-control col-md-3 col-xs-12">
                                    身份证号：
                                </span>
                                </td>
                                <td class="text-center">
                                    <input readonly="readonly"  class="form-control col-md-3 col-xs-12 " value="${token.nickname?default('未设置')}" placeholder="请输入昵称">
                                </td>

                                <td class="text-center">
                            <span class="form-control col-md-3 col-xs-12">
                                    手机号：
                                </span>
                                </td>
                                <td class="text-center">
                                    <input readonly="readonly"  class="form-control col-md-3 col-xs-12 " value="${token.nickname?default('未设置')}" placeholder="请输入昵称">
                                </td>
                            </tr>
                            <tr>
                                <td class="text-center">
                            <span class="form-control col-md-3 col-xs-12">
                                    帐号邮箱：
                                </span>
                                </td>
                                <td class="text-center">
                                <span class="form-control col-md-3 col-xs-12">
                                ${token.email?default('未设置')}
                                </span>
                                </td>

                                <td class="text-center">
                            <span class="form-control col-md-3 col-xs-12">
                                    地址
                                </span>
                                </td>
                                <td class="text-center">
                                    <input readonly="readonly"  class="form-control col-md-3 col-xs-12 " value="${token.nickname?default('未设置')}" placeholder="请输入昵称">
                                </td>
                            </tr>

                            <tr>
                                <td class="text-center">
                                    帐号邮箱：
                                </td>
                                <td class="text-center">
                                ${token.email?default('未设置')}
                                </td>

                                <td class="text-center">
                                    修改密码请点击
                                </td>
                                <td class="text-center">
                                    <a href="" style="color: red;"><b>修改密码</b><a>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-center">创建时间：</td>
                                <td class="text-center">2016-06-16 11:15</td>
                                <td class="text-center">最后登录时间：</td>
                                <td class="text-center">2017-12-01 17:01</td>
                            </tr>

                            <tr>
                                <th class="text-center" colspan="4">
                                    <button type="button" class="btn btn-warning btn-lg" id="edit">修改</button>
                                    <button type="button" class="btn btn-success hidden btn-lg" id="submit">提交</button>
                                </th>
                            </tr>
                            </tbody>
                        </table>
                    </form>
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


<script>
    $(document).ready(function() {
        //编辑
        $("#edit").click(function(){
            $("input").removeAttr("readonly");
            $("textarea").removeAttr("readonly");

            $("#submit").removeClass("hidden");
        });


        //登录操作
        $('#submit').click(function(){

            var load = layer.load();

            //数据验证
            var form = $('#_form');     //获取表单
            var inputs = $("input");    //获取表单中input对象
            for(var i=0;i<inputs.length;i++){
                var self = $(inputs[i]);
                if(self.val() == ''){
                    displayErrorMsg(self.attr("placeholder")+"不能为空",self.attr("id"));
                    return !1;
                }
            }

            var nickname = $("#nickname").val();
            var id = $("#id").val();

            var data = {
                id : id,
                nickname : nickname
            };

            $.ajax({
                url:"${basePath}/user/updateSelf.shtml",
                data:data,
                type:"post",
                dataType:"json",
                //发送
                beforeSend:function(){
                    layer.msg('开始登录，请注意后台控制台。');
                },
                success:function(result){
                    layer.close(load);
                    if(result && result.status != 200){
                        //登录失败
                        layer.msg(result.message,function(){});

                        return;
                    }else{
                        layer.msg('登录成功！');
                        setTimeout(function(){
                            //登录返回
                            // window.location.href= result.back_url || "${basePath}/";
                        },1000)
                    }
                },
                error:function(e){
                    console.log(e,e.message);
                }
            });
        });

        //显示错误信息
        function displayErrorMsg(str,focus=null)
        {
            $("#error").removeClass("hidden");
            $("#errorMsg").text(str);
            if(focus != null){
                $("#"+focus).focus();
            }
        }

    });
</script>

</body>
</html>
