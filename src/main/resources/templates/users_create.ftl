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
                                <a href="/admin/users">所有用户</a>
                                <i class="fa fa-circle"></i>
                            </li>
                            <li>
                                <span>创建用户</span>
                            </li>
                        </ul>
                        
                    </div>
                    <!-- END PAGE BAR -->
                    <!-- BEGIN PAGE TITLE-->
                    <h3 class="page-title"> 创建用户
                        <small>在这里的用户就可以使用配置中心</small>
                    </h3>
                    <!-- END PAGE TITLE-->
                    <!-- END PAGE HEADER-->
                    <!-- BEGIN DASHBOARD STATS 1-->
                    <div class="row">
                        <div class="col-md-12">
                            <!-- BEGIN SAMPLE FORM PORTLET-->
                            <div class="portlet light bordered">
                                <div class="portlet-title">
                                    <div class="caption">
                                        <i class="icon-settings font-dark"></i>
                                        <span class="caption-subject font-dark sbold uppercase">用户信息</span>
                                    </div>
                                    
                                </div>
                                <div class="portlet-body form">
                                    <form id="users-create-form" class="form-horizontal" role="form">
                                        <div class="alert alert-danger display-hide">
                                            <button class="close" data-close="alert"></button>
                                            <span> 请输入用户名和密码. </span>
                                        </div>
                                        <div class="form-body">
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">用户名</label>
                                                <div class="col-md-9">
                                                    <input name="username" type="text" class="form-control" placeholder="Username">
                                                    
                                                </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">密码</label>
                                                <div class="col-md-9">
                                                    <input name="password" type="text" class="form-control" placeholder="Password">
                                                    
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">权限</label>
                                                <div class="col-md-9">
                                                    <select class="form-control" name="role">
                                                        <option value="user">user</option>
                                                        <option value="admin">admin</option>
                                                    </select>
                                                </div>
                                            </div>
                                            
                                        <div class="form-actions">
                                            <div class="row">
                                                <div class="col-md-offset-3 col-md-9">
                                                    <button type="submit" class="btn green">提交</button>
                                                    <button type="button" class="btn default" onclick="javascript:history.go(-1);">取消</button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!-- END SAMPLE FORM PORTLET-->
                        </div>
                        
                    </div>
                    <div class="clearfix"></div>
                    <!-- END DASHBOARD STATS 1-->
                    
                </div>
                <!-- END CONTENT BODY -->
            </div>
            <!-- END CONTENT -->
            
        </div>
        <!-- END CONTAINER -->
        <#include "./common/footer.ftl"/>
        <#include "./common/script.ftl"/>
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        
        <!-- END PAGE LEVEL PLUGINS -->
        <#include "./common/theme_script.ftl"/>
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="/assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
        <script src="/assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
        <script src="/assets/pages/scripts/users-create.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->

    </body>

</html>