var Util = function() {

    function isFunction(fn) {
      return (!!fn&&!fn.nodename&&fn.constructor!=String&&fn.constructor!=RegExp&&fn.constructor!=Array&&/function/i.test(fn+""));
    }

    // ajax 辅助函数
    var ajaxHelper = function (url, type, data, successDeal, errorDeal) {
          var result = {};
          $.ajax({
            url: url,
            type: type,
            data: data,
            async : false,
            dataType: "json",
            success: function(response, textStatus, xhr) {
              result.status = xhr.status;
              result.is_true = true;
              result.data = xhr.responseJSON;
              if (isFunction(successDeal)) {
                successDeal();
              };
            },
            error: function(xhr, textStatus, error) {
              result.status = xhr.status;
              result.is_true = false;
              result.data = xhr.responseJSON;
              if (isFunction(errorDeal)) {
                errorDeal();
              };
            }
          });
          return result;
    };

    var notify = function (message, type){
        layer.msg(message, {icon: type});
    }

    //弹出信息样式
    function layerAlert(message, skin, shift){
        layer.alert(message, {
          skin: skin, //样式类名
          shift: shift //动画类型
        });
    }

    return {
        ajaxHelper : ajaxHelper,
        notify : notify,
        layerAlert : layerAlert,
    };

}();

//JS时间戳格式化 毫秒级
Date.prototype.Format = function (fmt) {
    var o = {
        "M+": this.getMonth() + 1, //月份
        "d+": this.getDate(), //日
        "H+": this.getHours(), //小时
        "m+": this.getMinutes(), //分
        "s+": this.getSeconds(), //秒
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度
        "S": this.getMilliseconds() //毫秒
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}

