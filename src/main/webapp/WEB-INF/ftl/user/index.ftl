
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

                    <div class="alert alert-danger hidden" id="error">
                        <ul style="color:red;">
                            <li id="errorMsg">  </li>
                        </ul>
                    </div>


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
                                           name= "nickname" id="nickname" value="${userInfo.nickname?default('未设置')}" placeholder="请输入昵称">
                                </td>

                                <td class="text-center">
                            <span class="form-control col-md-3 col-xs-12">
                                    真实姓名：
                                </span>
                                </td>
                                <td class="text-center">
                                    <input readonly="readonly" name="real_name"  class="form-control col-md-3 col-xs-12 " value="${userInfo.real_name?default('未设置')}" placeholder="密码">
                                </td>
                            </tr>

                            <tr>
                                <td class="text-center">
                            <span class="form-control col-md-3 col-xs-12">
                                    身份证号：
                                </span>
                                </td>
                                <td class="text-center">
                                    <input readonly="readonly" name="identityNumber"  class="form-control col-md-3 col-xs-12 " value="${userInfo.identityNumber?default('未设置')}" placeholder="请输入昵称">
                                </td>

                                <td class="text-center">
                            <span class="form-control col-md-3 col-xs-12">
                                    手机号：
                                </span>
                                </td>
                                <td class="text-center">
                                    <input readonly="readonly" name="tel"  class="form-control col-md-3 col-xs-12 " value="${userInfo.tel?default('未设置')}" placeholder="请输入昵称">
                                </td>
                            </tr>
                            <tr>
                                <td class="text-center">
                                <span class="form-control col-md-3 col-xs-12">
                                    地址:
                                </span>
                                </td>
                                <td class="text-center" colspan="3">
                                    <input readonly="readonly" name="address"  class="form-control col-md-3 col-xs-12 " value="${userInfo.address?default('未设置')}" placeholder="请输入昵称">
                                </td>
                            </tr>

                            <tr>
                                <td class="text-center">
                                    帐号邮箱：
                                </td>
                                <td class="text-center">
                                ${userInfo.email?default('未设置')}
                                </td>

                                <td class="text-center">
                                    修改密码请点击
                                </td>
                                <td class="text-center">
                                    <a href="${basePath}/user/updatePswd2.shtml" style="color: red;"><b>修改密码</b><a>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-center">创建时间：</td>
                                <td class="text-center">${userInfo.createTime?string('yyyy-MM-dd hh:mm:ss')}</td>
                                <td class="text-center">最后登录时间：</td>
                                <td class="text-center">${userInfo.lastLoginTime?string('yyyy-MM-dd hh:mm:ss')}</td>
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

            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                    <div class="x_title">
                        <h2>拥有的权限： </h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                            <li><a class="close-link"><i class="fa fa-close"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                            <div id="getPermissionTree" >loding... ...</div>
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
            var id = $("input[name = 'id'] ").val();
            var nickname = $("input[name = 'nickname'] ").val();
            var real_name = $("input[name = 'real_name'] ").val();
            var identityNumber = $("input[name = 'identityNumber'] ").val();
            var tel = $("input[name = 'tel'] ").val();
            var address = $("input[name = 'address']").val();

            var data = {
                id : id,
                nickname : nickname,
                real_name : real_name,
                identityNumber : identityNumber,
                tel : tel,
                address : address
            };

            $.ajax({
                url:"${basePath}/user/updateSelf.shtml",
                data:data,
                type:"post",
                dataType:"json",
                //发送
                beforeSend:function(){
                    layer.msg('发送修改请求····');
                },
                success:function(result){
                    layer.close(load);
                    if(result && result.status != 200){
                        //登录失败
                        layer.msg(result.message,function(){});
                        return;
                    }else{
                        layer.msg(result.message);
                        setTimeout(function(){
                             window.location.href= "${basePath}/user/index.shtml";
                        },1000)
                    }
                },
                error:function(e){
                    console.log(e,e.message);
                }
            });
        });
    });
</script>

<!-- treeview 我的权限加载JS-->
<script  src="${basePath}/js/common/bootstrap/bootstrap-treeview.js"></script>
<script >
    $(function(){
        //加载 permission tree data
        var load = layer.load();
        $.post("${basePath}/role/getPermissionTree.shtml",{},function(data){
            layer.close(load);
            if(data && !data.length){
                return $("#getPermissionTree").html('<code>您没有任何权限。只有默认的个人中心。</code>'),!1;
            }
            $('#getPermissionTree').treeview({
                levels: 1,//层级
                color: "#428bca",
                nodeIcon: "glyphicon glyphicon-user",
                showTags: true,//显示数量
                data: data//数据
            });
        },'json');
    });
</script>

</body>
</html>
