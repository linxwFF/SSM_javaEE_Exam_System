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
            'order' : [5,'desc'],   //默认排序

            // ajax请求
            "ajax": {
                'url' : '/QuestionManager/list.shtml', //请求地址
                type:"POST",
                //传递额外参数 (条件搜索)
                // 'data' : function (d) {
                //     d.test = 1;
                // }
            },
            // 显示字段
            "aoColumns": [
                {
                    "class":          'details-control',
                    "orderable":      false,
                    "mData":           null,
                    "sDefaultContent": '',
                    "sWidth" : "5%",
                },{ "mData": "id",
                    "orderable": false,
                    "sDefaultContent" : "",
                    "sWidth" : "5%",
                },{ "mData": "subject",
                    "orderable": true,
                    "sDefaultContent" : "",
                    "sWidth" : "40%",
                },{ "mData": "typeName",
                    "orderable": true,
                    "sDefaultContent" : "",
                    "sWidth" : "10%",
                },{ "mData": "courseTypeIdName",
                    "orderable": true,
                    "sDefaultContent" : "",
                    "sWidth" : "10%",
                },{ "mData": "create_time",
                    "orderable": true,
                    "sDefaultContent" : "",
                    "sWidth" : "15%",
                    // 格式化时间戳
                    "render": function(data, type, full) {
                        var dt = new Date(data);
                        return dt.Format("yyyy-MM-dd HH:mm:ss");
                    }
                },{ "mData": "null",
                    "orderable": false,
                    "sDefaultContent" : "",
                    "sWidth" : "15%",
                    // 返回自定义内容
                    "render": function(data, type, full) {
                        var html = "";

                        if($("input[name='hasUp']").length > 0 && $("input[name='hasUp']").length)
                        {
                            html +="<a type='button' class='btn btn-warning btn-sm' href='/QuestionManager/update.shtml?id="+full.id+"'>修改</a>";
                        }

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
        });

//----------------------------自定义操作------------------------

        //单个选中删除按钮事件
        $('#table tbody').on('click', 'a.delete', function(e) {
            e.preventDefault();

            var table = $('#table').DataTable(); //获取DataTable对象
            var row = table.row($(this).parents('tr'))
            var id = row.data().id; //获取选中行数据.id

            var index =  layer.confirm("是否真的要删除该题目？",function(){
                var load = layer.load();
                $.post('/QuestionManager/delete.shtml',{id:id},function(result){
                    layer.close(load);
                    if(result && result.status != 200){
                        layer.msg(result.message);
                        return ;
                    }else{
                        row.remove().draw( true ); //删除选择行
                        layer.msg(result.message);
                    }
                },'json');
                layer.close(index);
            });

        });

        /* 格式化每一行的数据隐藏格式 */
        function format ( d ) {
            var chooseA = d.choose_A == undefined ? '未设置' : d.choose_A;
            var chooseB = d.choose_B == undefined ? '未设置' : d.choose_B;
            var chooseC = d.choose_C == undefined ? '未设置' : d.choose_C;
            var chooseD = d.choose_D == undefined ? '未设置' : d.choose_D;

            var chooseF = d.choose_E == undefined ? '未设置' : d.choose_E;
            var chooseE = d.choose_F == undefined ? '未设置' : d.choose_F;
            var chooseG = d.choose_G == undefined ? '未设置' : d.choose_G;

            var type = d.type == undefined ? '未设置' : d.type;

            var chooseRight = d.choose_right == undefined ? '未设置' : d.choose_right;
            var analysis = d.analysis == undefined ? '未设置' : d.analysis;

            var html = '<table class="table table-striped table-bordered dataTable no-footer dtr-inline" width="100%"  cellspacing="0" border="0">';

            html +=
                '<tr>'+
                '<td width="25%">选项A:</td>'+
                '<td width="25%">'+chooseA +'</td>'+
                '<td width="25%">选项B:</td>'+
                '<td width="25%">'+ chooseB +'</td>'+
                '</tr>'+

                '<tr>'+
                '<td width="25%">选项C:</td>'+
                '<td width="25%">'+chooseC+'</td>'+
                '<td width="25%">选项D:</td>'+
                '<td width="25%">'+chooseD+'</td>'+
                '</tr>';

            html +=
                '<tr>'+
                '<td >正确答案:</td>'+
                '<td colspan="3">'+chooseRight+'</td>'+
                '</tr>'+

                '<tr>'+
                '<td >选项解析:</td>'+
                '<td colspan="3">'+analysis+'</td>'+
                '</tr>'+
                '</table>';

            return html;
        }

        // Add event listener for opening and closing details
        $('#table tbody').on('click', 'td.details-control', function () {
            var tr = $(this).closest('tr');
            var row = table.row( tr );
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
        } );
    }
})();
