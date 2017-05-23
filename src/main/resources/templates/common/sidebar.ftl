<#--
    需要组名和对应url
     新加一个菜单和组项时需要再定义一套变量
-->
<#macro sidebar group url>
<#-- 现在有的组 -->
<#local dashboardNavActive=""/>
<#local dashboardArrowOpen=""/>
<#if group="dashboard">
    <#local dashboardNavActive="active open"/>
    <#local dashboardArrowOpen="open"/>
</#if>
<#local rootActive=""/>
<#if url="/">
    <#local rootActive="active open"/>
</#if>

<#local appsNavActive=""/>
<#local appsArrowOpen=""/>
<#if group="apps">
    <#local appsNavActive="active open"/>
    <#local appsArrowOpen="open"/>
</#if>
<#local appsActive=""/>
<#if url="/apps">
    <#local appsActive="active open"/>
</#if>
<#local adminAppsActive=""/>
<#if url="/admin/apps">
    <#local adminAppsActive="active open"/>
</#if>

<#local usersNavActive=""/>
<#local usersArrowOpen=""/>
<#if group="users">
    <#local usersNavActive="active open"/>
    <#local usersArrowOpen="open"/>
</#if>
<#local adminUsersActive=""/>
<#if url="/admin/users">
    <#local adminUsersActive="active open"/>
</#if>

<!-- BEGIN SIDEBAR -->
<div class="page-sidebar-wrapper">
    <!-- BEGIN SIDEBAR -->
    <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
    <!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
    <div class="page-sidebar navbar-collapse collapse">
        <!-- BEGIN SIDEBAR MENU -->
        <!-- DOC: Apply "page-sidebar-menu-light" class right after "page-sidebar-menu" to enable light sidebar menu style(without borders) -->
        <!-- DOC: Apply "page-sidebar-menu-hover-submenu" class right after "page-sidebar-menu" to enable hoverable(hover vs accordion) sub menu mode -->
        <!-- DOC: Apply "page-sidebar-menu-closed" class right after "page-sidebar-menu" to collapse("page-sidebar-closed" class must be applied to the body element) the sidebar sub menu mode -->
        <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
        <!-- DOC: Set data-keep-expand="true" to keep the submenues expanded -->
        <!-- DOC: Set data-auto-speed="200" to adjust the sub menu slide up/down speed -->
        <ul class="page-sidebar-menu  page-header-fixed " data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200" style="padding-top: 20px">
            <!-- DOC: To remove the sidebar toggler from the sidebar you just need to completely remove the below "sidebar-toggler-wrapper" LI element -->
            <li class="sidebar-toggler-wrapper hide">
                <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
                <div class="sidebar-toggler"> </div>
                <!-- END SIDEBAR TOGGLER BUTTON -->
            </li>
            <!-- DOC: To remove the search box from the sidebar you just need to completely remove the below "sidebar-search-wrapper" LI element -->

            <li class="nav-item start ${dashboardNavActive}">
                <a href="javascript:;" class="nav-link nav-toggle">
                    <i class="icon-home"></i>
                    <span class="title">Dashboard</span>
                    <span class="selected"></span>
                    <span class="arrow ${dashboardArrowOpen}"></span>
                </a>
                <ul class="sub-menu">
                    <li class="nav-item start ${rootActive}">
                        <a href="/" class="nav-link ">
                            <i class="icon-bar-chart"></i>
                            <span class="title">仪表盘</span>
                            <span class="selected"></span>
                        </a>
                    </li>

                </ul>
            </li>
            <li class="heading">
                <h3 class="uppercase">配置中心</h3>
            </li>
            <li class="nav-item ${appsNavActive}">
                <a href="javascript:;" class="nav-link nav-toggle">
                    <i class="icon-diamond"></i>
                    <span class="title">应用管理</span>
                    <span class="arrow ${appsArrowOpen}"></span>
                </a>
                <ul class="sub-menu">
                    <li class="nav-item ${appsActive}">
                        <a href="/apps" class="nav-link ">
                            <span class="title">我的应用</span>
                        </a>
                    </li>
                <#if Session.user.role == "admin">
                    <li class="nav-item ${adminAppsActive}">
                        <a href="/admin/apps" class="nav-link ">
                            <span class="title">所有应用</span>
                        </a>
                    </li>
                </#if>
                </ul>
            </li>
        <#if Session.user.role == "admin">
            <li class="nav-item ${usersNavActive}">
                <a href="javascript:;" class="nav-link nav-toggle">
                    <i class="icon-user"></i>
                    <span class="title">用户管理</span>
                    <span class="arrow ${usersArrowOpen}"></span>
                </a>
                <ul class="sub-menu">
                    <li class="nav-item ${adminUsersActive}">
                        <a href="/admin/users" class="nav-link ">
                            <span class="title">所有用户</span>
                        </a>
                    </li>
                </ul>
            </li>
        </#if>
        </ul>
        <!-- END SIDEBAR MENU -->
        <!-- END SIDEBAR MENU -->
    </div>
    <!-- END SIDEBAR -->
</div>
<!-- END SIDEBAR -->
</#macro>