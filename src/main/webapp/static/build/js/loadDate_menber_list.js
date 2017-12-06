
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
            'url' : '/member/list_table.shtml', //请求地址
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

            },{ "mData": "lastLoginTime",
              "orderable": false,
              "sDefaultContent" : "",
              "sWidth" : "10%",
            },{ "mData": "null",
              "orderable": false,
              "sDefaultContent" : "",
              "sWidth" : "10%",
                // 返回自定义内容
                "render": function(data, type, full) {
                    return "<a type='button' class='btn btn-warning btn-sm' href='/admin/userManage/" + full.id + "/edit'>详情</a>&nbsp; "
                    + "<a type='button' class='delete btn btn-danger btn-sm' href='javascript:void(0);' >删除</a>";
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


    ////单击行，改变行的样式
    //$('#table tbody').on('click', 'tr', function () {
    //    //联动checkbox 选中状态
    //    $($(this).children()[0]).children().each(function(){
    //        if(!this.checked){
		//			this.checked = true;
    //            }else{
		//			this.checked = false;
		//		}
    //    });
    //   $(this).toggleClass('selected');
    //} );


    //删除选中行
    $('#delete').click( function () {
       var Tdata = new Array();
       var ids = new Array();
       var table = $('#table').DataTable(); //获取DataTable对象
       Tdata = table.rows('.selected').data(); //获取选择行对象
       for (var i = 0; i < Tdata.length; i++) {
           ids[i] = Tdata[i]['id'];
       }
       if(ids.length<1){
           layer.alert('请至少选择一个');
	   }else{
           layer.msg('确定删除这些项目？', {
            time: 0
            ,btn: ['确定', '取消']
            ,yes: function(index){
              layer.close(index);
              var url = '/admin/userManage/destroy_many';
              var csrfToken = $("meta[name='csrf-token']").attr("content");
              var data = {
                  _token : csrfToken,
                  ids : ids,
              };

              var result = Util.ajaxHelper(url, 'POST', data);
              if(result.is_true){
                    table.rows('.selected').remove().draw( true ); //删除选中行
                    Util.notify(result.data.message, 1);
                }
              }
           });

	   }
    } );

    // 全选按钮被点击事件
    $('input[name=selectAll]').click(function(){
        if(this.checked){
            $('#table tbody tr').each(function(){
                if(!$(this).hasClass('selected')){
                    $(this).click();
                }
            });
        }else{
            $('#table tbody tr').click();
        }
    });


    $('#table tbody').on('click', 'a.delete', function(e) {
       e.preventDefault();

       var table = $('#table').DataTable(); //获取DataTable对象
       var row = table.row($(this).parents('tr'))
       var id = row.data().id; //获取选中行数据.id

        layer.msg('确定删除？', {
         time: 0
         ,btn: ['确定', '取消']
         ,yes: function(index){
           layer.close(index);
           var url = '/admin/userManage/' + id;
           var csrfToken = $("meta[name='csrf-token']").attr("content");
           var data = {
               _token: csrfToken
           };

           var result = Util.ajaxHelper(url, 'DELETE', data);
           if(result.is_true){
               row.remove().draw( true ); //删除选择行
               Util.notify(result.data.message, 1);
           }
           }
        });
    });

    /* 格式化每一行的数据隐藏格式 */
    function format ( d ) {
        // `d` is the original data object for the row
        var real_name = d.real_name == undefined ? '未设置' : d.real_name;
        var identityNumber = d.identityNumber == undefined ? '未设置' : d.identityNumber;
        var address = d.address == undefined ? '未设置' : d.address;
        var tel = d.tel == undefined ? '未设置' : d.tel;
        var status = d.status == 1 ? '激活' : '禁止';
        var updateTime = d.updateTime;

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
        '<td>'+status+'</td>'+
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
