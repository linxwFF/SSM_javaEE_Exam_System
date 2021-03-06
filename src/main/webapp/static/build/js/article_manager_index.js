/*
 * 改变文章发布状态
 */
function ChangeStateById(status,id){
    var text = status?'已发布':'待发布';
    var index = layer.confirm("确定"+text+"改变这个文章的发布状态？",function(){
        var load = layer.load();
        $.post('/articleManager/ChangeStateById.shtml',{status:status,id:id},function(result){
            layer.close(load);
            if(result && result.status != 200){
                return layer.msg(result.message);
            }else{
                layer.msg(text +'成功');
                var forItem = $("#forItem_"+id);

                if(text=="已发布"){
                    forItem.text("已发布");

                    var text1 = "javascript:ChangeStateById(0,"+id+")";
                    forItem.attr("href",text1);

                    forItem.removeClass("btn-warning");
                    forItem.addClass("btn-success");
                }else{
                    forItem.text("待发布");

                    var text1 = "javascript:ChangeStateById(1,"+id+")";
                    forItem.attr("href",text1);
                    forItem.removeClass("btn-success");
                    forItem.addClass("btn-warning");
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
            'order' : [5,'desc'],   //默认排序

            // ajax请求
            "ajax": {
                'url' : '/articleManager/article_manager_index.shtml', //请求地址
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
            },{ "mData": "title",
                "orderable": true,
                "sDefaultContent" : "",
                "sWidth" : "10%",
            },{ "mData": "articleCategory",
                "orderable": true,
                "sDefaultContent" : "",
                "sWidth" : "10%",
            },{ "mData": "state",
                "orderable": true,
                "sDefaultContent" : "",
                "sWidth" : "10%",
                "render": function(data, type, full) {

                    var html_status = "";
                    var status = data ? 0 : 1;
                    var status_text = data == 1 ? '已发布' : '待发布';
                    var status_class = data == 1 ? 'btn-success' : 'btn-warning';

                    if($("input[name='hasFor']").length > 0 && $("input[name='hasFor']").length)
                    {
                        html_status += '<a id="forItem_'+full.id+'" type="button" class="btn '+status_class+' btn-sm" href="javascript:ChangeStateById('+status+','+full.id+')">'+status_text+'</a>';
                    }

                    return html_status;
                }
            },{ "mData": "anthor",
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
            },{ "mData": "null",
                "orderable": false,
                "sDefaultContent" : "",
                "sWidth" : "10%",
                // 返回自定义内容
                "render": function(data, type, full) {
                    var html = "";

                    html +="<a type='button' onclick='ajax_loadDetail("+full.id+")' class='btn btn-warning btn-sm' href='javascript:void(0);'>文章预览</a>";

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
                $.post('/articleManager/deleteArticleById.shtml',{ids:id},function(result){
                    layer.close(load);
                    if(result && result.status != 200){
                        layer.msg(result.message);
                        return ;
                    }else{
                        row.remove().draw( true ); //删除选择行
                        layer.msg(result.message);
                        location.reload();
                    }
                },'json');
                layer.close(index);
            });

        });
    }
})();
