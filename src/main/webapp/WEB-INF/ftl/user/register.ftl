
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <title>注册</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link href="${basePath}/static/assets/css/bootstrap.css" rel="stylesheet">
    <link href="${basePath}/static//assets/css/animate.css" rel="stylesheet">
    <link href="${basePath}/static//assets/extendCss/style.min.css" rel="stylesheet">
    <link href="${basePath}/static//assets/extendCss/login.min.css" rel="stylesheet">
    <script src="${basePath}/static//assets/js/bootstrapJquery.js" ></script>

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
                <!--<strong>还没有账号？ <a href="#">立即注册&raquo;</a></strong><br />-->
                <strong>试用账号获取 <a href="#">立即获取&raquo;</a></strong>
            </div>
        </div>

        <div class="col-sm-5">
            <div class="alert alert-danger hidden" id="error">
                <ul style="color:red;">
                    <li id="errorMsg">  </li>
                </ul>
            </div>
            <form id="_form" action="" method="post">
                <h4 class="no-margins">注册：</h4>
                <input type="text" name="nickname" id="nickname" class="form-control uname" placeholder="用户名">
                <input type="email" name="email" id="email" class="form-control uname" placeholder="邮箱帐号">
                <input type="password" class="form-control pword m-b" placeholder="密码" value="" name="pswd" id="password"/>
                <input type="password" id="re_password" class="form-control pword m-b"  placeholder="确认密码">
                <input type="text" id="vcode" name="vcode" class="form-control pword m-b"   placeholder="验证码">
                <img src="${basePath}/open/getGifCode.shtml" width="233px;" />
            </form>

            <div class="col-sm-6">
                <button class="btn btn-success btn-block" id="register">注册</button>
            </div>
            <div class="col-sm-6">
                <button class="btn btn-danger btn-block" id="login" >登录</button>
            </div>
        </div>
    </div>
    <div class="signup-footer">
        <div class="pull-left">
            &copy; 2018 woaixuexi.site
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
        //验证码
        $("#vcode").on("click",'img',function(){
            /**动态验证码，改变地址，多次在火狐浏览器下，不会变化的BUG，故这样解决*/
            var i = new Image();
            i.src = '${basePath}/open/getGifCode.shtml?'  + Math.random();
            $(i).replaceAll(this);
            //$(this).clone(true).attr("src",'${basePath}/open/getGifCode.shtml?'  + Math.random()).replaceAll(this);
        });
        $('#register').click(function(){
            var form = $('#_form');		//获取表单
            var inputs = $("input");	//获取表单中input对象
            for(var i=0;i<inputs.length;i++){
                var self = $(inputs[i]);
                if(self.val() == ''){
                    displayErrorMsg(self.attr("placeholder")+"不能为空",self.attr("id"));
                    return !1;
                }
            }
            var re_password = $("#re_password").val();
            var password = $("#password").val();
            if(password != re_password){
                $("#re_password").val("");
                $("#password").val("");
                displayErrorMsg('2次密码输出不一样！',"password");
                return layer.msg('2次密码输出不一样！',function(){}),!1;
            }

            if($('#vcode').val().length !=4){
                $('#vcode').val("");
                displayErrorMsg('验证码的长度为4位！',"vcode");
                return layer.msg('验证码的长度为4位！',function(){}),!1;
            }
            console.log("验证成功");
            var load = layer.load();
            // 请求后端验证
            $.post("${basePath}/u/subRegister.shtml",$("#_form").serialize() ,function(result){
                layer.close(load);
                if(result && result.status!= 200){
                    displayErrorMsg(result.message);
                    return layer.msg(result.message,function(){}),!1;
                }else{
                    layer.msg('注册成功！' );
                    window.location.href= result.back_url || "${basePath}/";
                }
            },"json");

        });

        //跳转 登录
        $("#login").click(function(){
            window.location.href="${basePath}/u/login.shtml";
        });
        //跳转 注册
        // $("#register").click(function(){
        // 	window.location.href="register.shtml";
        // });

        //显示错误信息
        function displayErrorMsg(str,focus)
        {
            $("#error").removeClass("hidden");
            $("#errorMsg").text(str);
            if(focus != null){
                $("#"+focus).focus();
            }
        }

    });
</script>
