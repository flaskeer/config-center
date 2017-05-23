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
<html lang="zh-CN" xmlns="http://www.w3.org/1999/html">
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
            <@sidebar.sidebar group="apps" url="/apps"/>
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
                                <a href="/apps">我的应用</a>
                                <i class="fa fa-circle"></i>
                            </li>
                            <li>
                                <span>创建应用</span>
                            </li>
                        </ul>
                        
                    </div>
                    <!-- END PAGE BAR -->
                    <!-- BEGIN PAGE TITLE-->
                    <h3 class="page-title"> 创建应用
                        <small>每个应用对应一套配置，可以创建多个应用对应多个环境使用</small>
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
                                        <span class="caption-subject font-dark sbold uppercase">应用信息</span>
                                    </div>
                                    
                                </div>
                                <div class="portlet-body form">
                                    <form id="apps-create-form" class="form-horizontal" role="form">
                                        <div class="alert alert-danger display-hide">
                                            <button class="close" data-close="alert"></button>
                                            <span> 请输入应用名和描述. </span>
                                        </div>
                                        <div class="form-body">
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">应用名称</label>
                                                <div class="col-md-9">
                                                    <input name="appName" type="text" class="form-control" placeholder="App Name">
                                                    <span class="help-block"> 这个，能自己识别自己的应用就好了，没什么特别要求，反正重名了会告诉你的 </span>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">应用描述</label>
                                                <div class="col-md-9">
                                                    <textarea name="description" class="form-control" rows="3"></textarea>
                                                    <span class="help-block"> 在这儿可以详细描述下你的应用，不过大多数时候没什么用。仅此而已。 </span>
                                                </div>
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
        <script src="/assets/pages/scripts/apps-create.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->

    </body>

</html>