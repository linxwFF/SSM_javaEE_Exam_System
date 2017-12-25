
<!DOCTYPE html>
<html lang="en">
<!-- header -->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title> 考试结果 </title>

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
                            <h2>考卷信息： </h2>
                            <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                </li>
                                <li><a class="close-link"><i class="fa fa-close"></i></a>
                                </li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">

                            <div class="panel panel-primary">
                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th class="text-center" colspan="6"><span style="color:#FF4500;">考卷名称: ${item.exam_title!}  </span></th>
                                        </tr>
                                        </thead>
                                        <tbody>

                                        <tr>
                                            <td class="text-center">
                                                    考试时间：
                                            </td>
                                            <td class="text-center">
                                                    ${item.exam_time!}
                                            </td>

                                            <td class="text-center">
                                                    考试花费时间：
                                            </td>
                                            <td class="text-center">
                                                    ${item.take_time!}
                                            </td>
                                            <td class="text-center">
                                                    考试时间：
                                            </td>
                                            <td class="text-center">
                                                ${item.create_time?string('yyyy-MM-dd HH:mm')}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-center">
                                                题目总数：
                                            </td>
                                            <td class="text-center">
                                                ${item.total_num!}
                                            </td>

                                            <td class="text-center">
                                                正确题数：
                                            </td>
                                            <td class="text-center">
                                                ${item.right_num!}
                                            </td>
                                            <td class="text-center">
                                                错误题数：
                                            </td>
                                            <td class="text-center">
                                                ${item.error_num!}
                                            </td>
                                        </tr>


                                        </tbody>
                                    </table>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>错题集合： </h2>
                            <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-down"></i></a>
                                </li>
                                <li><a class="close-link"><i class="fa fa-close"></i></a>
                                </li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content" style="display: none;">

                            <!--答题一-->
                        <#if err_records?exists && err_records?size gt 0 >
                            <#list err_records as it>
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="x_panel" style="height: auto;">
                                        <div class="x_title">
                                            <h2>${it_index+1}、
                                                <small>
                                                    <#if (it.score)?? && it.score gt 0 >
                                                    ${it.subject} --- 正确 <i class="fa fa-thumbs-o-up"></i>
                                                    <#else>
                                                        <span style="color:red">${it.subject} --- 错误 <i class="fa fa-exclamation"></i></span>
                                                    </#if>
                                                </small>
                                            </h2>
                                            <ul class="nav navbar-right panel_toolbox">
                                                <li><a class="collapse-link">
                                                    <#if (it.score)?? && it.score gt 0 >
                                                        <i class="fa fa-chevron-down"></i></a>
                                                    <#else>
                                                        <i class="fa fa-chevron-up"></i></a>
                                                    </#if>
                                                </li>
                                            </ul>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="x_content" style="
                                            <#if (it.score)?? && it.score gt 0 >
                                                    display: none;
                                            <#else>
                                                    display: block;
                                            </#if>
                                                ">

                                            <table class="table">
                                                <thead>
                                                <tr>
                                                <tr>
                                                    <th style="color: blue;" width="10%">题目:</th>
                                                    <th>${it.subject}</th>
                                                </tr>
                                                </tr>
                                                <tr>
                                                    <th>选项</th>
                                                    <th></th>
                                                </tr>
                                                </thead>
                                                <tbody>

                                                    <#if it.type == 1>
                                                    <tr>
                                                        <td scope="row">A</td>
                                                        <td>${it.chooseA}</td>
                                                    </tr>
                                                    <tr>
                                                        <td scope="row">B</td>
                                                        <td>${it.chooseB}</td>
                                                    </tr>
                                                    <tr>
                                                        <td scope="row">C</td>
                                                        <td>${it.chooseC}</td>
                                                    </tr>
                                                    <tr>
                                                        <td scope="row">D</td>
                                                        <td>${it.chooseD}</td>
                                                    </tr>
                                                    <#elseif it.type == 2>
                                                    <tr>
                                                        <td scope="row">A</td>
                                                        <td>${it.chooseA}</td>
                                                    </tr>
                                                    <tr>
                                                        <td scope="row">B</td>
                                                        <td>${it.chooseB}</td>
                                                    </tr>
                                                    <tr>
                                                        <td scope="row">C</td>
                                                        <td>${it.chooseC}</td>
                                                    </tr>
                                                    <tr>
                                                        <td scope="row">D</td>
                                                        <td>${it.chooseD}</td>
                                                    </tr>
                                                    <tr>
                                                        <td scope="row">E</td>
                                                        <td>${it.chooseE}</td>
                                                    </tr>
                                                    <tr>
                                                        <td scope="row">F</td>
                                                        <td>${it.chooseF}</td>
                                                    </tr>
                                                    <tr>
                                                        <td scope="row">G</td>
                                                        <td>${it.chooseG}</td>
                                                    </tr>
                                                    <#elseif it.type == 3>

                                                    <#else>
                                                    </#if>
                                                <tr>
                                                    <#if (it.score)?? && it.score gt 0 >
                                                        <td style="color: blue;">您的答案：</td>
                                                    <#else>
                                                        <td style="color: red;">您的答案：</td>
                                                    </#if>

                                                    <td>${it.choose}</td>
                                                </tr>
                                                <tr>
                                                    <td style="color: blue;">正确答案：</td>
                                                    <td>${it.chooseRight}</td>
                                                </tr>
                                                <tr>
                                                    <td style="color: blue;">最佳分析	:</td>
                                                    <td>${it.analysis}</td>
                                                </tr>
                                                </tbody>
                                            </table>

                                        </div>
                                    </div>
                                </div>
                            </#list>

                        <#else>
                            <div class="alert alert-warning alert-dismissible fade in" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span>
                                </button>
                                <strong>没有数据 ！</strong>
                            </div>
                        </#if>

                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>正确集合： </h2>
                            <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-down"></i></a>
                                </li>
                                <li><a class="close-link"><i class="fa fa-close"></i></a>
                                </li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content" style="display: none;">

                        <#if suc_records?exists && suc_records?size gt 0 >
                            <#list suc_records as it>
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="x_panel" style="height: auto;">
                                        <div class="x_title">
                                            <h2>${it_index+1}、
                                                <small>
                                                    <#if (it.score)?? && it.score gt 0 >
                                                    ${it.subject} --- 正确 <i class="fa fa-thumbs-o-up"></i>
                                                    <#else>
                                                        <span style="color:red">${it.subject} --- 错误 <i class="fa fa-exclamation"></i></span>
                                                    </#if>
                                                </small>
                                            </h2>
                                            <ul class="nav navbar-right panel_toolbox">
                                                <li><a class="collapse-link">
                                                    <#if (it.score)?? && it.score gt 0 >
                                                        <i class="fa fa-chevron-down"></i></a>
                                                    <#else>
                                                        <i class="fa fa-chevron-up"></i></a>
                                                    </#if>
                                                </li>
                                            </ul>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="x_content" style="
                                            <#if (it.score)?? && it.score gt 0 >
                                                    display: none;
                                            <#else>
                                                    display: block;
                                            </#if>
                                                ">

                                            <table class="table">
                                                <thead>
                                                <tr>
                                                <tr>
                                                    <th style="color: blue;" width="10%">题目:</th>
                                                    <th>${it.subject}</th>
                                                </tr>
                                                </tr>
                                                <tr>
                                                    <th>选项</th>
                                                    <th></th>
                                                </tr>
                                                </thead>
                                                <tbody>

                                                    <#if it.type == 1>
                                                    <tr>
                                                        <td scope="row">A</td>
                                                        <td>${it.chooseA}</td>
                                                    </tr>
                                                    <tr>
                                                        <td scope="row">B</td>
                                                        <td>${it.chooseB}</td>
                                                    </tr>
                                                    <tr>
                                                        <td scope="row">C</td>
                                                        <td>${it.chooseC}</td>
                                                    </tr>
                                                    <tr>
                                                        <td scope="row">D</td>
                                                        <td>${it.chooseD}</td>
                                                    </tr>
                                                    <#elseif it.type == 2>
                                                    <tr>
                                                        <td scope="row">A</td>
                                                        <td>${it.chooseA}</td>
                                                    </tr>
                                                    <tr>
                                                        <td scope="row">B</td>
                                                        <td>${it.chooseB}</td>
                                                    </tr>
                                                    <tr>
                                                        <td scope="row">C</td>
                                                        <td>${it.chooseC}</td>
                                                    </tr>
                                                    <tr>
                                                        <td scope="row">D</td>
                                                        <td>${it.chooseD}</td>
                                                    </tr>
                                                    <tr>
                                                        <td scope="row">E</td>
                                                        <td>${it.chooseE}</td>
                                                    </tr>
                                                    <tr>
                                                        <td scope="row">F</td>
                                                        <td>${it.chooseF}</td>
                                                    </tr>
                                                    <tr>
                                                        <td scope="row">G</td>
                                                        <td>${it.chooseG}</td>
                                                    </tr>
                                                    <#elseif it.type == 3>

                                                    <#else>
                                                    </#if>
                                                <tr>
                                                    <#if (it.score)?? && it.score gt 0 >
                                                        <td style="color: blue;">您的答案：</td>
                                                    <#else>
                                                        <td style="color: red;">您的答案：</td>
                                                    </#if>

                                                    <td>${it.choose}</td>
                                                </tr>
                                                <tr>
                                                    <td style="color: blue;">正确答案：</td>
                                                    <td>${it.chooseRight}</td>
                                                </tr>
                                                <tr>
                                                    <td style="color: blue;">最佳分析	:</td>
                                                    <td>${it.analysis}</td>
                                                </tr>
                                                </tbody>
                                            </table>

                                        </div>
                                    </div>
                                </div>
                            </#list>
                        <#else>
                            <div class="alert alert-warning alert-dismissible fade in" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span>
                                </button>
                                <strong>没有数据 ！</strong>
                            </div>
                        </#if>

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
</body>
</html>
