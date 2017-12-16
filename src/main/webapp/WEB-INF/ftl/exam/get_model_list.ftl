
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

                    <div class="col-md-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2> 选择考试项目 </h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                    </li>
                                    <li><a class="close-link"><i class="fa fa-close"></i></a>
                                    </li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                        <div class="x_content">
                        <div class="row">
                                    <#if type?exists && courseType?exists >
                                    <div class="panel panel-primary">
                                        <div class="panel-body">
                                            <h4>请选择科目</h4>
                                        </div>
                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th>#</th>
                                            <th class="text-center">科目名称</th>
                                            <th class="text-center">操作</th>
                                        </tr>
                                        </thead>
                                    <tbody>
                                            <#if modelList?exists && modelList?size gt 0 >
                                                <#list modelList?keys as key>

                                                            <tr>
                                                                <th scope="row">${key_index+1}</th>
                                                                <td class="text-center">${modelList[key]}<br></td>
                                                                <td class="text-center">
                                                                    <a href="${basePath}/exam/get_model_list.shtml">
                                                                    <button type="button" class="btn btn-primary">
                                                                        进入练习
                                                                    </button>
                                                                    </a>
                                                                </td>
                                                            </tr>

                                                </#list>
                                    </tbody>
                                    </table>
                                    </div>


                                            <#else>
                                                <div class="alert alert-warning alert-dismissible fade in" role="alert">
                                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span>
                                                    </button>
                                                    <strong>没有考试科目 ！请先选择你要考试的考试项目 ！</strong>
                                                </div>
                                            </#if>
                                    <#else>
                                    <div class="alert alert-warning alert-dismissible fade in" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span>
                                        </button>
                                        <strong>请先选择你要考试的考试项目和考试科目 ！</strong>
                                    </div>
                                    </#if>
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
</body>
</html>
