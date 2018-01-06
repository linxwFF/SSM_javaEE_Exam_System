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
                            <h2>个人资料</h2>

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
                                    <h4>考题修改</h4>
                                </div>

                                <form action="" method="post" id="_form">
                                    <input type="hidden" name="id" id="id" value="${qQuestion.id?default('未设置')}">
                                    <table class="table table-bordered">
                                        <tbody>
                                        <tr>
                                            <td class="text-center">
                                <span class="form-control col-md-3 col-xs-12" >
                                    考题:
                                </span>
                                            </td>
                                            <td class="text-center" colspan="3">
                                                <input  name="subject"  class="form-control col-md-3 col-xs-12 " value="${qQuestion.subject?default('未设置')}" placeholder="请输入昵称">
                                            </td>
                                        </tr>

<#if qQuestion.type?number == 1>
                         <tr>
                                <td class="text-center">
                                <span class="form-control col-md-3 col-xs-12 ">
                                  选项A：
                                </span>
                                            </td>
                                            <td class="text-center">
                                                <input   class="form-control col-md-2 col-xs-12 "
                                                       name= "chooseA" id="chooseA" value="${qQuestion.chooseA?default('未设置')}" placeholder="请输入昵称">
                                            </td>
                             </tr>
                             <tr>
                              <td class="text-center">
                            <span class="form-control col-md-3 col-xs-12">
                                   选项B：
                                </span>
                                    </td>
                                    <td class="text-center">
                                        <input  name="chooseB"  class="form-control col-md-3 col-xs-12 " value="${qQuestion.chooseB?default('未设置')}" placeholder="">
                                    </td>
                                </tr>

                            <tr>
                            <td class="text-center">
                            <span class="form-control col-md-3 col-xs-12">
                                    选项C：
                                </span>
                                </td>
                                <td class="text-center">
                                    <input  name="chooseC"  class="form-control col-md-3 col-xs-12 " value="${qQuestion.chooseC?default('未设置')}"placeholder="请输入昵称">
                                </td>
                            <tr>
                            <td class="text-center">
                            <span class="form-control col-md-3 col-xs-12">
                                    选项D：
                                </span>
                                </td>
                                <td class="text-center">
                                    <input  name="chooseD"  class="form-control col-md-3 col-xs-12 " value="${qQuestion.chooseD?default('未设置')}" placeholder="请输入昵称">
                                </td>
                            </tr>
    </#if>
    <#if qQuestion.type?number == 2>
                        <tr>
                            <td class="text-center">
                            <span class="form-control col-md-3 col-xs-12 ">
                              选项A：
                            </span>
                            </td>
                            <td class="text-center">
                                <input   class="form-control col-md-2 col-xs-12 "
                                       name= "chooseA" id="chooseA" value="${qQuestion.chooseA?default('未设置')}" placeholder="请输入昵称">
                            </td>
                         </tr>
                        <tr>
                            <td class="text-center">
                            <span class="form-control col-md-3 col-xs-12">
                                   选项B：
                                </span>
                            </td>

                            <td class="text-center">
                                <input  name="chooseB"  class="form-control col-md-3 col-xs-12 " value="${qQuestion.chooseB?default('未设置')}" placeholder="">
                            </td>
                        </tr>

                        <tr>
                            <td class="text-center">
                            <span class="form-control col-md-3 col-xs-12">
                                    选项C：
                                </span>
                            </td>
                            <td class="text-center">
                                <input  name="chooseC"  class="form-control col-md-3 col-xs-12 " value="${qQuestion.chooseC?default('未设置')}"placeholder="请输入昵称">
                            </td>
                         </tr>

                            <tr>
                            <td class="text-center">
                                                <span class="form-control col-md-3 col-xs-12">
                                                        选项D：
                                                    </span>
                            </td>
                            <td class="text-center">
                                <input  name="chooseD"  class="form-control col-md-3 col-xs-12 " value="${qQuestion.chooseD?default('未设置')}" placeholder="请输入昵称">
                            </td>
                             </tr>
                            <tr>
                            <td class="text-center">
                            <span class="form-control col-md-3 col-xs-12">
                             选项E：
                             </span>
                             </td>
                            <td class="text-center">
                                <input  name="chooseE"  class="form-control col-md-3 col-xs-12 " value="${qQuestion.chooseE?default('未设置')}" placeholder="">
                            </td>
                            </tr>

                        <tr>
                            <td class="text-center">
                            <span class="form-control col-md-3 col-xs-12">
                            选项F：
                            </span>
                            </td>
                            <td class="text-center">
                                <input  name="chooseF"  class="form-control col-md-3 col-xs-12 " value="${qQuestion.chooseF?default('未设置')}"placeholder="请输入昵称">
                            </td>
                            <tr>
                            <td class="text-center">
                             <span class="form-control col-md-3 col-xs-12">
                             选项G：
                             </span>
                            </td>
                            <td class="text-center">
                                <input  name="chooseG"  class="form-control col-md-3 col-xs-12 " value="${qQuestion.chooseG?default('未设置')}" placeholder="请输入昵称">
                            </td>
                            </tr>
                        </tr>

    </#if>
    <#if qQuestion.type?number == 3>
                        <tr>
                            <td class="text-center">
                                    <span class="form-control col-md-3 col-xs-12 ">
                                      选项1：
                                    </span>
                            </td>
                            <td class="text-center">
                                <input   class="form-control col-md-2 col-xs-12 "
                                       name= "chooseA" id="chooseA" value="${qQuestion.chooseA?default('未设置')}" placeholder="请输入昵称">
                            </td>

                            <td class="text-center">
                                <span class="form-control col-md-3 col-xs-12">
                                       选项2：
                                    </span>
                            </td>
                            <td class="text-center">
                                <input   class="form-control col-md-2 col-xs-12 "
                                       name= "chooseA" id="chooseA" value="${qQuestion.chooseB?default('未设置')}" placeholder="请输入昵称">
                            </td>
    </tr>
</#if>
                        <td class="text-center">
                         <span class="form-control col-md-3 col-xs-12">
                         答案:
                         </span>
                         </td>
                            <td class="text-center" colspan="3">
                                <input  name="choose_right"  class="form-control col-md-3 col-xs-12 " value="${qQuestion.chooseRight?default('未设置')}" placeholder="请输入昵称">
                            </td>
                        </tr>
                        <tr>
                        <tr>
                        <td class="text-center">
                        <span class="form-control col-md-3 col-xs-12">
                         答案解析:
                         </span>
                        </td>
                        <td class="text-center" colspan="3">
                            <input  name="analysis"  class="form-control col-md-3 col-xs-12 " value="${qQuestion.analysis?default('未设置')}" placeholder="请输入昵称">
                        </td>
                    </tr>
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

<script>
    $(document).ready(function() {
        //修改操作
        $('#submit').click(function(){

            var load = layer.load();

            //数据验证
            var id = $("input[name = 'id'] ").val();
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

            var data = {
                id : id,
                subject : subject,
                chooseA : chooseA,
                chooseB : chooseB,
                chooseC : chooseC,
                chooseD : chooseD,
                chooseE : chooseE,
                chooseF : chooseF,
                chooseG : chooseG,
                choose_right : choose_right ,
                analysis : analysis,
        };

            $.ajax({
                url:"${basePath}/QuestionManager/update.shtml",
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
                        //修改失败
                        layer.msg(result.message,function(){});
                        return;
                    }else{
                        layer.msg(result.message);
                        setTimeout(function(){
                            window.location.href= "${basePath}/QuestionManager/list.shtml";
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