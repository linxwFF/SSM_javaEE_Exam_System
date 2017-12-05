<#macro left index>
<div class="left_col scroll-view">
    <div class="navbar nav_title" style="border: 0;">
        <a href="${basePath}/" class="site_title"><i class="fa fa-paw"></i> <span></span></a>
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

            <li class="${(index==1)?string('active','')}"><a><i class="fa fa-edit"></i> 个人中心 <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu" style="display: ${(index==1)?string('block','none')}" >
                    <li><a href="${basePath}/user/index.shtml">个人资料</a></li>

                    <li><a href="#">个人中心</a>
                        <ul class="nav child_menu">
                            <li class="sub_menu"><a href="${basePath}/user/updateSelf2.shtml">资料修改</a></li>
                            <li class="sub_menu"><a href="${basePath}/user/updatePswd2.shtml">密码修改</a></li>
                            <li class="sub_menu"><a href="${basePath}/role/mypermission.shtml">我的权限</a></li>
                        </ul>
                    </li>
                </ul>
            </li>

        <@shiro.hasAnyRoles name='888888,100002'>
        <#--拥有 角色888888（管理员） ||  100002（用户中心）-->
            <li class="${(index==2)?string('active','')}"><a><i class="fa fa-edit"></i> 用户中心 <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu" style="display: ${(index==2)?string('block','none')}">
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
            <li class="${(index==3)?string('active','')}"><a><i class="fa fa-edit"></i> 权限管理 <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu" style="display: ${(index==3)?string('block','none')}">
                    <@shiro.hasPermission name="/role/index.shtml">
                        <li><a href="${basePath}/role/index.shtml">角色列表</a></li>
                    </@shiro.hasPermission>
                    <@shiro.hasPermission name="/role/allocation.shtml">
                        <li><a href="${basePath}/role/allocation.shtml">角色分配（这是个JSP页面）</a></li>
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