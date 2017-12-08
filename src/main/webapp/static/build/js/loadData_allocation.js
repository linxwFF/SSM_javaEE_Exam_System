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
                'url' : '/permission/allocation.shtml', //请求地址
                type:"POST",
                //传递额外参数 (条件搜索)
                // 'data' : function (d) {
                //     d.test = 1;
                // }
            },
            // 显示字段
            "aoColumns": [{ "mData": "id",
                "orderable": false,
                "sDefaultContent" : "",
                "sWidth" : "5%",
            },{ "mData": "name",
                "orderable": true,
                "sDefaultContent" : "",
                "sWidth" : "10%",
            },{ "mData": "type",
                "orderable": true,
                "sDefaultContent" : "",
                "sWidth" : "10%",
            },{ "mData": "permissionNames",
                "orderable": true,
                "sDefaultContent" : "",
                "sWidth" : "20%",
            },{ "mData": "null",
                "orderable": false,
                "sDefaultContent" : "",
                "sWidth" : "10%",
                // 返回自定义内容
                "render": function(data, type, full) {
                    var html = "";

                    if($("input[name='hasSelectPermission']").length > 0 && $("input[name='hasSelectPermission']").length)
                    {
                        html += "<a type='button' class='selectPermission btn btn-info btn-sm' href='javascript:void(0);' >选择权限</a>";
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
        //显示出角色列表到模态框中
        $('#table tbody').on('click', 'a.selectPermission', function(e) {
            e.preventDefault();

            var table = $('#table').DataTable(); //获取DataTable对象
            var row = table.row($(this).parents('tr'))
            var id = row.data().id; //获取选中行数据.id

            var load = layer.load();
            $.post("/permission/selectPermissionById.shtml",{id:id},function(result){
                layer.close(load);
                if(result && result.length){
                    var html =[];
                    $.each(result,function(){
                        html.push("<div class='checkbox'><label>");
                        html.push("<input type='checkbox' selectBox='' id='");
                        html.push(this.id);
                        html.push("'");
                        if(this.check){
                            html.push(" checked='checked'");
                        }
                        html.push("name='");
                        html.push(this.name);
                        html.push("'/>");
                        html.push(this.name);
                        html.push('</label></div>');
                    });
                    //初始化全选。
                     $('#boxRoleForm').html(html.join(''));
                     $('#selectPermission').modal(),$('#selectRoleId').val(id);
                }else{
                    return layer.msg('没有获取到权限数据，请先添加权限数据。');
                }
            },'json');

        });

    }
})();
