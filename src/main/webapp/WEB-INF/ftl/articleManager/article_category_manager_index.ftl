
<!DOCTYPE html>
<html lang="en">
<!-- header -->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title> 模拟考试系统 - 文章分类管理 </title>

    <!-- Bootstrap -->
    <link href="${basePath}/static/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${basePath}/static/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- 自定义样式 -->
    <link href="${basePath}/static/build/css/custom.css" rel="stylesheet">
    <!-- Datatables -->
    <link rel="stylesheet" type="text/css" href="${basePath}/static/assets/css/jquery.dataTables.min.css">
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
            <div class="row black">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>文章管理<small> 文章分类管理 </small></h2>

                            <!-- 右侧工具栏 -->
                            <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                <li><a class="close-link"><i class="fa fa-close"></i></a></li>
                            </ul>

                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">

                        <!-- 判读是否拥有删除权限的权限 -->
                        <@shiro.hasPermission name="/articleManager/deleteArticleCategoryById.shtml">
                            <input type="hidden" name="hasDel" value="1">
                        </@shiro.hasPermission>

                        <@shiro.hasPermission name="/articleManager/addArticleCategory.shtml">
                            <span class="section">
                                    <button onclick="$('#addArticleCategory').modal();" type="button" class="btn btn-success">新增文章分类</button>
                                </span>
                        </@shiro.hasPermission>

                            <table id="table" class="table table-hover table-bordered table-condensed " cellspacing="0" width="100%">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>分类名</th>
                                    <th>状态</th>
                                    <th>排序</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- /页面内容 -->

        <!-- 脚部内容 -->
    <@footer.footer 1/>
        <!-- /脚部内容  -->

    <@shiro.hasPermission name="/articleManager/addArticleCategory.shtml">
    <#--弹框-->
        <div class="modal fade" id="addArticleCategory" tabindex="-1" role="dialog" aria-labelledby="addArticleCategoryLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="addPermissionLabel">添加文章分类</h4>
                    </div>
                    <div class="modal-body">
                        <form id="boxRoleForm">
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">分类名称:</label>
                                <input type="text" class="form-control" name="name" id="name" placeholder="请输入分类名称"/>
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">状态:</label>
                                <input type="number" class="form-control" id="state" name="state"  placeholder="请输入状态">
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">排序:</label>
                                <input type="number" class="form-control" id="sortOrder" name="sortOrder"  placeholder="请输入排序">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" onclick="addArticleCategory();" class="btn btn-primary">Save</button>
                    </div>
                </div>
            </div>
        </div>
    <#--/弹框-->
    </@shiro.hasPermission>
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
<!-- Datatables -->
<script type="text/javascript" charset="utf8" src="${basePath}/static/assets/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" charset="utf8" src="${basePath}/static/build/js/article_category_manager_index.js"></script>

<script>
    <@shiro.hasPermission name="/articleManager/addArticleCategory.shtml">
    <#--添加权限-->
    function addArticleCategory(){
        var name = $('#name').val();
        var state = $('#state').val();
        var sortOrder = $('#sortOrder').val();

        if($.trim(name) == ''){
            return layer.msg('分类名称不能为空。');
        }
        if($.trim(state) == ''){
            return layer.msg('分类状态不能为空。');
        }
        if($.trim(sortOrder) == ''){
            return layer.msg('分类排序不能为空。');
        }
    <#--loding-->
        var load = layer.load();
        $.post('${basePath}/articleManager/addArticleCategory.shtml',{name:name,state:state,sortOrder:sortOrder},function(result){
            layer.close(load);
            if(result && result.status != 200){
                return layer.msg(result.message);
            }
            layer.msg('添加成功。');
            location.reload();

        },'json');
    }
    </@shiro.hasPermission>
</script>
</body>
</html>
