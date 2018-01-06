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
                            <h2>题目管理 <small>新增题目</small></h2>

                            <!-- 右侧工具栏 -->
                            <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                <li><a class="close-link"><i class="fa fa-close"></i></a></li>
                            </ul>

                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content" style="display: block;">
                            <div class="panel panel-primary">

                                <form action="" method="post" id="_form">


                                <table class="table table-bordered">
                                    <tbody>
                                        <tr>
                                        <td class="text-center">
                                            <span class="form-control col-md-3 col-xs-12" >
                                                题型:
                                            </span>
                                        </td>
                                        <td class="text-center">
                                                <select class="form-control" name="type" id="type">
                                                    <option value="1" selected>单选题</option>
                                                    <option value="2">多选题</option>
                                                    <option value="3">判断题</option>
                                                </select>
                                        </td>
                                        </tr>

                                        <tr>
                                        <td class="text-center">
                                            <span class="form-control col-md-3 col-xs-12" >
                                                考试项目:
                                            </span>
                                        </td>
                                        <td class="text-center">
                                            <select class="form-control" name="courseType" id="courseType">
                                                <#if data?exists && data?size gt 0 >
                                                    <#list data as it>
                                                    <#if it_index=0><option value="${it.type}" selected>${it.name}</option>
                                                    <#else>
                                                        <option value="${it.type}">${it.name}</option>
                                                    </#if>
                                                    </#list>
                                                </#if>
                                            </select>
                                        </td>
                                        </tr>

                                        <tr>
                                        <td class="text-center">
                                            <span class="form-control col-md-3 col-xs-12" >
                                                考试科目:
                                            </span>
                                        </td>
                                        <td class="text-center">
                                            <select class="form-control" name="courseTypeId" id="courseTypeId">
                                                <option>请选择考试项目</option>
                                            </select>
                                        </td>
                                        </tr>
                                        <tr>
                                        <td class="text-center">
                                            <span class="form-control col-md-3 col-xs-12" >
                                                考题:
                                            </span>
                                        </td>
                                        <td class="text-center">
                                            <textarea id="subject" name="subject" class="form-control col-md-3 col-xs-12" rows="3" placeholder="请输入考题"></textarea>
                                        </td>
                                        </tr>
                                    </tbody>
                                </table>

                                <#--选项-->
                                <div id="choose" ></div>

                                <table class="table table-bordered">
                                    <tbody>
                                        <tr>
                                        <td class="text-center">
                                            <span class="form-control col-md-3 col-xs-12">
                                            正确答案:
                                            </span>
                                            </td>
                                            <td class="text-center">
                                                <#--根据类型匹配对于的显示-->
                                                <div id="right">

                                                </div>
                                            </td>
                                          </tr>

                                          <tr>
                                            <td class="text-center">
                                             <span class="form-control col-md-3 col-xs-12">
                                             答案解析:
                                             </span>
                                            </td>
                                            <td class="text-center">
                                                <textarea name="analysis" id="analysis" class="form-control col-md-3 col-xs-12" rows="3" placeholder="请输入解析" required="required"></textarea>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>

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

    //匹配选择题
    var type = $("#type").val();
    displayChooseType(type);

    //查询出考试项目
    <#--$.ajax({-->
        <#--url:"${basePath}/QuestionManager/selectCourseType.shtml",-->
        <#--type:"post",-->
        <#--dataType:"json",-->
        <#--success:function(result){-->
            <#--$.each(result.data,function(key,value){-->
                <#--$("#courseType").append("<option value='"+value.type+"'>"+value.name+"</option>");-->
            <#--});-->
        <#--}-->
    <#--});-->

    var courseType = $("#courseType").val();
    $.ajax({
        url:"${basePath}/QuestionManager/selectCourseTypeId.shtml",
        data:{parent_id:courseType},
        type:"post",
        dataType:"json",
        success:function(result){
            $("#courseTypeId option").remove();
            $.each(result.data,function(key,value){
                $("#courseTypeId").append("<option value='"+value.type+"'>"+value.name+"</option>");
            });
        }
    });


    $('#type').on('change', function(){
        var type = $("#type").val();
        displayChooseType(type);

    });
});

//显示题目类型对应的选项
function displayChooseType(type)
{
    switch(type){
        case '1': $('#choose').html("<table class=\"table table-bordered\">\n" +
                "                                <tbody>" +
                "                                   <tr>\n" +
                "                                    <td class=\"text-center\">\n" +
                "                                        <span class=\"form-control col-md-3 col-xs-12 \">\n" +
                "                                          选项A(*)：\n" +
                "                                        </span>\n" +
                "                                    </td>\n" +
                "                                    <td class=\"text-center\">\n" +
                "                                        <input name=\"chooseA\"  class=\"form-control col-md-3 col-xs-12 \" placeholder=\"请输入选项A\" required=\"required\">\n" +
                "                                    </td>\n" +
                "                                </tr>\n" +
                "                                <tr>\n" +
                "                                    <td class=\"text-center\">\n" +
                "                                        <span class=\"form-control col-md-3 col-xs-12\">\n" +
                "                                               选项B(*)：\n" +
                "                                            </span>\n" +
                "                                    </td>\n" +
                "                                    <td class=\"text-center\">\n" +
                "                                        <input name=\"chooseB\"  class=\"form-control col-md-3 col-xs-12 \" placeholder=\"请输入选项B\" required=\"required\">\n" +
                "                                    </td>\n" +
                "                                </tr>\n" +
                "\n" +
                "                                <tr>\n" +
                "                                <td class=\"text-center\">\n" +
                "                                    <span class=\"form-control col-md-3 col-xs-12\">\n" +
                "                                            选项C(*)：\n" +
                "                                        </span>\n" +
                "                                </td>\n" +
                "                                <td class=\"text-center\">\n" +
                "                                    <input name=\"chooseC\"  class=\"form-control col-md-3 col-xs-12 \" placeholder=\"请输入选项C\" required=\"required\">\n" +
                "                                </td>\n" +
                "                                </tr>\n" +
                "                                <tr>\n" +
                "                                <td class=\"text-center\">\n" +
                "                                <span class=\"form-control col-md-3 col-xs-12\">\n" +
                "                                        选项D(*)：\n" +
                "                                    </span>\n" +
                "                                </td>\n" +
                "                                <td class=\"text-center\">\n" +
                "                                    <input name=\"chooseD\"  class=\"form-control col-md-3 col-xs-12 \"  placeholder=\"请输入选项D\" required=\"required\">\n" +
                "                                </td>\n" +
                "                                </tr>" +
                "                             </tbody>\n" +
                "                        </table>");

                $("#right").html(
                        "<input name=\"chooseRight\" type=\"radio\" value=\"A\" checked> A "+
                        "<input name=\"chooseRight\" type=\"radio\" value=\"B\" > B" +
                        "<input name=\"chooseRight\" type=\"radio\" value=\"C\"> C" +
                        "<input name=\"chooseRight\" type=\"radio\" value=\"D\"> D"
                );
            break;

        case '2': $('#choose').html("<table class=\"table table-bordered\">\n" +
                "                                <tbody>" +
                "                                    <tr>\n" +
                "                                    <td class=\"text-center\">\n" +
                "                                        <span class=\"form-control col-md-3 col-xs-12 \">\n" +
                "                                          选项A(*)：\n" +
                "                                        </span>\n" +
                "                                    </td>\n" +
                "                                    <td class=\"text-center\">\n" +
                "                                        <input class=\"form-control col-md-3 col-xs-12 \" name= \"chooseA\" placeholder=\"请输入选项A\" required=\"required\">\n" +
                "                                    </td>\n" +
                "                                </tr>\n" +
                "                                <tr>\n" +
                "                                    <td class=\"text-center\">\n" +
                "                                        <span class=\"form-control col-md-3 col-xs-12\">\n" +
                "                                               选项B(*)：\n" +
                "                                            </span>\n" +
                "                                    </td>\n" +
                "                                    <td class=\"text-center\">\n" +
                "                                        <input name=\"chooseB\"  class=\"form-control col-md-3 col-xs-12 \"  placeholder=\"请输入选项B\" required=\"required\">\n" +
                "                                    </td>\n" +
                "                                </tr>\n" +
                "\n" +
                "                                <tr>\n" +
                "                                <td class=\"text-center\">\n" +
                "                                    <span class=\"form-control col-md-3 col-xs-12\">\n" +
                "                                            选项C(*)：\n" +
                "                                        </span>\n" +
                "                                </td>\n" +
                "                                <td class=\"text-center\">\n" +
                "                                    <input name=\"chooseC\"  class=\"form-control col-md-3 col-xs-12 \" placeholder=\"请输入选项C\" required=\"required\">\n" +
                "                                </td>\n" +
                "                                </tr>\n" +
                "                                <tr>\n" +
                "                                <td class=\"text-center\">\n" +
                "                                <span class=\"form-control col-md-3 col-xs-12\">\n" +
                "                                        选项D(*)：\n" +
                "                                    </span>\n" +
                "                                </td>\n" +
                "                                <td class=\"text-center\">\n" +
                "                                    <input name=\"chooseD\"  class=\"form-control col-md-3 col-xs-12 \"  placeholder=\"请输入选项D\" required=\"required\">\n" +
                "                                </td>\n" +
                "                                </tr>\n" +
                "                            <tr>\n" +
                "                                <td class=\"text-center\">\n" +
                "                            <span class=\"form-control col-md-3 col-xs-12\">\n" +
                "                             选项E：\n" +
                "                             </span>\n" +
                "                                </td>\n" +
                "                                <td class=\"text-center\">\n" +
                "                                    <input name=\"chooseE\"  class=\"form-control col-md-3 col-xs-12 \"  placeholder=\"请输入选项E\" required=\"required\">\n" +
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
                "                                <input name=\"chooseF\"  class=\"form-control col-md-3 col-xs-12 \" placeholder=\"请输入选项F\" required=\"required\">\n" +
                "                            </td>\n" +
                "                        <tr>\n" +
                "                            <td class=\"text-center\">\n" +
                "                             <span class=\"form-control col-md-3 col-xs-12\">\n" +
                "                             选项G：\n" +
                "                             </span>\n" +
                "                                </td>\n" +
                "                                <td class=\"text-center\">\n" +
                "                                    <input name=\"chooseG\"  class=\"form-control col-md-3 col-xs-12 \" placeholder=\"请输入选项G\" required=\"required\">\n" +
                "                                </td>\n" +
                "                                </tr>\n" +
                "                                </tr>" +
                "                            </tbody>\n" +
                "                        </table>");

            $("#right").html(
                    "<input name=\"chooseRight\" type=\"checkbox\" value=\"A\" checked> A "+
                    "<input name=\"chooseRight\" type=\"checkbox\" value=\"B\"> B" +
                    "<input name=\"chooseRight\" type=\"checkbox\" value=\"C\"> C" +
                    "<input name=\"chooseRight\" type=\"checkbox\" value=\"D\"> D" +
                    "<input name=\"chooseRight\" type=\"checkbox\" value=\"E\"> E" +
                    "<input name=\"chooseRight\" type=\"checkbox\" value=\"F\"> F" +
                    "<input name=\"chooseRight\" type=\"checkbox\" value=\"G\"> G"
            );
            break;
        case '3': $('#choose').empty();
            $("#right").html(
                    "<input name=\"chooseRight\" type=\"radio\" value=\"1\" checked> 正确 "+
                    "<input name=\"chooseRight\" type=\"radio\" value=\"0\"> 错误"
            );
            break;
    }
}

$("#courseType").on('change', function(){

    var val = $("#courseType").val();

    $.ajax({
        url:"${basePath}/QuestionManager/selectCourseTypeId.shtml",
        data:{parent_id:val},
        type:"post",
        dataType:"json",
        success:function(result){
            console.log(result);
            $("#courseTypeId option").remove();
            $.each(result.data,function(key,value){
                $("#courseTypeId").append("<option value='"+value.type+"'>"+value.name+"</option>");
            });
        }
    });
});

    //提交增加的题目
$('#submit').click(function(){
    //判断是否为空
    if($("input[name = 'chooseA'] ").val() == ""){
        layer.msg('选项A未填写');
        return 0;
    }
    if($("input[name = 'chooseB'] ").val() == ""){
        layer.msg('选项B未填写');
        return 0;
    }
    if($("input[name = 'chooseC'] ").val() == ""){
        layer.msg('选项C未填写');
        return 0;
    }
    if($("input[name = 'chooseD'] ").val() == ""){
        layer.msg('选项D未填写');
        return 0;
    }
    if($.trim($("#subject").val())==""){
        layer.msg('考题未填写');
        return 0;
    }
    if($.trim($("#analysis").val())==""){
        layer.msg('答案解析未填写');
        return 0;
    }

    var type = $("#type").val();
    var courseType = $("#courseType").val();
    var courseTypeId = $("#courseTypeId").val();
    var chooseA = $("input[name = 'chooseA'] ").val();
    var chooseB = $("input[name = 'chooseB'] ").val();
    var chooseC = $("input[name = 'chooseC'] ").val();
    var chooseD = $("input[name = 'chooseD'] ").val();
    var chooseE = $("input[name = 'chooseE'] ").val();
    var chooseF = $("input[name = 'chooseF'] ").val();
    var chooseG = $("input[name = 'chooseG'] ").val();

    var subject = $("#subject").val();
    var analysis = $("#analysis").val();

    if(type == 2){
        var choose_right = "";
        $('input[name="chooseRight"]:checked').each(function(){
            choose_right += $(this).val();
        });
        alert
    }else{
        var choose_right = $("input[name = 'chooseRight']").val();
    }

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
        courseType :courseType,
        courseTypeId:courseTypeId
    };

    var load = layer.load();
    $.ajax({
        url:"${basePath}/QuestionManager/insert.shtml",
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
                    window.location.href= "${basePath}/QuestionManager/list.shtml";
                },1000)
            }
        },
        error:function(e){
            console.log(e,e.message);
        }
    });
});
</script>