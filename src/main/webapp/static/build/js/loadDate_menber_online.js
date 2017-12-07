//DataTable
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
                'url' : '/member/online_table.shtml', //请求地址
                //传递额外参数 (条件搜索)
                // 'data' : function (d) {
                //     d.test = 1;
                // }
            },
            // 显示字段
            "aoColumns": [{
                "class":          $("input[name='hasGetDetail']").length > 0 && $("input[name='hasGetDetail']").length ?'details-control':'',
                "orderable":      false,
                "mData":           null,
                "sDefaultContent": '',
                "sWidth" : "5%",
            },{ "mData": "sessionId",
                "orderable": false,
                "sDefaultContent" : "",
                "sWidth" : "10%",
            },{ "mData": "nickname",
                "orderable": true,
                "sDefaultContent" : "",
                "sWidth" : "10%",
            },{ "mData": "email",
                "orderable": true,
                "sDefaultContent" : "",
                "sWidth" : "10%",
            },{ "mData": "createTime",
                "orderable": true,
                "sDefaultContent" : "",
                "sWidth" : "10%",
                // 格式化时间戳
                "render": function(data, type, full) {
                    var dt = new Date(data);
                    return dt.Format("yyyy-MM-dd HH:mm:ss");
                }
            },{ "mData": "lastLoginTime",
                "orderable": false,
                "sDefaultContent" : "",
                "sWidth" : "10%",
                // 格式化时间戳
                "render": function(data, type, full) {
                    var dt = new Date(data);
                    return dt.Format("yyyy-MM-dd HH:mm:ss");
                }
            },{ "mData": "sessionStatus",
                "orderable": false,
                "sDefaultContent" : "",
                "sWidth" : "5%",
                // 格式化时间戳
                "render": function(data, type, full) {
                    return data?"有效":"已踢出";
                }
            },{ "mData": "null",
                "orderable": false,
                "sDefaultContent" : "",
                "sWidth" : "10%",
                // 返回自定义内容
                "render": function(data, type, full) {
                    if($("input[name='changeSessionStatus']").length > 0 && $("input[name='changeSessionStatus']").length) {
                        return "<a type='button' class='btn btn-danger btn-sm kickout' href='javascript:void(0);' sessionid='" + full.sessionId + "' >踢出</a>";
                    }
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
        $('#table tbody').on('click', 'a.kickout', function(e) {
            e.preventDefault();

            var table = $('#table').DataTable(); //获取DataTable对象
            var row = table.row($(this).parents('tr'))
            var sessionId = row.data().sessionId; //获取选中行数据.id
            var status = row.data().status?0:1;

            var index =  layer.confirm("确定踢出这个用户？",function(){
                var load = layer.load();
                $.post('/member/changeSessionStatus.shtml',{status:status,sessionIds:sessionId},function(result){
                    layer.close(load);
                    if(result && result.status != 200){
                        return layer.msg(result.message,function(){}),!1;
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
            //session状态
            var sessionId = d.sessionId == undefined ? '—' : d.sessionId;
            var startTime = d.startTime == undefined ? '—' : d.startTime;
            var lastAccess = d.lastAccess == undefined ? '—' : d.lastAccess;
            var host = d.host == undefined ? '—' : d.host;
            var timeout = d.timeout == undefined ? '—' : d.timeout;
            var timeout_text = timeout+"(毫秒)= "+timeout/1000+"(秒)=" + timeout/1000/60+"(分钟)";

            var real_name = d.real_name == undefined ? '未设置' : d.real_name;
            var identityNumber = d.identityNumber == undefined ? '未设置' : d.identityNumber;
            var address = d.address == undefined ? '未设置' : d.address;
            var tel = d.tel == undefined ? '未设置' : d.tel;

            var html = '<table class="table table-striped table-bordered dataTable no-footer dtr-inline" width="100%"  cellspacing="0" border="0">'+

                '<tr>'+
                '<td>Session Id:</td>'+
                '<td>'+ sessionId +'</td>'+
                '<td>Session创建时间:</td>'+
                '<td>'+ startTime +'</td>'+
                '</tr>'+

                '<tr>'+
                '<td>Session最后交互时间:</td>'+
                '<td>'+ lastAccess +'</td>'+
                '<td>Session Host:</td>'+
                '<td>'+ host +'</td>'+
                '</tr>'+

                '<tr>'+
                '<td>真实名字:</td>'+
                '<td>'+ real_name +'</td>'+
                '<td>身份证号码:</td>'+
                '<td>'+ identityNumber +'</td>'+
                '</tr>'+

                '<tr>'+
                '<td>地址:</td>'+
                '<td>'+address+'</td>'+
                '<td>tel(手机):</td>'+
                '<td>'+tel+'</td>'+
                '</tr>'+

                '<tr>'+
                '<td >Session timeout:</td>'+
                '<td colspan="3">'+timeout_text+'</td>'+
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
