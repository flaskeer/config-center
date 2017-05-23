<!DOCTYPE html>
<!-- 
Template Name: Metronic - Responsive Admin Dashboard Template build with Twitter Bootstrap 3.3.6
Version: 4.5.3
Author: KeenThemes
Website: http://www.keenthemes.com/
Contact: support@keenthemes.com
Follow: www.twitter.com/keenthemes
Like: www.facebook.com/keenthemes
Purchase: http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469?ref=keenthemes
License: You must have a valid license purchased only from themeforest(the above link) in order to legally use the theme for your project.
-->
<!--[if IE 8]> <html lang="zh-CN" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="zh-CN" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="zh-CN">
    <!--<![endif]-->
    <!-- BEGIN HEAD -->

    <head>
        <#include "./common/theme_head.ftl"/>
        <!-- BEGIN PAGE LEVEL STYLES -->
        <link href="/assets/pages/css/profile.min.css" rel="stylesheet" type="text/css" />
        <link href="/assets/global/plugins/jquery-notific8/jquery.notific8.min.css" rel="stylesheet" type="text/css" />
        <!-- END PAGE LEVEL STYLES -->
    </head>
    <!-- END HEAD -->

    <body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white">
        <#include "./common/page_header.ftl"/>
        <!-- BEGIN HEADER & CONTENT DIVIDER -->
        <div class="clearfix"> </div>
        <!-- END HEADER & CONTENT DIVIDER -->
        <!-- BEGIN CONTAINER -->
        <div class="page-container">

            <#import "./common/sidebar.ftl" as sidebar/>
            <@sidebar.sidebar group="users" url="/admin/users"/>
            <!-- BEGIN CONTENT -->
            <div class="page-content-wrapper">
                <!-- BEGIN CONTENT BODY -->
                <div class="page-content">
                    <!-- BEGIN PAGE HEADER-->
                    
                    <!-- BEGIN PAGE BAR -->
                    <div class="page-bar">
                        <ul class="page-breadcrumb">
                            <li>
                                <a href="/">Home</a>
                                <i class="fa fa-circle"></i>
                            </li>
                            <li>
                                <span>所有用户</span>
                            </li>
                        </ul>
                        
                    </div>
                    <!-- END PAGE BAR -->
                    <!-- BEGIN PAGE TITLE-->
                    <h3 class="page-title"> 所有用户
                        <small>在这里的用户就可以使用配置中心</small>
                    </h3>
                    <!-- END PAGE TITLE-->
                    <!-- END PAGE HEADER-->
                    <div class="row">
                        <div class="col-md-3">
                            <form action="/admin/users">
                                <input type="hidden" name="page" value="1">
                                <input type="hidden" name="size" value="${page.size}">
                                <div class="input-group">
                                    <input type="text" name="username" value="${username}" class="form-control" placeholder="Search for...">
                                <span class="input-group-btn">
                                    <button class="btn blue" type="submit">搜索</button>
                                </span>
                                </div>
                            </form>

                        </div>
                        <div class="col-md-3">
                            <div class="btn-group">
                                <a class="btn sbold green" href="/admin/users/create"> 创建
                                    <i class="fa fa-plus"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                    <br>
                    <!-- BEGIN DASHBOARD STATS 1-->
                    <div class="row">
                        <#list page.content as item>
                        <div class="col-md-4">
                            <!-- PORTLET MAIN -->
                            <div class="portlet light bordered">
                                <!-- SIDEBAR USER TITLE -->
                                <div class="profile-usertitle">
                                    <div class="profile-usertitle-name"> 用户名：${item.username} </div>
                                    <div class="profile-usertitle-job"> 权限：${item.role} </div>
                                </div>
                                <!-- END SIDEBAR USER TITLE -->
                                <!-- SIDEBAR BUTTONS -->
                                <div class="profile-userbuttons">
                                    <button type="button" class="btn btn-circle green btn-sm mod-pwd" data-username="${item.username}">修改密码</button>
                                    <button type="button" class="btn btn-circle red btn-sm del-user" data-username="${item.username}">删除</button>
                                </div>
                                <br>
                                <!-- END SIDEBAR BUTTONS -->
                            </div>
                            <!-- END PORTLET MAIN -->
                        </div>
                        </#list>
                    </div>
                    <hr/>
                    <div class="row">
                        <div class="col-md-5 col-sm-5">
                        </div>
                        <div class="col-md-7 col-sm-7">
                        <#import "./common/pagin.ftl" as pagin/>
                        <@pagin.genPagin url="/admin/users" totalPages=page.totalPages currPage=page.number+1 size=page.size showPageNum=5 />
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <!-- END DASHBOARD STATS 1-->
                    
                </div>
                <!-- END CONTENT BODY -->
            </div>
            <!-- END CONTENT -->
            <div class="modal fade" id="mod-password" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                            <h4 class="modal-title">修改密码</h4>
                        </div>
                        <div class="modal-body">
                            <form id="mod-pwd-form" class="form-horizontal" role="form">
                                <div class="alert alert-danger display-hide">
                                    <button class="close" data-close="alert"></button>
                                    <span> Some text. </span>
                                </div>
                                <div class="form-body">
                                    
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">用户名</label>
                                        <div class="col-md-9">
                                            <input type="text" name="username" class="form-control" placeholder="Enter username" readonly="readonly">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">新密码</label>
                                        <div class="col-md-9">
                                            <input type="password" name="password" class="form-control" placeholder="Enter password">
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn default" data-dismiss="modal">取消</button>
                            <button type="button" class="btn green mod-pwd-ok">确定修改</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
            <div class="modal fade bs-modal-sm" id="del-modal" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                            <h4 class="modal-title">提示</h4>
                        </div>
                        <div class="modal-body">
                            <div id="user-del-message" class="alert alert-danger display-hide">
                                <button class="close" data-close="alert"></button>
                                <span> Some text. </span>
                            </div>
                            <div>
                                确定要删除该用户吗？ 
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn default" data-dismiss="modal">取消</button>
                            <button type="button" class="btn btn-danger del-ok">确定</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
        </div>
        <!-- END CONTAINER -->
        <#include "./common/footer.ftl"/>
        <#include "./common/script.ftl"/>
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script src="/assets/global/scripts/datatable.js" type="text/javascript"></script>
        <script src="/assets/global/plugins/datatables/datatables.min.js" type="text/javascript"></script>
        <script src="/assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL PLUGINS -->
        <#include "./common/theme_script.ftl"/>
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="/assets/global/plugins/jquery-notific8/jquery.notific8.min.js" type="text/javascript"></script>
        <script src="/assets/pages/scripts/users.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->

    </body>

</html>