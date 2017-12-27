<#macro left index>
<div class="left_col scroll-view">
    <div class="navbar nav_title" style="border: 0;">
        <a href="${basePath}/exam/index.shtml" class="site_title"><i class="fa fa-paw"></i> <span></span></a>
    </div>

    <div class="clearfix"></div>

    <!-- menu profile quick info -->
    <div class="profile">
        <div class="profile_pic">
            <img src="${basePath}/static/src/images/img.jpg" alt="..." class="img-circle profile_img">
        </div>
        <div class="profile_info">
            <span>Welcome,</span>
            <h2>${token.nickname?default('no none')}</h2>
        </div>
    </div>
    <!-- /menu profile quick info -->

    <br />

    <!-- 左侧导航 -->
<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
<div class="menu_section">
    <h3>${token.nickname?default('no none')}</h3>

    <ul class="nav side-menu">

            <li ><a><i class="fa fa-edit"></i> 个人中心 <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu"  >
                    <li><a href="${basePath}/user/index.shtml">个人资料</a></li>
                    <li><a href="${basePath}/user/updatePswd2.shtml">密码修改</a></li>
                </ul>
            </li>

            <li ><a><i class="fa fa-edit"></i> 考试中心 <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu"  >
                    <li><a href="${basePath}/exam/chooseCourse.shtml">1.选择考试项目</a></li>
                    <li><a href="${basePath}/exam/get_course_list.shtml">2.选择考试科目</a></li>
                    <li><a href="${basePath}/exam/get_model_list.shtml">3.选择考试模式</a></li>
                </ul>
            </li>

        <li ><a><i class="fa fa-edit"></i> 文章管理 <span class="fa fa-chevron-down"></span></a>
            <ul class="nav child_menu"  >
                <li><a href="${basePath}/articleManager/add_article.shtml">添加文章</a></li>
                <li><a href="${basePath}/articleManager/article_category_manager_index.shtml">文章分类管理</a></li>
            </ul>
        </li>

        <@shiro.hasAnyRoles name='888888,100002'>
        <#--拥有 角色888888（管理员） ||  100002（用户中心）-->
            <li "><a><i class="fa fa-edit"></i> 用户中心 <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu" >
                    <@shiro.hasPermission name="/member/list.shtml">
                    <li><a href="${basePath}/member/list.shtml">用户列表</a></li>
                    </@shiro.hasPermission>
                    <@shiro.hasPermission name="/member/online.shtml">
                    <li><a href="${basePath}/member/online.shtml">在线用户</a></li>
                    </@shiro.hasPermission>
                </ul>
            </li>
        </@shiro.hasAnyRoles>


        <@shiro.hasAnyRoles name='888888,100003'>
        <#--拥有 角色888888（管理员） ||  100003（权限频道）-->
            <li "><a><i class="fa fa-edit"></i> 权限管理 <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu" >
                    <@shiro.hasPermission name="/role/index.shtml">
                        <li><a href="${basePath}/role/index.shtml">角色列表</a></li>
                    </@shiro.hasPermission>
                    <@shiro.hasPermission name="/role/allocation.shtml">
                        <li><a href="${basePath}/role/allocation.shtml">角色分配</a></li>
                    </@shiro.hasPermission>
                    <@shiro.hasPermission name="/permission/index.shtml">
                        <li><a href="${basePath}/permission/index.shtml">权限列表</a></li>
                    </@shiro.hasPermission>
                    <@shiro.hasPermission name="/permission/allocation.shtml">
                        <li><a href="${basePath}/permission/allocation.shtml">权限分配</a></li>
                    </@shiro.hasPermission>
                </ul>
            </li>
        </@shiro.hasAnyRoles>

    </ul>
</div>
</div>

    <!-- /menu footer buttons -->
    <div class="sidebar-footer hidden-small">
        <a data-toggle="tooltip" data-placement="top" title="Settings">
            <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
        </a>
        <a data-toggle="tooltip" data-placement="top" title="FullScreen">
            <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
        </a>
        <a data-toggle="tooltip" data-placement="top" title="Lock">
            <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
        </a>
        <a data-toggle="tooltip" data-placement="top" title="Logout" href="logout">
            <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
        </a>
    </div>
    <!-- /menu footer buttons -->
    <!-- /左侧导航 -->

</div>

</#macro>