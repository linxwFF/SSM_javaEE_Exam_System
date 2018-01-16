
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
                            <h2>权限管理<small>权限列表 </small></h2>

                            <!-- 右侧工具栏 -->
                            <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                <li><a class="close-link"><i class="fa fa-close"></i></a></li>
                            </ul>

                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">

                            <!-- 判读是否拥有删除权限的权限 -->
                        <@shiro.hasPermission name="/permission/deletePermissionById.shtml">
                            <input type="hidden" name="hasDel" value="1">
                        </@shiro.hasPermission>
                        <@shiro.hasPermission name="/permission/addPermission.shtml">
                            <span class="section">
                                    <button onclick="$('#addPermission').modal();" type="button" class="btn btn-success">新增权限</button>
                                </span>
                        </@shiro.hasPermission>

                            <table id="table" class="table table-hover table-bordered table-condensed " cellspacing="0" width="100%">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>权限名称</th>
                                    <th>权限类型</th>
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

    <@shiro.hasPermission name="/permission/addPermission.shtml">
    <#--弹框-->
        <div class="modal fade" id="addPermission" tabindex="-1" role="dialog" aria-labelledby="addPermissionLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="addPermissionLabel">添加权限</h4>
                    </div>
                    <div class="modal-body">
                        <form id="boxRoleForm">
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">权限名称:</label>
                                <input type="text" class="form-control" name="name" id="name" placeholder="请输入权限名称"/>
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">权限URL地址:</label>
                                <input type="text" class="form-control" id="url" name="url"  placeholder="请输入权限URL地址">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" onclick="addPermission();" class="btn btn-primary">Save</button>
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
<script type="text/javascript" charset="utf8" src="${basePath}/static/build/js/loadData_permission_list.js"></script>

<script>
    <@shiro.hasPermission name="/permission/addPermission.shtml">
    <#--添加权限-->
    function addPermission(){
        var name = $('#name').val(),
                url  = $('#url').val();
        if($.trim(name) == ''){
            return layer.msg('权限名称不能为空。');
        }
        if($.trim(url) == ''){
            return layer.msg('权限Url不能为空。');
        }
    <#--loding-->
        var load = layer.load();
        $.post('${basePath}/permission/addPermission.shtml',{name:name,url:url},function(result){
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
