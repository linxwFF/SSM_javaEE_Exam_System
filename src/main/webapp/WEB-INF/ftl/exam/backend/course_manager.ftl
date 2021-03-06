
<!DOCTYPE html>
<html lang="en">
<!-- header -->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title> 模拟考试系统 - 课程信息管理 </title>

    <!-- Bootstrap -->
    <link href="${basePath}/static/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${basePath}/static/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- 自定义样式 -->
    <link href="${basePath}/static/build/css/custom.css" rel="stylesheet">
    <!-- Datatables -->
    <link rel="stylesheet" type="text/css" href="${basePath}/static/assets/css/jquery.dataTables.min.css">

    <#--uploadImg-->
    <link rel="stylesheet" type="text/css" href="${basePath}/static/build/css/bootstrap-fileinput.css">


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

        td.details-control {
            background: url('${basePath}/static/assets/img/details_open.png') no-repeat center center;
            cursor: pointer;
        }
        tr.shown td.details-control {
            background: url('${basePath}/static/assets/img/details_close.png') no-repeat center center;
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
                            <h2>考试相关管理中心<small> 课程信息管理 </small></h2>

                            <!-- 右侧工具栏 -->
                            <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                <li><a class="close-link"><i class="fa fa-close"></i></a></li>
                            </ul>

                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">

                        <!-- 判读是否拥有删除的权限 -->
                        <@shiro.hasPermission name="/courseManager/deleteCourseManagerById.shtml">
                            <input type="hidden" name="hasDel" value="1">
                        </@shiro.hasPermission>

                        <!-- 判读是否拥有添加的权限 -->
                        <@shiro.hasPermission name="/courseManager/addCourseManager.shtml">
                            <span class="section">
                                    <button onclick="$('#add').modal();" type="button" class="btn btn-success">新增课程信息</button>
                            </span>
                        </@shiro.hasPermission>

                            <table id="table" class="table table-hover table-bordered table-condensed " cellspacing="0" width="100%">
                                <thead>
                                <tr>
                                    <th></th>
                                    <th>ID</th>
                                    <th>分类名</th>
                                    <th>类型</th>
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

    <@shiro.hasPermission name="/courseManager/addCourseManager.shtml">
    <#--弹框-->
        <div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="addArticleCategoryLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="addPermissionLabel">添加课程信息</h4>
                    </div>
                    <div class="modal-body">
                        <form id="boxRoleForm">
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">选择课程项目:</label>
                                <select class="form-control" name="parentId" id="parentId">
                                    <option value="0" selected>当期为顶级课程</option>
                                    <#if courses?exists && courses?size gt 0 >
                                        <#list courses as it>
                                            <option value="${it.id}">${it.name}</option>
                                        </#list>
                                    </#if>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">名称:</label>
                                <input type="text" class="form-control" name="name" id="name" placeholder="请输入分类名称"/>
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">类型(*唯一):</label>
                                <input type="number" class="form-control" id="type" name="type"  placeholder="请输入类型">
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">状态:</label>
                                <input type="number" class="form-control" id="state" name="state"  placeholder="请输入状态">
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">排序:</label>
                                <input type="number" class="form-control" id="sortOrder" name="sortOrder"  placeholder="请输入排序">
                            </div>

                            <div class="form-group">
                                <label for="recipient-name" class="control-label">课程图片:</label>
                                <input type="hidden" name="imgUrl" id="imgUrl">
                        </form>

                                <form id="uploadForm" enctype='multipart/form-data'>
                                    <div class="form-group">
                                        <div class="fileinput fileinput-new" data-provides="fileinput"  id="exampleInputUpload">
                                            <div class="fileinput-new thumbnail" style="width: 200px;height: auto;max-height:150px;">
                                                <img id='picImg' style="width: 100%;height: auto;max-height: 140px;" src="${basePath}/static/assets/images/noimage.png" alt="" />
                                            </div>
                                            <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px;"></div>
                                            <div>
                                                <span class="btn btn-primary btn-file">
                                                    <span class="fileinput-new">选择文件</span>
                                                    <span class="fileinput-exists">换一张</span>
                                                    <input type="file" name="upfile" id="upfile" accept="image/gif,image/jpeg,image/x-png"/>
                                                </span>
                                                <a href="javascript:;" class="btn btn-warning fileinput-exists" data-dismiss="fileinput">移除</a>
                                                <button type="button" id="uploadSubmit" class="btn btn-info">上传图片</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" onclick="add();" class="btn btn-primary">Save</button>
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
<script type="text/javascript" charset="utf8" src="${basePath}/static/build/js/course_manager_index.js"></script>
<!-- 图片上传 -->
<script src="${basePath}/static/build/js/bootstrap-fileinput.js"></script>
<script>
    <@shiro.hasPermission name="/courseManager/addCourseManager.shtml">
    <#--添加权限-->
    function add(){
        var name = $('#name').val();
        var state = $('#state').val();
        var sortOrder = $('#sortOrder').val();
        var type = $("#type").val();
        var parentId = $("#parentId").val();
        var imgUrl = $("#imgUrl").val();

        if($.trim(name) == ''){
            return layer.msg('名称不能为空。');
        }
        if($.trim(state) == ''){
            return layer.msg('状态不能为空。');
        }
        if($.trim(sortOrder) == ''){
            return layer.msg('排序不能为空。');
        }
        if($.trim(type) == ''){
            return layer.msg('类型不能为空。');
        }
    <#--loding-->
        var load = layer.load();
        $.post('${basePath}/courseManager/addCourseManager.shtml',
                {   name:name,
                    state:state,
                    sortOrder:sortOrder,
                    type:type,
                    parentId:parentId,
                    imgUrl:imgUrl
                },function(result){
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

<#--上传图片-->
<script type="text/javascript">
    $(function () {
        //比较简洁，细节可自行完善
        $('#uploadSubmit').click(function () {
            var data = new FormData($('#uploadForm')[0]);

            console.log(data.get("upfile"));

            $.ajax({
                url: '/uploadImage.shtml',
                type: 'POST',
                data: data,
                async: false,
                cache: false,
                contentType: false,
                processData: false,
                success: function (data) {
                    $("#imgUrl").val(data.targetFileName);
                    layer.msg('上传成功。');
                },
                error: function (data) {
                    layer.msg('上传失败。');
                    console.log("一般是FTP服务器没开");
                }
            });
        });

    })
</script>
</body>
</html>
