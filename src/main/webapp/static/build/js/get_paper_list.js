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
            'order' : [4,'desc'],   //默认排序

            // ajax请求
            "ajax": {
                'url' : '/exam/get_paper_list.shtml', //请求地址
                type:"POST",
                //传递额外参数 (条件搜索)
                'data' : function (d) {
                    d.type = $("input[name=type]").val();
                    d.courseType = $("input[name=courseType]").val();;
                    d.mode = $("input[name=mode]").val();;
                }
            },
            // 显示字段
            "aoColumns": [
                { "mData": "id",
                    "orderable": false,
                    "sDefaultContent" : "",
                    "sWidth" : "5%",
                },{ "mData": "examTitle",
                    "orderable": true,
                    "sDefaultContent" : "",
                    "sWidth" : "25%",
                },{ "mData": "examTime",
                    "orderable": true,
                    "sDefaultContent" : "",
                    "sWidth" : "10%",
                    "render": function(data, type, full) {
                            var fz = Math.floor(data / 60);
                            var ms = data % 60;
                            fz = (fz < 10) ? "0" + fz : fz;
                            ms = (ms < 10) ? "0" + ms : ms;
                            var sj = fz + "分" + ms + "秒";
                        return sj;
                    }
                },{ "mData": "state",
                    "orderable": false,
                    "sDefaultContent" : "",
                    "sWidth" : "10%",
                    // 格式化状态
                    "render": function(data, type, full) {
                        return data?"考过":"未考过";
                    }
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

                        html +="<a type='button' class='btn btn-warning btn-sm' href='/exam/start_exam_by_srandom.shtml?srandom=" + full.srandom + "'>开始考试</a>";

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


    }
})();
