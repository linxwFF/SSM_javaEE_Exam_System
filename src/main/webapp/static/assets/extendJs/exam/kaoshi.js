
$().ready(function () {
    //左侧栏中的收起打开
    $('.numberlist li').on("click", function () {
        var index = parseInt($(this).html()) - 1;
        $('.temp').each(function () {
            if ($(this).css("display") == "block") {
                $(this).children('.divr').css("display", "none");
                $(this).children('.divr:eq(' + index + ')').css("display", "block");
            }
        });
    });
    //单选题做题左侧栏变色
    $('.divr input[type=radio]').on("click", function () {
        $('.myexam_wrap').children('div:visible').find('li').eq($(this).parents('.divr').index()).attr("class", "havebg");
    });
    //多选题做题左侧栏变色
    $('.divr input[type=checkbox]').on("click", function () {
        $('.myexam_wrap').children('div:visible').find('li').eq($(this).parents('.divr').index()).attr("class", "havebg");
    });
    //第一题
    $('img[src*=diyiti]').on("click", function () {
        //alert($(this).parents('.temp').children('.divr').eq(0).html())
        //var index=parseInt($(this).parents('.divr').index())+1;
        $(this).parents('.temp').children('.divr').css("display", "none");
        $(this).parents('.temp').children('.divr').eq(0).css("display", "block");
    });
    //上一题
    $('img[src*=shangyiti]').on("click", function () {
        var index = parseInt($(this).parents('.divr').index()) - 1;
        if (index > -1) {
            $(this).parents('.temp').children('.divr').css("display", "none");
            $(this).parents('.temp').children('.divr').eq(index).css("display", "block");
        }
    });
    //下一题
    $('img[src*=xiayiti]').on("click", function () {
        var zcd = $(this).parents('.temp').children('.divr').length;
        var index = parseInt($(this).parents('.divr').index()) + 1;
        if (zcd > index) {
            $(this).parents('.temp').children('.divr').css("display", "none");
            $(this).parents('.temp').children('.divr').eq(index).css("display", "block");
        }
    });
    //最后一题
    $('img[src*=zuimoti]').on("click", function () {
        var zcd = $(this).parents('.temp').children('.divr').length;
        var index = parseInt($(this).parents('.divr').index()) + 1;
        if (zcd > index) {
            $(this).parents('.temp').children('.divr').css("display", "none");
            $(this).parents('.temp').children('.divr').eq(zcd - 1).css("display", "block");
        }
    });
    //切换题目
    $('.tab span').click(function () {
        var ref = $(this).attr("ref");
        $('.temp[ref]').css("display", "none");
        $('.temp[ref=' + ref + ']').css("display", "block");
        $('.myexam_wrap div[ref]').css("display", "none");
        $('.myexam_wrap div[ref=' + ref + ']').css("display", "block");

        $(".bs").removeClass("bs");
        $(this).addClass("bs");
        var title = $(this).attr("title").split('|')[0];
        var count = $(this).attr("title").split('|')[1];
        $('#kskm').text(title);
        $('#kskm2').text(title);
        $('#zts').text(count);
    });

});
function dkShiwu(obj) {
    $('.myexam_wrap').children('div:visible').find('li').eq(obj.parents('.divr').index()).attr("class", "havebg");
}
function addjc(o) {
    var str = "<div>" + $(o).next().html() + "<img width='29' border='0' height='19' onclick='deljc(this)' src='../Images/exam/icon_05.jpg'/></div>";
    $(o).parent().append(str);
}
function deljc(o) {
    $(o).parent().remove();
}

//选择题目类型隐藏
function showsubmenu(obj) {
    if (obj.attr("class") == "type_1") {
        obj.attr("class", "type")
        obj.next().css("display", "none")
    } else {
        obj.attr("class", "type_1")
        obj.next().css("display", "")
    }
}
