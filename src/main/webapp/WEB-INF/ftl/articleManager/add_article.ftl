
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
    <!-- Switchery -->
    <link href="${basePath}/static/vendors/switchery/dist/switchery.min.css" rel="stylesheet">
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
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>添加文章： </h2>
                            <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                </li>
                                <li><a class="close-link"><i class="fa fa-close"></i></a>
                                </li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>

                        <div class="x_content" >
                            <form action="${basePath}/articleManager/add_article_do.shtml" method="post" class="form-horizontal form-label-left">
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">标题</label>
                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                        <input name="title" type="text" class="form-control" placeholder="标题">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">转载地址</label>
                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                        <input value="http://www.baidu.com" id="loadurl" name="loadurl" type="url" class="form-control" placeholder="转载地址">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">文章分类</label>
                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                        <select class="form-control" name="typeId" id="typeId">
                                            <option value="">请选择</option>
                                        <#if article_category?exists && article_category?size gt 0 >
                                            <#list article_category as it>
                                            <option value="${it.id}">${it.name}</option>
                                            </#list>
                                        </#if>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">简介描述 <span class="required">*</span>
                                    </label>
                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                        <textarea id="decoration" name="decoration" class="form-control" rows="3" placeholder='简介描述'></textarea>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">发布文章</label>
                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                        <div id="gender" class="btn-group" data-toggle="buttons">
                                            <label class="btn btn-default active" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                                <input type="radio" name="state" value="1" checked> &nbsp; 发布 &nbsp;
                                            </label>
                                            <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                                <input type="radio" name="state" value="2"> 待发布
                                            </label>
                                        </div>
                                    </div>
                                </div>

                                <TEXTAREA style="height: 500px;" id="content" name="content"></TEXTAREA>
                                <div class="ln_solid"></div>
                                <div class="form-group">
                                    <div class="col-md-5 col-sm-5 col-xs-12 col-md-offset-5">
                                        <button type="reset" class="btn btn-primary">重置</button>
                                        <button type="button" onclick="add();" class="btn btn-success">提交</button>
                                    </div>
                                </div>
                            </form>
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
<!-- Switchery -->
<script src="${basePath}/static/vendors/switchery/dist/switchery.min.js"></script>

<!-- editor -->
<script baseUrl="${basePath}" src="${basePath}/ueditor/ueditor.config.js"></script>
<script baseUrl="${basePath}" src="${basePath}/ueditor/ueditor.all.js"></script>
<script>
    //富文本编辑器
    UE.getEditor('content');
    UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;
    UE.Editor.prototype.getActionUrl = function(action) {
        if (action == 'uploadimage' || action == 'uploadscrawl' || action == 'uploadvideo') {
            return '${basePath}/uploadImage.shtml';
        } else {
            return this._bkGetActionUrl.call(this, action);
        }
    }

    <#--添加-->
    function add(){
        var title = $('input[name=title]').val();
        var typeId  = $('#typeId').val();
        var loadurl  = $('#loadurl').val();
        var decoration  = $('#decoration').val();
        var state  = $('input[name=state]').val();
        var content  = UE.getEditor('content').getContent();
        if($.trim(title) == ''){
            return layer.msg('文章标题不能为空。');
        }
        if($.trim(typeId) == ''){
            return layer.msg('选择文章分类');
        }
        if($.trim(loadurl) == ''){
            return layer.msg('转载地址不能为空');
        }
        if($.trim(decoration) == ''){
            return layer.msg('文章介绍不能为空');
        }
        if($.trim(content) == ''){
            return layer.msg('文章内容不能为空');
        }
    <#--loding-->
        var load = layer.load();
        $.post('${basePath}/articleManager/add_article_do.shtml',
                {title:title,typeId:typeId,loadurl:loadurl,decoration:decoration,state:state,content:content},
            function(result){

            layer.close(load);
            if(result && result.status != 200){
                return layer.msg(result.message);
            }
            layer.msg('添加成功。');
            window.location.href= "${basePath}/articleManager/article_manager_index.shtml";

        },'json');
    }
</script>
</body>
</html>
