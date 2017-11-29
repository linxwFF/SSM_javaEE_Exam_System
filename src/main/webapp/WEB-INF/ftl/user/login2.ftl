
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <title>登录页</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link href="${basePath}/static/assets/css/bootstrap.css" rel="stylesheet">
    <link href="${basePath}/static/assets/css/animate.css" rel="stylesheet">
    <link href="${basePath}/static/assets/extendCss/style.min.css" rel="stylesheet">
    <link href="${basePath}/static/assets/extendCss/login.min.css" rel="stylesheet">
    <script src="${basePath}/static/assets/js/bootstrapJquery.js" ></script>

    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <script>
        if(window.top!==window.self){window.top.location=window.location};
    </script>

</head>

<body class="signin">
<div class="signinpanel">
    <div class="row">
        <div class="col-sm-7">
            <div class="signin-info">
                <div class="logopanel m-b">
                    <h1>woaixuexi.site</h1>
                </div>
                <div class="m-b"></div>
                <h4>欢迎使用 <strong>模拟考试系统</strong></h4>
                <ul class="m-b">
                    <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势一</li>
                    <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势二</li>
                    <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势三</li>
                    <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势四</li>
                    <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势五</li>
                </ul>
                <strong>还没有账号？ <a href="#" id="register">立即注册&raquo;</a></strong><br />
                <strong>试用账号获取 <a href="#" >立即获取&raquo;</a></strong>
            </div>
        </div>

        <div class="col-sm-5">
            <div class="alert alert-danger hidden" id="error">
                <ul style="color:red;">
                    <li id="errorMsg"> </li>
                </ul>
            </div>

            <form id="_form" action="" method="post">
                <h4 class="no-margins">登录：</h4>
                <p class="m-t-md">登录模拟考试系统</p>
                <input type="text" id="username" class="form-control uname" placeholder="Account" value="" name="account" />
                <input type="password" id="password" class="form-control pword m-b" placeholder="Password" value="" name="password" />
                <label><input type="checkbox" checked="checked"  id="rememberMe"style="width: 10px; height: 10px;">记住我</label>
                <a href="#">忘记密码了？</a>
            </form>
            <button class="btn btn-success btn-block" id="login">登录</button>
        </div>

    </div>
    <div class="signup-footer">
        <div class="pull-left">
            &copy; 2016 woaixuexi.site
        </div>
    </div>
</div>
</body>
</html>

<!-- Javascript -->
<script  src="${basePath}/js/common/jquery/jquery1.8.3.min.js"></script>
<script  src="${basePath}/js/common/MD5.js"></script>
<script  src="${basePath}/js/common/layer/layer.js"></script>
<script >
    jQuery(document).ready(function() {
        try{
            var _href = window.location.href+"";
            if(_href && _href.indexOf('?kickout')!=-1){
                layer.msg('您已经被踢出，请重新登录！');
            }
        }catch(e){

        }
        //回车事件绑定
        document.onkeydown=function(event){
            var e = event || window.event || arguments.callee.caller.arguments[0];
            if(e && e.keyCode==13){
                $('#login').click();
            }
        };

        //登录操作
        $('#login').click(function(){

            var username = $('#username').val();
            var password = $('#password').val();

            if(username == '') {
                $("#error").removeClass("hidden");
                $("#errorMsg").text("用户名不能为空");
                $('.username').focus();

                return false;
            }

            if(password == '') {
                $("#error").removeClass("hidden");
                $("#errorMsg").text("密码不能为空");
                $('.password').focus();

                return false;
            }

            //记住密码
            var pswd = MD5(username +"#" + password),
            data = {pswd:pswd,email:username,rememberMe:$("#rememberMe").is(':checked')};
            var load = layer.load();

            $.ajax({
                url:"${basePath}/u/submitLogin.shtml",
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
                        $("#error").removeClass("hidden");
                        $("#errorMsg").text(result.message);
                        $('.password').val('');
                        $('.password').focus();
                        return;
                    }else{
                        layer.msg('登录成功！');
                        setTimeout(function(){
                            //登录返回
                            window.location.href= result.back_url || "${basePath}/";
                        },1000)
                    }
                },
                error:function(e){
                    console.log(e,e.message);
                    layer.msg('请看后台Java控制台，是否报错，确定已经配置数据库和Redis',new Function());
                }
            });
        });


        $('.page-container form .username, .page-container form .password').keyup(function(){
            $(this).parent().find('.error').fadeOut('fast');
        });
        //注册
        $("#register").click(function(){
            window.location.href="register.shtml";
        });
    });
</script>
