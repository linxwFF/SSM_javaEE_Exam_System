function del(id){
    var index =  layer.confirm("确定这个文章分类？",function(){
        var load = layer.load();
        $.post('/courseManager/deleteCourseManagerById.shtml',{id:id},function(result){
            layer.close(load);
            if(result && result.status != 200){
                layer.msg(result.message);
                return ;
            }else{
                layer.msg(result.message);
                location.replace(location.href);
            }
        },'json');
        layer.close(index);
    });
}


(function() {
    'use strict';

    $(document).ready(function() {
        //表格初始化
        initTable();
    });

    /**
     *表格初始化
     */
    function initTable() {
        var table = $('#table').DataTable( { //初始化表格

            "processing": true, //进度提示

            // "searching" : false, //搜索框
            // "paging" : false, //翻页
            // "bServerSide" : false, //服务端模式
            // "bAutoWidth" : true, //自适应宽度
            // "ordering" : false, //全局禁用排序
            // "bStateSave" : false, //保持状态

            // ajax请求
            "ajax": {
                'url' : '/courseManager/courseManager_index.shtml', //请求地址
                type:"POST",
                //传递额外参数 (条件搜索)
                // 'data' : function (d) {
                //     d.test = 1;
                // }
            },
            // 显示字段
            "aoColumns": [{
                "class":          'details-control',
                "orderable":      false,
                "mData":           null,
                "sDefaultContent": '',
                "sWidth" : "5%",
            },{ "mData": "id",
                "orderable": false,
                "sDefaultContent" : "",
                "sWidth" : "5%",
            },{ "mData": "name",
                "orderable": true,
                "sDefaultContent" : "",
                "sWidth" : "15%",
            },{ "mData": "type",
                "orderable": true,
                "sDefaultContent" : "",
                "sWidth" : "10%",
            },{ "mData": "sortOrder",
                "orderable": true,
                "sDefaultContent" : "",
                "sWidth" : "10%",
            },{ "mData": "null",
                "orderable": false,
                "sDefaultContent" : "",
                "sWidth" : "20%",
                // 返回自定义内容
                "render": function(data, type, full) {
                    var html = "";

                    if($("input[name='hasDel']").length > 0 && $("input[name='hasDel']").length)
                    {
                        html += "<a type='button' class='delete btn btn-danger btn-sm' href='javascript:void(0);' >删除</a>";
                    }

                    return html;
                }
            },
            ],

            // 设置每页显示记录的下拉菜单
            "aLengthMenu": [[10, 25, 50, 100, 200, -1], ["每页10条", "每页25条", "每页50条", "每页100条", "每页200条", "显示所有数据"]],

            // 中文
            "oLanguage": {
                "sLengthMenu": "每页显示 _MENU_ 条记录",
                "sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
                "sInfoEmpty": "没有数据",
                "sInfoFiltered": "(从 _MAX_ 条数据中检索)",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "前一页",
                    "sNext": "后一页",
                    "sLast": "尾页"
                },
                "sZeroRecords": "没有检索到数据",
                "sProcessing": "<img src='/static/assets/img/loading.gif' />",
                "sSearch": "搜索"
            },
            // 初始化回调函数
            // initComplete:initComplete,
            // drawCallback: function( settings) {
            //     $('input[name=selectAll]')[0].checked = false; //取消全选状态
            // }
        });

//----------------------------自定义操作------------------------
        //单个选中删除按钮事件
        $('#table tbody').on('click', 'a.delete', function(e) {
            e.preventDefault();

            var table = $('#table').DataTable(); //获取DataTable对象
            var row = table.row($(this).parents('tr'))
            var id = row.data().id; //获取选中行数据.id

            var index =  layer.confirm("确定这个文章分类？",function(){
                var load = layer.load();
                $.post('/courseManager/deleteCourseManagerById.shtml',{id:id},function(result){
                    layer.close(load);
                    if(result && result.status != 200){
                        layer.msg(result.message);
                        return ;
                    }else{
                        row.remove().draw( true ); //删除选择行
                        layer.msg(result.message);
                        location.replace(location.href);
                    }
                },'json');
                layer.close(index);
            });

        });

        /* 格式化每一行的数据隐藏格式 */
        function format ( d ) {
            var html = '<table id="extra_property'+d.id+'" class="table table-striped table-bordered dataTable no-footer dtr-inline" width="100%"  cellspacing="0" border="0">' +

                '</table>';
            return html;
        }

        $('#table tbody').on('click', 'td.details-control', function () {
            var tr = $(this).closest('tr');
            var row = table.row( tr );
            var id = table.row( $(this).parents('tr') ).data().id;

            $.ajax({
                type:'post',
                url: '/courseManager/selectCourseTypeId.shtml',
                data: {parent_id:id},
                success:function(data){

                    if(data.data.length > 0 ){
                        var strHtml = '<tr>'+
                            '<td>ID</td>'+
                            '<td>分类名</td>'+
                            '<td>类型</td>'+
                            '<td>排序</td>'+
                            '<td>操作</td>'+
                            '</tr>';
                        $('#extra_property'+id).append(strHtml);

                        $.each(data.data,function(key,value){
                            ajaxCallback(value,id);  //回调函数
                        });
                    }else{
                        var strHtml = '<tr>'+
                            '<td>无子课程信息</td>'+
                            '</tr>';
                        $('#extra_property'+id).append(strHtml);
                    }

                }
            });

            if ( row.child.isShown() ) {
                // This row is already open - close it
                row.child.hide();
                tr.removeClass('shown');
            }
            else {
                // Open this row
                row.child( format(row.data()) ).show();
                tr.addClass('shown');
            }
        });


        function ajaxCallback(data,id){

            var strHtml = "<tr>" +
                "<td>"+data.id+"</td>" +
                "<td>"+data.name+"</td>" +
                "<td>"+data.type+"</td>" +
                "<td>"+data.sortOrder+"</td>" +
                "<td><a type=\"button\" class=\"btn btn-warning btn-sm\" href=\"/courseManager/chapterManager_index.shtml?course_type_id="+data.id+"\">章节管理</a>" +
                "<a type=\"button\" class=\"btn btn-danger  btn-sm\" onclick=\"del("+data.id+")\">删除</a></td>"
                "</tr>";

            $('#extra_property'+id).append(strHtml);
        }
    }
})();
