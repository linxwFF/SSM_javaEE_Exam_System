/*
 *激活 | 禁止用户登录
 */
function forbidUserById(status,id){
    if(id == 1){
        layer.msg('管理员帐号无法操作');
        return;
    }
    var text = status?'激活登录':'禁止登录';
    var index = layer.confirm("确定"+text+"这个用户？",function(){
        var load = layer.load();
        $.post('/member/forbidUserById.shtml',{status:status,id:id},function(result){
            layer.close(load);
            if(result && result.status != 200){
                return layer.msg(result.message,so.default),!0;
            }else{
                layer.msg(text +'成功');
                var forItem = $("#forItem_"+id);

                if(text=="激活登录"){
                    forItem.text("禁止登录");

                    var text1 = "javascript:forbidUserById(0,"+id+")";
                    forItem.attr("href",text1);

                    forItem.removeClass("btn-success");
                    forItem.addClass("btn-danger");
                }else{
                    forItem.text("激活登录");

                    var text1 = "javascript:forbidUserById(1,"+id+")";
                    forItem.attr("href",text1);
                    forItem.removeClass("btn-danger");
                    forItem.addClass("btn-success");
                }

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
            'url' : '/member/list.shtml', //请求地址
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
            },{ "mData": null,
              "orderable": false,
              "sDefaultContent" : "",
              "sWidth" : "5%",
                // 返回自定义内容
                "render": function(data, type, full) {
                    return '<input name="selectItem" type="checkbox" value="' + full.id + '" />';
                },
            },{ "mData": "id",
              "orderable": false,
              "sDefaultContent" : "",
              "sWidth" : "5%",
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
                "render": function(data, type, full) {
                    var dt = new Date(data);
                    return dt.Format("yyyy-MM-dd HH:mm:ss");;
                }
            },{ "mData": "null",
              "orderable": false,
              "sDefaultContent" : "",
              "sWidth" : "10%",
                // 返回自定义内容
                "render": function(data, type, full) {
                    var html = "";

                    html +="<a type='button' class='btn btn-warning btn-sm' href='/member/get_user_info/" + full.id + ".shtml'>详情</a>";

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

       var index =  layer.confirm("确定这个用户？",function(){
            var load = layer.load();
            $.post('/member/deleteUserById.shtml',{ids:id},function(result){
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
        // `d` is the original data object for the row
        var id = d.id;
        var real_name = d.real_name == undefined ? '未设置' : d.real_name;
        var identityNumber = d.identityNumber == undefined ? '未设置' : d.identityNumber;
        var address = d.address == undefined ? '未设置' : d.address;
        var tel = d.tel == undefined ? '未设置' : d.tel;

        var html_status = "";
        var status = d.status == 1 ? 0 : 1;
        var status_text = d.status == 1 ? '禁止登录' : '激活登录';
        var status_class = d.status == 1 ? 'btn-danger' : 'btn-success';

        if($("input[name='hasFor']").length > 0 && $("input[name='hasFor']").length)
        {
            html_status += '<a id="forItem_'+id+'" type="button" class="forbid btn '+status_class+' btn-sm" href="javascript:forbidUserById('+status+','+id+')">'+status_text+'</a>';
        }

        var dt = new Date(d.updateTime);
        var updateTime = dt.Format("yyyy-MM-dd HH:mm:ss");

        var html = '<table class="table table-striped table-bordered dataTable no-footer dtr-inline" width="100%"  cellspacing="0" border="0">'+

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
        '<td>状态:</td>'+
        '<td>'+html_status+'</td>'+
        '<td>更新时间:</td>'+
        '<td>'+updateTime+'</td>'+
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
