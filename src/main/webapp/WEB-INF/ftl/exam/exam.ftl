<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" ng-app="app" xmlns:ng="http://angularjs.org">
<head id="Head1" runat="server">
    <title>2016会计无纸化考试题库系统</title>
    <link href="${basePath}/static/assets/extendCss/exam/exam.style.css" rel="stylesheet">
    <link href="${basePath}/static/assets/extendCss/exam/exam.css"rel="stylesheet">
    <script src="${basePath}/static/assets/extendJs/exam/jquery-1.7.1.min.js" ></script>
    <script src="${basePath}/static/assets/extendJs/exam/myscript.js" ></script>
    <script src="${basePath}/static/assets/extendJs/exam/cookie.js" ></script>
    <script src="${basePath}/static/assets/extendJs/exam/kaoshi.js" ></script>
    <script src="${basePath}/static/assets/extendJs/exam/app.js"></script>
    <style type="text/css">
    .tab {
        padding-top: 5px;
        border-bottom: 1px solid #3176AD;
    }

    .tab span {
        display: inline-block;
        height: 30px;
        line-height: 30px;
        border: solid #3176AD;
        border-width: 1px 1px 0;
        margin-right: 5px;
        padding: 0 10px;
        position: relative;
        cursor: pointer;
    }

    .tab span.bs {
        background: #3176AD;
        color: #fff;
    }
    </style>
    <script type="text/javascript">
            $().ready(function () {
                //闹钟时间
                setInterval("ChangeTime()", 1000);

                //初始化时，定义考试的科目名称和科目的题目数量
                var title = $('.tab span[class=bs]').attr("title").split('|')[0];
                var count = $('.tab span[class=bs]').attr("title").split('|')[1];
                //考试科目名称
                $('#kskm').text(title);
                //总题数
                $('#zts').text(count);
                //重置时间
                delCookie('sumsj-0636462431');
            });
    //闹钟时间
    function ChangeTime() {
        var kemu_count = parseInt('1');
        var TimeNum;
        //获取考卷时间
        if (!getCookie("sumsj-0636462431")) {
            //没有时间就是一个小时
            TimeNum = kemu_count * 60 * 60;
        } else {
            TimeNum = getCookie("sumsj-0636462431");
        }
        //每次减一秒
        TimeNum--;
        //剩余时间存放COOKIE
        setCookie("sumsj-0636462431", TimeNum);
        //时间视图
        if (TimeNum > 0) {
            var fz = Math.floor(TimeNum / 60);
            var ms = TimeNum % 60;
            var ys = kemu_count * 60 * 60 - TimeNum;
            $('#ys').val(ys);
            fz = (fz < 10) ? "0" + fz : fz;
            ms = (ms < 10) ? "0" + ms : ms;
            var sj = fz + "分" + ms + "秒";
            $("#myclock").text(sj);
        }
        else {
            submitpaper();
        }
    }
    //收集答案
    function collectanswer() {
        var result = new Array();
        var temp = new Array();
        $('.temp').each(function () {
            var index = $(this).index();
            //考试科目名字
            var kemu_name = $('.tab span').eq(index).text();
            var bid = $(this).attr("ref");
            $(this).children('.divr').each(function () {
                var dataArray = $(this).attr("ref").split('|');
                var tid = parseInt(dataArray[0]);
                var sid = parseInt(dataArray[1]);
                switch (tid) {
                    case 1:
                        temp.push(sid + '/' + tid + '/' + $(this).find('.divrda').find('input:checked').val());
                        break;
                    case 2:
                        temp.push(sid + '/' + tid + '/' + $(this).find('.divrda').find('input:checked').map(function () {
                                    return $(this).val();
                                }).get().join(''));
                        break;
                    case 3:
                        temp.push(sid + '/' + tid + '/' + $(this).find('.divrda').find('input:checked').val());
                        break;
                    case 4:
                        if (bid == 1)
                            temp.push(sid + '/' + tid + '/' + $(this).find('.divrdaa').map(function () {
                                        return $(this).find('input:checked').map(function () {
                                            return $(this).val();
                                        }).get().join('');
                                    }).get().join('$#$#'));
                        else
                            temp.push(sid + '/' + tid + '/' + $(this).find('.answerboxs').map(function () {
                                        return $(this).find('div').map(function () {
                                            return $(this).children().eq(0).val() + ',' + $(this).children().eq(1).val() + ',' + $(this).children().eq(2).val();
                                        }).get().join(';');
                                    }).get().join('$#$#'));
                        break;
                    case 5:
                        temp.push(sid + '/' + tid + '/' + $(this).find('input[type=hidden]').val());
                        break;

                }
            });
            result.push(temp.join('****') + '++++' + kemu_name);
            console.log(result);
            temp = new Array();
        });
        $('#daan').val(result.join('----').replace(/undefined/g, ''));
        // alert(result.join('----').replace(/undefined/g, ''));
    }
    function submitpaper() {
        if ($('.havebg').length > 0) {
            collectanswer();
            $('form').submit();
        } else {
//            alert('没有答题，无法交卷！');
        }
    }
    </script>
</head>
<body oncopy="return false;" oncontextmenu="return false" onselectstart="return false" ondragstart="return false" onbeforecopy="return false" oncopy="document.selection.empty()" onselect="document.selection.empty()" >



<form action="/handPaper" method="post">
    {{ csrf_field() }}
    <input type="hidden" name="daan" id="daan" />
    <input type="hidden" name="timestamp" value="0636462431" />
    <input type="hidden" name="kemu_id" value="{{ $course_id }}" />
    <input type="hidden" name="ys" id="ys" value="0" />
</form>




<div class="myexam_head">
    <div class="topbg">
        <div class="top" style="background:url('${basePath}/static/assets/img/exam/tlogo/fujian.jpg') no-repeat;">
            <div class="topr">
                <img alt="" src="${basePath}/static//assets/img/exam/jsq.jpg" width="78" height="30" onclick="window.open('/Content/jsq.htm','_blank')"/>
            </div>
        </div>
    </div>
    <table>
        <tr>
            <td class="myexam_pic ac">
                <img src="${basePath}/static//assets/img/exam/portrait.jpg" alt="" /></td>
            <td class="myexam_identity">
                <ul>
                    <li>姓名：{{ $username}}</li>
                    <li>准考证号：123456789123xxxxxx</li>
                    <li>身份证号：450205198008xxxxxx</li>
                    <li>考试科目：<span id="kskm2">{{ $course_type }}</span></li>
                </ul>
            </td>
            <td class="myexam_tt ac">
                <p>福建省会计从业资格无纸化考试系统</p>
                <p><span id="kskm"></span></p>
                <p>总题数：<span id="zts"></span></p>
            </td>
            <td class="myexam_time">
                <dl>
                    <dt class="ac">剩余时间：
                        <span id="myclock"></span>
                    </dt>
                </dl>
            </td>
        </tr>
    </table>
</div>

<div class="tab">
    <span class='bs' title='财经法规与会计职业道德|62' ref="1">财经法规与会计职业道德</span>
</div>

<div class="myexam_body">
    <table>
        <tr>
            <td class="myexam_options">
                <div class="myexam_wrap">
                    <div style="display:block" ref="1">
                        <div class='type_1' onclick='showsubmenu($(this))'>单选题（{{ $takeNum }}）</div>
                        <div class='numberlist'>
                            <ul>
                                @foreach ($type_1 as $key=>$value)
                                <li class='nomakebg'>{{ $key+1 }}</li>
                                @endforeach
                            </ul>
                        </div>

                        <div class='type_1' onclick='showsubmenu($(this))'>多选题（{{ $takeNum }}）</div>
                        <div class='numberlist'>
                            <ul>
                                @foreach ($type_2 as $key=>$value)
                                <li class='nomakebg'>{{ ($key+1)+$takeNum }}</li>
                                @endforeach
                            </ul>
                        </div>

                        <div class='type_1' onclick='showsubmenu($(this))'>判断题（{{ $takeNum }}）</div>
                        <div class='numberlist'>
                            <ul>
                                @foreach ($type_3 as $key=>$value)
                                <li class='nomakebg'>{{ ($key+1)+$takeNum*2 }}</li>
                                @endforeach
                            </ul>
                        </div>

                        <div class='type_1' onclick='showsubmenu($(this))'>大题（2）</div>
                        <div class='numberlist'>
                            <ul>
                                <li class='nomakebg'>31</li>
                                <li class='nomakebg'>32</li>
                            </ul>
                        </div>
                    </div>

                    <div id="submitpaper" onclick="submitpaper()"></div>
                </div>
            </td>

            <td class="myexam_main">
                <div style="display:block;" ref="1" class="temp">

                    @foreach ($type_1 as $key=>$value)
                    <div class= 'divr'  style="{{$key === 0?'display:block':'display:none'}}" ref="{{ $value->type }}|{{ $key+1 }}">
                        <div class='divrcon'>
                            <div class='divrtit'>一、单项选择题(本类题共20小题，每小题1分，共20分。每小题备选答案中，只有一个符合题意的正确答案，多选、错选、不选均不得分。)</div>
                            <br />{{ $key+1 }} 、{{ $value->subject }}<br />
                            <br />
                            A、{{ $value->choose_A }}
                            <br />
                            B、{{ $value->choose_B }}
                            <br />
                            C、{{ $value->choose_C }}
                            <br />
                            D、{{ $value->choose_D }}
                            <br />
                            <div class='divrda'>
                                <span class='xzda'>选择答案：</span>
                                A<input name='danx<text>1</text>' value='A' type='radio' />
                                B<input name='danx<text>1</text>' value='B' type='radio' />
                                C<input name='danx<text>1</text>' value='C' type='radio' />
                                D<input name='danx<text>1</text>' value='D' type='radio' />
                                <br />
                                <br />
                                <img alt="" src="${basePath}/static/assets/img/exam/diyiti.jpg" width='92' height='29' />
                                <img alt="" src="${basePath}/static/assets/img/exam/shangyiti.jpg" width='92' height='29' />
                                <img alt="" src="${basePath}/static/assets/img/exam/xiayiti.jpg" width='92' height='29' />
                                <img alt="" src="${basePath}/static/assets/img/exam/zuimoti.jpg" width='92' height='29' />
                            </div>
                        </div>
                    </div>
                    @endforeach

                    @foreach ($type_2 as $key=>$value)
                    <div class= 'divr' style="display:none" ref="{{ $value->type }}|{{ ($key+1)+$takeNum }}">
                        <div class='divrcon'>
                            <div class='divrtit'>二、多项选择题(本类题共20小题，每小题2分，共40分。每小题备选答案中，有两个或两个以上符合题意的正确答案，多选、少选、错选、不选均不得分。)</div>
                            <br />{{ ($key+1)+$takeNum }} 、{{ $value->subject }}<br />
                            <br />
                            A、{{ $value->choose_A }}
                            <br />
                            B、{{ $value->choose_B }}
                            <br />
                            C、{{ $value->choose_C }}
                            <br />
                            D、{{ $value->choose_D }}
                            <br />
                            <div class='divrda'>
                                <span class='xzda'>选择答案：</span>
                                A<input name='duox<text>21</text>' value='A' type='checkbox' />
                                B<input name='duox<text>21</text>' value='B' type='checkbox' />
                                C<input name='duox<text>21</text>' value='C' type='checkbox' />
                                D<input name='duox<text>21</text>' value='D' type='checkbox' />
                                <br />
                                <br />
                                <img alt="" src="${basePath}/static/assets/img/exam/diyiti.jpg" width='92' height='29'/>
                                <img alt="" src="${basePath}/static/assets/img/exam/shangyiti.jpg" width='92' height='29' />
                                <img alt="" src="${basePath}/static/assets/img/exam/xiayiti.jpg" width='92' height='29' />
                                <img alt="" src="${basePath}/static/assets/img/exam/zuimoti.jpg" width='92' height='29' />
                            </div>
                        </div>
                    </div>
                    @endforeach

                    @foreach ($type_3 as $key=>$value)
                    <div class= 'divr' style="display:none" ref="{{ $value->type }}|{{ ($key+1)+$takeNum*2 }}">
                        <div class='divrcon'>
                            <div class='divrtit'>三、判断题(本类题共20小题，每小题1分，共20分。请判断每小题的表述是否正确，每小题答题正确的得一分，答题错误的或者不答题的均不得分。)</div>
                            <br />{{ ($key+1)+$takeNum*2 }} 、{{ $value->subject }}<br />
                            <br />
                            <div class='divrda'>
                                <span class='xzda'>选择答案：</span>
                                正确<input name='pand<text>51</text>' value='1' type='radio' />
                                错误<input name='pand<text>51</text>' value='0' type='radio' />
                                <br />
                                <br />
                                <img alt="" src="${basePath}/static/assets/img/exam/diyiti.jpg" width='92' height='29' />
                                <img alt="" src="${basePath}/static/assets/img/exam/shangyiti.jpg" width='92' height='29' />
                                <img alt="" src="${basePath}/static/assets/img/exam/xiayiti.jpg" width='92' height='29' />
                                <img alt="" src="${basePath}/static/assets/img/exam/zuimoti.jpg" width='92' height='29'/>
                            </div>
                        </div>
                    </div>
                    @endforeach

                    <div class= 'divr' style="display:none" ref="4|31">
                        <div class='divrcon'>
                            <div class='divrtit'>四、分析题(本类题共2大题，10小题，每小题2分，共20分)</div>
                            <br />31、<span style="font-family:'Times New Roman';font-size:10.5pt;">A</span><span style="font-family:宋体;font-size:10.5pt;">公司因向</span><span style="font-family:'Times New Roman';font-size:10.5pt;">B</span><span style="font-family:宋体;font-size:10.5pt;">公司购买一批产品，签发一张金额为</span><span style="font-family:'Times New Roman';font-size:10.5pt;">10</span><span style="font-family:宋体;font-size:10.5pt;">万元的支票给</span><span style="font-family:'Times New Roman';font-size:10.5pt;">B</span><span style="font-family:宋体;font-size:10.5pt;">公司，</span><span style="font-family:'Times New Roman';font-size:10.5pt;">B</span><span style="font-family:宋体;font-size:10.5pt;">公司为支付工程价款又将该支票背书转让给</span><span style="font-family:'Times New Roman';font-size:10.5pt;">C</span><span style="font-family:宋体;font-size:10.5pt;">公司，</span><span style="font-family:'Times New Roman';font-size:10.5pt;">C</span><span style="font-family:宋体;font-size:10.5pt;">公司接受后，不慎将支票遗失，该支票被</span><span style="font-family:'Times New Roman';font-size:10.5pt;">D</span><span style="font-family:宋体;font-size:10.5pt;">公司拾获，</span><span style="font-family:'Times New Roman';font-size:10.5pt;">D</span><span style="font-family:宋体;font-size:10.5pt;">公司便伪造了</span><span style="font-family:'Times New Roman';font-size:10.5pt;">C</span><span style="font-family:宋体;font-size:10.5pt;">公司的签章，并将支票转让给不知情的</span><span style="font-family:'Times New Roman';font-size:10.5pt;">E</span><span style="font-family:宋体;font-size:10.5pt;">公司，</span><span style="font-family:'Times New Roman';font-size:10.5pt;">E</span><span style="font-family:宋体;font-size:10.5pt;">公司又将该支票的金额改为</span><span style="font-family:'Times New Roman';font-size:10.5pt;">18</span><span style="font-family:宋体;font-size:10.5pt;">万元转让给</span><span style="font-family:'Times New Roman';font-size:10.5pt;">F</span><span style="font-family:宋体;font-size:10.5pt;">公司，</span><span style="font-family:'Times New Roman';font-size:10.5pt;">F</span><span style="font-family:宋体;font-size:10.5pt;">公司则背书转让给</span><span style="font-family:'Times New Roman';font-size:10.5pt;">G</span><span style="font-family:宋体;font-size:10.5pt;">公司。</span>
                            <div class='divswl'>

                                <br />
                                第<text>1</text>道、F公司需要承担(     )万元的票据责任 <br/><br/>
                                A、5 <br/>
                                B、9 <br/>
                                C、10 <br/>
                                D、18<br/>
                                <br />
                                <div class="divrdaa">
                                    <span class="xzda">选择答案：</span>
                                    A<input name="fenx_1" value="A" type="checkbox" />
                                    B<input name="fenx_1" value="B" type="checkbox" />
                                    C<input name="fenx_1" value="C" type="checkbox" />
                                    D<input name="fenx_1" value="D" type="checkbox" />
                                    <br />
                                </div>
                                <br />
                                第<text>2</text>道、根据以上材料，不需要承担票据责任的公司是(     ) <br/><br/>
                                A、A公司 <br/>
                                B、C公司 <br/>
                                C、D公司 <br/>
                                D、G公司<br/>
                                <br />
                                <div class="divrdaa">
                                    <span class="xzda">选择答案：</span>
                                    A<input name="fenx_2" value="A" type="checkbox" />
                                    B<input name="fenx_2" value="B" type="checkbox" />
                                    C<input name="fenx_2" value="C" type="checkbox" />
                                    D<input name="fenx_2" value="D" type="checkbox" />
                                    <br />
                                </div>
                                <br />
                                第<text>3</text>道、如果G公司要求F公司承担票据责任，则下列F公司的处理错误的是(     ) <br/><br/>
                                A、应先向G公司支付9万元，然后再向E公司要求支付9万元 <br/>
                                B、应先向G公司支付18万元，然后再向E公司要求支付18万元 <br/>
                                C、应先向G公司支付9万元，然后再向E公司要求支付8万元 <br/>
                                D、应先向G公司支付9万元，然后再向E公司要求支付18万元<br/>
                                <br />
                                <div class="divrdaa">
                                    <span class="xzda">选择答案：</span>
                                    A<input name="fenx_3" value="A" type="checkbox" />
                                    B<input name="fenx_3" value="B" type="checkbox" />
                                    C<input name="fenx_3" value="C" type="checkbox" />
                                    D<input name="fenx_3" value="D" type="checkbox" />
                                    <br />
                                </div>
                                <br />
                                第<text>4</text>道、B公司需要承担(     )万元的票据责任 <br/><br/>
                                A、5 <br/>
                                B、9 <br/>
                                C、10 <br/>
                                D、18<br/>
                                <br />
                                <div class="divrdaa">
                                    <span class="xzda">选择答案：</span>
                                    A<input name="fenx_4" value="A" type="checkbox" />
                                    B<input name="fenx_4" value="B" type="checkbox" />
                                    C<input name="fenx_4" value="C" type="checkbox" />
                                    D<input name="fenx_4" value="D" type="checkbox" />
                                    <br />
                                </div>
                                <br />
                                第<text>5</text>道、如果G公司要求E公司承担票据责任，则E公司应向G公司支付(     )万元 <br/><br/>
                                A、5 <br/>
                                B、9 <br/>
                                C、10 <br/>
                                D、18<br/>
                                <br />
                                <div class="divrdaa">
                                    <span class="xzda">选择答案：</span>
                                    A<input name="fenx_5" value="A" type="checkbox" />
                                    B<input name="fenx_5" value="B" type="checkbox" />
                                    C<input name="fenx_5" value="C" type="checkbox" />
                                    D<input name="fenx_5" value="D" type="checkbox" />
                                    <br />
                                </div>
                            </div>
                            <img alt="" src="${basePath}/static/assets/img/exam/diyiti.jpg" width='92' height='29' />
                            <img alt="" src="${basePath}/static/assets/img/exam/shangyiti.jpg" width='92' height='29' />
                            <img alt="" src="${basePath}/static/assets/img/exam/xiayiti.jpg" width='92' height='29' />
                            <img alt="" src="${basePath}/static/assets/img/exam/zuimoti.jpg" width='92' height='29'/>
                        </div>
                    </div>

                    <div class= 'divr' style="display:none" ref="4|32">
                        <div class='divrcon'>
                            <div class='divrtit'>四、分析题(本类题共2大题，10小题，每小题2分，共20分)</div>
                            <br />32、<span style="font-family:宋体;font-size:10.5pt;">甲向乙签发了一张</span><span style="font-family:'Times New Roman';font-size:10.5pt;">20</span><span style="font-family:宋体;font-size:10.5pt;">万元的支票，出票时间为</span><span style="font-family:'Times New Roman';font-size:10.5pt;">2010</span><span style="font-family:宋体;font-size:10.5pt;">年</span><span style="font-family:'Times New Roman';font-size:10.5pt;">4</span><span style="font-family:宋体;font-size:10.5pt;">月</span><span style="font-family:'Times New Roman';font-size:10.5pt;">1</span><span style="font-family:宋体;font-size:10.5pt;">日，乙于同年</span><span style="font-family:'Times New Roman';font-size:10.5pt;">4</span><span style="font-family:宋体;font-size:10.5pt;">月</span><span style="font-family:'Times New Roman';font-size:10.5pt;">5</span><span style="font-family:宋体;font-size:10.5pt;">日背书转让给丙。</span>
                            <div class='divswl'>

                                <br />
                                第<text>1</text>道、下列属于签发支票必须要记载的事项的是(     ) <br/><br/>
                                A、无条件支付的委托 <br/>
                                B、确定的金额 <br/>
                                C、承兑的时间 <br/>
                                D、出票人签章<br/>
                                <br />
                                <div class="divrdaa">
                                    <span class="xzda">选择答案：</span>
                                    A<input name="fenx_1" value="A" type="checkbox" />
                                    B<input name="fenx_1" value="B" type="checkbox" />
                                    C<input name="fenx_1" value="C" type="checkbox" />
                                    D<input name="fenx_1" value="D" type="checkbox" />
                                    <br />
                                </div>
                                <br />
                                第<text>2</text>道、根据《票据法》的规定，持票人丙应当在(     )提示付款 <br/><br/>
                                A、5月1日前 <br/>
                                B、4月11日前 <br/>
                                C、6月1日前 <br/>
                                D、9月1日前<br/>
                                <br />
                                <div class="divrdaa">
                                    <span class="xzda">选择答案：</span>
                                    A<input name="fenx_2" value="A" type="checkbox" />
                                    B<input name="fenx_2" value="B" type="checkbox" />
                                    C<input name="fenx_2" value="C" type="checkbox" />
                                    D<input name="fenx_2" value="D" type="checkbox" />
                                    <br />
                                </div>
                                <br />
                                第<text>3</text>道、关于支票的付款，下列说法正确的是(     ) <br/><br/>
                                A、支票是见票即付的，因此支票不得另行记载付款日期 <br/>
                                B、另行记载付款日期的支票，记载无效 <br/>
                                C、持票人应当自出票日起1个月内向付款人提示付款 <br/>
                                D、超过提示付款期限的，出票人丧失对持票人承担付款的责任<br/>
                                <br />
                                <div class="divrdaa">
                                    <span class="xzda">选择答案：</span>
                                    A<input name="fenx_3" value="A" type="checkbox" />
                                    B<input name="fenx_3" value="B" type="checkbox" />
                                    C<input name="fenx_3" value="C" type="checkbox" />
                                    D<input name="fenx_3" value="D" type="checkbox" />
                                    <br />
                                </div>
                                <br />
                                第<text>4</text>道、如果丙在5月10日提示付款，下列说法正确的是(     ) <br/><br/>
                                A、已过提示付款期，付款人可拒绝付款，但持票人并未丧失票据权利 <br/>
                                B、持票人对支票出票人的权利，自出票日起6个月 <br/>
                                C、已过提示付款期，付款人可拒绝付款，同时持票人丧失票据权利 <br/>
                                D、持票人对支票出票人的权利，自出票日起3个月<br/>
                                <br />
                                <div class="divrdaa">
                                    <span class="xzda">选择答案：</span>
                                    A<input name="fenx_4" value="A" type="checkbox" />
                                    B<input name="fenx_4" value="B" type="checkbox" />
                                    C<input name="fenx_4" value="C" type="checkbox" />
                                    D<input name="fenx_4" value="D" type="checkbox" />
                                    <br />
                                </div>
                                <br />
                                第<text>5</text>道、下列关于支票的说法正确的是(     ) <br/><br/>
                                A、支票按照付款方式可以分为现金支票、转账支票、普通支票 <br/>
                                B、普通支票可以用于支取现金，但不能用于转账 <br/>
                                C、普通支票左上角划两条平行线的，为划线支票，只能用于支取现金，不能用于转账 <br/>
                                D、转账支票在支票上印明&quot;转账&quot;字样，专门用于转账，不能用于支取现金<br/>
                                <br />
                                <div class="divrdaa">
                                    <span class="xzda">选择答案：</span>
                                    A<input name="fenx_5" value="A" type="checkbox" />
                                    B<input name="fenx_5" value="B" type="checkbox" />
                                    C<input name="fenx_5" value="C" type="checkbox" />
                                    D<input name="fenx_5" value="D" type="checkbox" />
                                    <br />
                                </div>
                            </div>
                            <img alt="" src="${basePath}/static/assets/img/exam/diyiti.jpg" width='92' height='29' />
                            <img alt="" src="${basePath}/static/assets/img/exam/shangyiti.jpg" width='92' height='29' />
                            <img alt="" src="${basePath}/static/assets/img/exam/xiayiti.jpg" width='92' height='29' />
                            <img alt="" src="${basePath}/static/assets/img/exam/zuimoti.jpg" width='92' height='29'/>
                        </div>
                    </div>
                </div>


            </td>
        </tr>
    </table>
</div>

</body>


</html>
