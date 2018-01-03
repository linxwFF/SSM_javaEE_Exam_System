
<!DOCTYPE html>
<html lang="en">
<!-- header -->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title> 模拟考试系统 - 消息中心 </title>

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
        <div class="right_col black" role="main">

            <div class="row black">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2><i class="fa fa-bars"></i> 消息中心 <small>消息中心</small></h2>
                            <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                </li>
                                <li><a class="close-link"><i class="fa fa-close"></i></a>
                                </li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">

                            <div class="" role="tabpanel" data-example-id="togglable-tabs">
                                <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">

                                    <li role="presentation" class="<#if type==1>active</#if>">
                                        <a href="#tab_content1" <#if type!=1>onclick="_subType(1)"</#if> id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">消息通知</a>
                                    </li>
                                    <li role="presentation" class="<#if type==2>active</#if>">
                                        <a href="#tab_content2" <#if type!=2>onclick="_subType(2)"</#if>  role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">考试动态</a>
                                    </li>
                                    <li role="presentation" class="<#if type==3>active</#if>">
                                        <a href="#tab_content3" <#if type!=3>onclick="_subType(3)"</#if>  role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false">备考文库</a>
                                    </li>
                                <#if type==1>
                                <#--分页表单-->
                                    <form method="post" action="" id="formId" class="form-inline">
                                        <input type="hidden" value="1" name="type" id="typePage">
                                    </form>
                                </#if>
                                <#if type==2>
                                <#--分页表单-->
                                    <form method="post" action="" id="formId" class="form-inline">
                                        <input type="hidden" value="2" name="type" id="typePage">
                                    </form>
                                </#if>
                                <#if type==3>
                                <#--分页表单-->
                                    <form method="post" action="" id="formId" class="form-inline">
                                        <input type="hidden" value="3" name="type" id="typePage">
                                    </form>
                                </#if>

                                    <script>
                                        function _subType(type)
                                        {
                                            $("#formId").empty();
                                            $("#formId").append($("<input type='hidden' value='" + type +"' name='type'>"));
                                            _submitform(1);
                                        }
                                    </script>

                                </ul>
                                <div id="myTabContent" class="tab-content">

                                    <div role="tabpanel" class="tab-pane fade <#if type==1>active in</#if>" id="tab_content1" aria-labelledby="home-tab">
                                        <div class="panel-body">
                                            <table class="table table-striped">
                                                <thead>
                                                <tr>
                                                    <th width="5%">#</th>
                                                    <th width="65%">标题</th>
                                                    <th width="15%">所属类别</th>
                                                    <th width="15%">发布时间</th>
                                                </tr>
                                                </thead>
                                                <tbody>

                                                <#if page?exists && page.list?size gt 0 >
                                                    <#list page.list as it>
                                                <tr>
                                                    <th scope="row">${it_index+1}</th>
                                                    <td>${it.title}</td>
                                                    <td>${it.articleCategoryName!}</td>
                                                    <td>${it.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
                                                </tr>
                                                    </#list>
                                                </#if>

                                                </tbody>
                                            </table>

                                        <#if page?exists && page.list?size gt 0>
                                            <div class="col-md-12 col-sm-12 col-xs-12 text-center">
                                            ${page.pageHtml}
                                            </div>
                                        </#if>
                                        </div>
                                    </div>

                                    <div role="tabpanel" class="tab-pane fade <#if type==2>active in</#if>" id="tab_content2" aria-labelledby="profile-tab">
                                        <div class="panel-body">
                                            <table class="table table-striped">
                                                <thead>
                                                <tr>
                                                    <th width="5%">#</th>
                                                    <th width="65%">标题</th>
                                                    <th width="15%">所属类别</th>
                                                    <th width="15%">发布时间</th>
                                                </tr>
                                                </thead>
                                                <tbody>

                                                <#if page?exists && page.list?size gt 0 >
                                                    <#list page.list as it>
                                                    <tr>
                                                        <th scope="row">${it_index+1}</th>
                                                        <td>${it.title}</td>
                                                        <td>${it.articleCategoryName!}</td>
                                                        <td>${it.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
                                                    </tr>
                                                    </#list>
                                                </#if>

                                                </tbody>
                                            </table>

                                        <#if page?exists && page.list?size gt 0>
                                            <div class="col-md-12 col-sm-12 col-xs-12 text-center">
                                            ${page.pageHtml}
                                            </div>
                                        </#if>
                                        </div>
                                    </div>

                                    <div role="tabpanel" class="tab-pane fade <#if type==3>active in</#if>" id="tab_content3" aria-labelledby="profile-tab">
                                        <div class="panel-body">
                                            <table class="table table-striped">
                                                <thead>
                                                <tr>
                                                    <th width="5%">#</th>
                                                    <th width="65%">标题</th>
                                                    <th width="15%">所属类别</th>
                                                    <th width="15%">发布时间</th>
                                                </tr>
                                                </thead>
                                                <tbody>

                                                <#if page?exists && page.list?size gt 0 >
                                                    <#list page.list as it>
                                                    <tr>
                                                        <th scope="row">${it_index+1}</th>
                                                        <td>${it.title}</td>
                                                        <td>${it.articleCategoryName!}</td>
                                                        <td>${it.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
                                                    </tr>
                                                    </#list>
                                                </#if>

                                                </tbody>
                                            </table>

                                        <#if page?exists && page.list?size gt 0>
                                            <div class="col-md-12 col-sm-12 col-xs-12 text-center">
                                            ${page.pageHtml}
                                            </div>
                                        </#if>
                                        </div>
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
</body>
</html>
