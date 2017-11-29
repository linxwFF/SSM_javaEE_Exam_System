/*右侧标题栏代码*/
$(document).ready(function () {
	ZSY();
})
/*宽度自适应代码，适应1024以上分辨率*/
$(window).load(function () {
    ZSY();
})
function ZSY(){
    var ww = $(window).width(); //iframepage
    var wh = $(window).height();

    if ($(".myexam_head").length > 0) {
        var th = $(".myexam_head").height();
        $(".myexam_body table td.myexam_options").height(wh - th);
        $(".slidingList_none").height(wh - th - 10);
        $(".slidingList").height(wh - th - 10);
    }
    
    if ($(".mywebleft").length > 0) {
        $(".mywebleft").height(wh - 50)
        $(".mywebright").height(wh - 50)
    }

}

function popup(title,td,text, time) {
    $("body").append("<div class='tanchuang'><div class='tanchuang_nk'><div class='tanchuang_x'>" + title + "<a><img src='../images/popup/x.png' alt=''/></a></div><div class='tanchuang_nr'><p style='text-indent:2em'>" + text + "</p><div class='tanchuang_time'><p>" + td + "</p><p>" + time + "</p></div></div></div></div>");
    $(document).on('click', '.tanchuang_x a', function () {
        //function code here.
        $(".tanchuang").css('display', 'none');
    });
}

function sildethis(obj) {
    $(obj).next("ul").slideToggle({
        duration: 300,
        easing: 'swing'
    });
    
    if ($(obj).find(".icon-caret-down").length == 1) {
        $(obj).find(".icon-caret-down").removeClass("icon-caret-down").addClass("icon-caret-right");
    }
    else {
        $(obj).find(".icon-caret-right").removeClass("icon-caret-right").addClass("icon-caret-down");
    }
}

