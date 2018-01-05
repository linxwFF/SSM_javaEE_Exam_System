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
        <div class="right_col" role="main">
            <div class="row">

                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>考题管理</h2>

                            <!-- 右侧工具栏 -->
                            <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                <li><a class="close-link"><i class="fa fa-close"></i></a></li>
                            </ul>

                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content" style="display: block;">

                            <div class="panel panel-primary">
                                <div class="panel-body">
                                    <h4>考题增加</h4>
                                </div>
                                <form action="" method="post" id="_form">
                                    <select id="test" name="type" style="background: dodgerblue;
                                               width: 268px;
                                               padding: 5px;
                                               font-size: 16px;
                                               font-weight:bold;
                                               color: black;
                                               border: 3px solid #ccc;
                                               height: 34px;
                                                  ">
                                        <option value="1" selected>单选题</option>
                                        <option value="2">多选题</option>
                                        <option value="3">判断题</option>
                                    </select>
                                <table class="table table-bordered">
                                    <tbody>
                                    <tr>
                                        <td class="text-center">
                                            <span class="form-control col-md-3 col-xs-12" >
                                                考题:
                                            </span>
                                        </td>
                                        <td class="text-center" colspan="3">
                                            <input required="true"  name="subject"  class="form-control col-md-3 col-xs-12 " value="" placeholder="请输入考题">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-center">
                                <span class="form-control col-md-3 col-xs-12">
                                答案:
                                </span>
                                            </td>
                                            <td class="text-center" colspan="3">
                                                <input  name="choose_right"  class="form-control col-md-3 col-xs-12 " value="" placeholder="请输入答案">
                                            </td>
                                        </tr>

                                <tr>
                                    <td class="text-center">
                                 <span class="form-control col-md-3 col-xs-12">
                                 答案解析:
                                 </span>
                                            </td>
                                            <td class="text-center" colspan="3">
                                                <input  name="analysis"  class="form-control col-md-3 col-xs-12 " value="" placeholder="请输入解析">
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <div id="a1" ></div>
                                <table class="table table-bordered">
                                    <tbody>
                                    <tr>
                                        <th class="text-center" colspan="4">
                                            <button type="button" class="btn btn-success btn-lg" id="submit">提交</button>
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
<script src="${basePath}/js/common/jquery/jquery.form-2.82.js?${_v}"></script>
<script>
//下拉框的设置
$(document).ready(function(){
    var val = $("#test").val();
    switch(val){
        case '1': $('#a1').html("<table class=\"table table-bordered\">\n" +
                "                                <tbody>" +
                "                                   <tr>\n" +
                "                                    <td class=\"text-center\">\n" +
                "                                        <span class=\"form-control col-md-3 col-xs-12 \">\n" +
                "                                          选项A：\n" +
                "                                        </span>\n" +
                "                                    </td>\n" +
                "                                    <td class=\"text-center\">\n" +
                "                                        <input class=\"form-control col-md-2 col-xs-12 \"\n" +
                "                                               name= \"chooseA\" id=\"chooseA\" value=\"\" placeholder=\"请输入选项A\">\n" +
                "                                    </td>\n" +
                "                                </tr>\n" +
                "                                <tr>\n" +
                "                                    <td class=\"text-center\">\n" +
                "                                        <span class=\"form-control col-md-3 col-xs-12\">\n" +
                "                                               选项B：\n" +
                "                                            </span>\n" +
                "                                    </td>\n" +
                "                                    <td class=\"text-center\">\n" +
                "                                        <input name=\"chooseB\"  class=\"form-control col-md-3 col-xs-12 \" value=\"\" placeholder=\"请输入选项B\">\n" +
                "                                    </td>\n" +
                "                                </tr>\n" +
                "\n" +
                "                                <tr>\n" +
                "                                <td class=\"text-center\">\n" +
                "                                    <span class=\"form-control col-md-3 col-xs-12\">\n" +
                "                                            选项C：\n" +
                "                                        </span>\n" +
                "                                </td>\n" +
                "                                <td class=\"text-center\">\n" +
                "                                    <input name=\"chooseC\"  class=\"form-control col-md-3 col-xs-12 \" value=\"\"placeholder=\"请输入选项C\">\n" +
                "                                </td>\n" +
                "                                </tr>\n" +
                "                                <tr>\n" +
                "                                <td class=\"text-center\">\n" +
                "                                <span class=\"form-control col-md-3 col-xs-12\">\n" +
                "                                        选项D：\n" +
                "                                    </span>\n" +
                "                                </td>\n" +
                "                                <td class=\"text-center\">\n" +
                "                                    <input name=\"chooseD\"  class=\"form-control col-md-3 col-xs-12 \" value=\"\" placeholder=\"请输入选项D\">\n" +
                "                                </td>\n" +
                "                                </tr>" +
                "                             </tbody>\n" +
                "                        </table>"); break;
    }


    $('#test').on('change', function(){
        var val = $("#test").val();

        switch(val){
            case '1': $('#a1').html("<table class=\"table table-bordered\">\n" +
                    "                                <tbody>" +
                    "                                   <tr>\n" +
                    "                                    <td class=\"text-center\">\n" +
                    "                                        <span class=\"form-control col-md-3 col-xs-12 \">\n" +
                    "                                          选项A：\n" +
                    "                                        </span>\n" +
                    "                                    </td>\n" +
                    "                                    <td class=\"text-center\">\n" +
                    "                                        <input class=\"form-control col-md-2 col-xs-12 \"\n" +
                    "                                               name= \"chooseA\" id=\"chooseA\" value=\"\" placeholder=\"请输入选项A\">\n" +
                    "                                    </td>\n" +
                    "                                </tr>\n" +
                    "                                <tr>\n" +
                    "                                    <td class=\"text-center\">\n" +
                    "                                        <span class=\"form-control col-md-3 col-xs-12\">\n" +
                    "                                               选项B：\n" +
                    "                                            </span>\n" +
                    "                                    </td>\n" +
                    "                                    <td class=\"text-center\">\n" +
                    "                                        <input name=\"chooseB\"  class=\"form-control col-md-3 col-xs-12 \" value=\"\" placeholder=\"请输入选项B\">\n" +
                    "                                    </td>\n" +
                    "                                </tr>\n" +
                    "\n" +
                    "                                <tr>\n" +
                    "                                <td class=\"text-center\">\n" +
                    "                                    <span class=\"form-control col-md-3 col-xs-12\">\n" +
                    "                                            选项C：\n" +
                    "                                        </span>\n" +
                    "                                </td>\n" +
                    "                                <td class=\"text-center\">\n" +
                    "                                    <input name=\"chooseC\"  class=\"form-control col-md-3 col-xs-12 \" value=\"\"placeholder=\"请输入选项C\">\n" +
                    "                                </td>\n" +
                    "                                </tr>\n" +
                    "                                <tr>\n" +
                    "                                <td class=\"text-center\">\n" +
                    "                                <span class=\"form-control col-md-3 col-xs-12\">\n" +
                    "                                        选项D：\n" +
                    "                                    </span>\n" +
                    "                                </td>\n" +
                    "                                <td class=\"text-center\">\n" +
                    "                                    <input name=\"chooseD\"  class=\"form-control col-md-3 col-xs-12 \" value=\"\" placeholder=\"请输入选项D\">\n" +
                    "                                </td>\n" +
                    "                                </tr>" +
                    "                             </tbody>\n" +
                    "                        </table>"); break;
            case '2': $('#a1').html("<table class=\"table table-bordered\">\n" +
                    "                                <tbody>" +
                    "                                    <tr>\n" +
                    "                                    <td class=\"text-center\">\n" +
                    "                                        <span class=\"form-control col-md-3 col-xs-12 \">\n" +
                    "                                          选项A：\n" +
                    "                                        </span>\n" +
                    "                                    </td>\n" +
                    "                                    <td class=\"text-center\">\n" +
                    "                                        <input class=\"form-control col-md-2 col-xs-12 \"\n" +
                    "                                               name= \"chooseA\" id=\"chooseA\" value=\"\" placeholder=\"请输入选项A\">\n" +
                    "                                    </td>\n" +
                    "                                </tr>\n" +
                    "                                <tr>\n" +
                    "                                    <td class=\"text-center\">\n" +
                    "                                        <span class=\"form-control col-md-3 col-xs-12\">\n" +
                    "                                               选项B：\n" +
                    "                                            </span>\n" +
                    "                                    </td>\n" +
                    "                                    <td class=\"text-center\">\n" +
                    "                                        <input name=\"chooseB\"  class=\"form-control col-md-3 col-xs-12 \" value=\"\" placeholder=\"请输入选项B\">\n" +
                    "                                    </td>\n" +
                    "                                </tr>\n" +
                    "\n" +
                    "                                <tr>\n" +
                    "                                <td class=\"text-center\">\n" +
                    "                                    <span class=\"form-control col-md-3 col-xs-12\">\n" +
                    "                                            选项C：\n" +
                    "                                        </span>\n" +
                    "                                </td>\n" +
                    "                                <td class=\"text-center\">\n" +
                    "                                    <input name=\"chooseC\"  class=\"form-control col-md-3 col-xs-12 \" value=\"\"placeholder=\"请输入选项C\">\n" +
                    "                                </td>\n" +
                    "                                </tr>\n" +
                    "                                <tr>\n" +
                    "                                <td class=\"text-center\">\n" +
                    "                                <span class=\"form-control col-md-3 col-xs-12\">\n" +
                    "                                        选项D：\n" +
                    "                                    </span>\n" +
                    "                                </td>\n" +
                    "                                <td class=\"text-center\">\n" +
                    "                                    <input name=\"chooseD\"  class=\"form-control col-md-3 col-xs-12 \" value=\"\" placeholder=\"请输入选项D\">\n" +
                    "                                </td>\n" +
                    "                                </tr>\n" +
                    "                            <tr>\n" +
                    "                                <td class=\"text-center\">\n" +
                    "                            <span class=\"form-control col-md-3 col-xs-12\">\n" +
                    "                             选项E：\n" +
                    "                             </span>\n" +
                    "                                </td>\n" +
                    "                                <td class=\"text-center\">\n" +
                    "                                    <input name=\"chooseE\"  class=\"form-control col-md-3 col-xs-12 \" value=\"\" placeholder=\"请输入选项E\">\n" +
                    "                                </td>\n" +
                    "                            </tr>\n" +
                    "\n" +
                    "                            <tr>\n" +
                    "                                <td class=\"text-center\">\n" +
                    "                            <span class=\"form-control col-md-3 col-xs-12\">\n" +
                    "                            选项F：\n" +
                    "                            </span>\n" +
                    "                            </td>\n" +
                    "                            <td class=\"text-center\">\n" +
                    "                                <input name=\"chooseF\"  class=\"form-control col-md-3 col-xs-12 \" value=\"\"placeholder=\"请输入选项F\">\n" +
                    "                            </td>\n" +
                    "                        <tr>\n" +
                    "                            <td class=\"text-center\">\n" +
                    "                             <span class=\"form-control col-md-3 col-xs-12\">\n" +
                    "                             选项G：\n" +
                    "                             </span>\n" +
                    "                                </td>\n" +
                    "                                <td class=\"text-center\">\n" +
                    "                                    <input name=\"chooseG\"  class=\"form-control col-md-3 col-xs-12 \" value=\"\" placeholder=\"请输入选项G\">\n" +
                    "                                </td>\n" +
                    "                                </tr>\n" +
                    "                                </tr>" +
                    "                            </tbody>\n" +
                    "                        </table>");  break;
            case '3': $('#a1').html("<table class=\"table table-bordered\">\n" +
                    "                                            <tbody>\n" +
                    "                                            \n" +
                    "                                            <tr>\n" +
                    "                                                <td class=\"text-center\">\n" +
                    "                                                <span class=\"form-control col-md-3 col-xs-12 \">\n" +
                    "                                                  选项1：\n" +
                    "                                                </span>\n" +
                    "                                                </td>\n" +
                    "                                                <td class=\"text-center\">\n" +
                    "                                                    <input class=\"form-control col-md-2 col-xs-12 \"\n" +
                    "                                                           name= \"chooseA\" id=\"chooseA\" value=\"\" placeholder=\"请输入选项1\">\n" +
                    "                                                </td>\n" +
                    "                                            </tr>\n" +
                    "                                            <tr>\n" +
                    "                                                <td class=\"text-center\">\n" +
                    "                                                <span class=\"form-control col-md-3 col-xs-12\">\n" +
                    "                                                       选项2：\n" +
                    "                                                    </span>\n" +
                    "                                                </td>\n" +
                    "                                                <td class=\"text-center\">\n" +
                    "                                                    <input name=\"chooseB\"  class=\"form-control col-md-3 col-xs-12 \" value=\"\" placeholder=\"请输入选项2\">\n" +
                    "                                                </td>\n" +
                    "                                            </tr>\n" +
                    "                                            </tbody>\n" +
                    "                                        </table>"); break;
        }
    });
});
    //提交增加的题目
$('#submit').click(function(){



    //数据验证
    var type = $("#test").val();
    var subject = $("input[name = 'subject'] ").val();
    var chooseA = $("input[name = 'chooseA'] ").val();
    var chooseB = $("input[name = 'chooseB'] ").val();
    var chooseC = $("input[name = 'chooseC'] ").val();
    var chooseD = $("input[name = 'chooseD'] ").val();
    var chooseE = $("input[name = 'chooseE'] ").val();
    var chooseF = $("input[name = 'chooseF'] ").val();
    var chooseG = $("input[name = 'chooseG'] ").val();
    var choose_right = $("input[name = 'choose_right'] ").val();
    var analysis = $("input[name = 'analysis'] ").val();

        var inputs = $("input");	//获取表单中input对象
        for (var i = 0; i < inputs.length; i++) {
            var self = $(inputs[i]);
            if (self.val() == '') {
                layer.msg('信息未填写完成！', function () {
                });
                return !1;
            }
        }
    var load = layer.load();
    var data = {
        type:type,
        subject : subject,
        chooseA : chooseA,
        chooseB : chooseB,
        chooseC : chooseC,
        chooseD : chooseD,
        chooseE : chooseE,
        chooseF : chooseF,
        chooseG : chooseG,
        chooseRight : choose_right ,
        analysis : analysis,
    };
    $.ajax({
        url:"${basePath}/examManage/insert_question.shtml",
        data:data,
        type:"post",
        dataType:"json",
        //发送
        beforeSend:function(){
            layer.msg('发送增加题目的请求····');
        },
        success:function(result){
            layer.close(load);
            if(result && result.status != 200){
                //增加失败
                layer.msg(result.message,function(){});
                return;
            }else{
                layer.msg(result.message);
                setTimeout(function(){
                    window.location.href= "${basePath}/examManage/list.shtml";
                },1000)
            }
        },
        error:function(e){
            console.log(e,e.message);
        }
    });
});
</script>