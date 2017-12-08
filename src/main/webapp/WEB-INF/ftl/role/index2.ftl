
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
                            <h2>帐号管理<small>帐号列表 </small></h2>

                            <!-- 右侧工具栏 -->
                            <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                <li><a class="close-link"><i class="fa fa-close"></i></a></li>
                            </ul>

                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">

                                <!-- 判读是否拥有删除角色的权限 -->
                            <@shiro.hasPermission name="/role/deleteRoleById.shtml">
                                <input type="hidden" name="hasDel" value="1">
                            </@shiro.hasPermission>
                            <@shiro.hasPermission name="/role/addRole.shtml">
                                <span class="section">
                                    <button onclick="$('#addrole').modal();" type="button" class="btn btn-success">新增角色</button>
                                </span>
                            </@shiro.hasPermission>

                            <table id="table" class="table table-hover table-bordered table-condensed " cellspacing="0" width="100%">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>角色名称</th>
                                    <th>角色类型</th>
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

    <@shiro.hasPermission name="/role/addRole.shtml">
    <#--添加弹框-->
        <div class="modal fade" id="addrole" tabindex="-1" role="dialog" aria-labelledby="addroleLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="addroleLabel">添加角色</h4>
                    </div>
                    <div class="modal-body">
                        <form id="boxRoleForm">
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">角色名称:</label>
                                <input type="text" class="form-control" name="name" id="name" placeholder="请输入角色名称"/>
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">角色类型:</label>
                                <input type="text" class="form-control" id="type" name="type"  placeholder="请输入角色类型  [字母 + 数字] 6位">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" onclick="addRole();" class="btn btn-primary">Save</button>
                    </div>
                </div>
            </div>
        </div>
    <#--/添加弹框-->
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
<!-- Datatables -->
<script type="text/javascript" charset="utf8" src="${basePath}/static/assets/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" charset="utf8" src="${basePath}/static/build/js/loadDate_role_list.js"></script>

<script>
    <@shiro.hasPermission name="/role/addRole.shtml">
    <#--添加角色-->
    function addRole(){
        var name = $('#name').val(),
                type = $('#type').val();
        if($.trim(name) == ''){
            return layer.msg('角色名称不能为空。',so.default),!1;
        }
        if(!/^[a-z0-9A-Z]{6}$/.test(type)){
            return layer.msg('角色类型为6数字字母。',so.default),!1;
        }
    <#--loding-->
        var load = layer.load();
        $.post('${basePath}/role/addRole.shtml',{name:name,type:type},function(result){
            layer.close(load);
            if(result && result.status != 200){
                return layer.msg(result.message,so.default),!1;
            }
            layer.msg('添加成功。');
            setTimeout(function(){
                $('#formId').submit();
                location.reload();
            },1000);
        },'json');
    }
    </@shiro.hasPermission>
</script>
</body>
</html>
