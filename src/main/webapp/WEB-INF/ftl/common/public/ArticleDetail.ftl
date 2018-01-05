<#macro ArticleDetail index>
<div class="modal fade" id="Detail" tabindex="-1" role="dialog" aria-labelledby="Detail">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h5 class="modal-title" id="Detail"><span id="title"> </span> </h5>
            </div>
            <div class="modal-body">

                <div class="row">
                    <div class="col-md-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <small id="decoration"> 简介 </small>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">

                                <div class="col-md-12 col-lg-12 col-sm-12">
                                    <p id="content"></p>
                                    <footer>
                                        <cite title="Source Title"><span id="anthor"></span>-<span id="updateTime"></span></cite>
                                    </footer>
                                </div>

                                <div class="clearfix"></div>

                                <div class="col-md-12">
                                <#--<h4>转载地址</h4>-->
                                <#--<span class="label label-default">Default</span>-->
                                <#--<span class="label label-primary">Primary</span>-->
                                    <span class="label label-success">标签</span>
                                <#--<span class="label label-info">Info</span>-->
                                <#--<span class="label label-warning">Warning</span>-->
                                <#--<span class="label label-danger">Danger</span>-->
                                <#--<span class="badge bg-green">42</span>-->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<script>

    function ajax_loadDetail(id)
    {
        $.ajax({
            type: "POST",
            url: "${basePath}/articleManager/Detail.shtml",
            data: "id="+id,
            success: function(data){
                $("#title").html(data.data.title);
                $("#decoration").html(data.data.decoration);
                $("#content").html(data.data.content);
                $("#anthor").html(data.data.anthor);

                var dt = new Date(data.data.updateTime);
                var updateTime = dt.Format("yyyy-MM-dd HH:mm:ss");
                $("#updateTime").html(updateTime);

                $('#Detail').modal('show');
            }
        });
    }

</script>
</#macro>