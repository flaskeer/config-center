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
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <link href="/assets/global/plugins/jquery-notific8/jquery.notific8.min.css" rel="stylesheet" type="text/css" />
        <!-- END PAGE LEVEL PLUGINS -->
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
                                <span>应用协作者</span>
                            </li>
                        </ul>
                        
                    </div>
                    <!-- END PAGE BAR -->
                    <!-- BEGIN PAGE TITLE-->
                    <h3 class="page-title"> 应用协作者
                        <small>都有哪些用户可以查看、操作该应用（a:创建者,r:读配置,w:写配置,d:删除配置,c:创建配置）</small>
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
                                        <i class="icon-info font-dark"></i>
                                        <span class="caption-subject font-dark sbold uppercase">协作者信息</span>

                                    </div>
                                    <div class="actions">
                                        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#create-modal">添加协作者 <i class="icon-plus"></i></button>
                                    </div>
                                </div>
                                <div class="portlet-body">

                                    <div class="table-scrollable">
                                        <table class="table table-bordered table-hover">
                                            <thead>
                                            <tr>
                                                <th> 用户名 </th>
                                                <th> 权限 </th>
                                                <th> 操作 </th>
                                            </tr>
                                            </thead>
                                            <tbody id="user-list">

                                            </tbody>
                                        </table>
                                    </div>

                                </div>
                            </div>
                            <!-- END SAMPLE FORM PORTLET-->
                        </div>
                        
                    </div>
                    <div class="clearfix"></div>
                    <!-- END DASHBOARD STATS 1-->
                    <div class="modal fade bs-modal-sm" id="del-modal" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog modal-sm">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                    <h4 class="modal-title">提示</h4>
                                </div>
                                <div class="modal-body"> 确定要删除该协作者吗？ </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn default" data-dismiss="modal">取消</button>
                                    <button type="button" class="btn btn-danger del-ok">确定</button>
                                </div>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                        <!-- /.modal-dialog -->
                    </div>
                    <div class="modal fade draggable-modal ui-draggable" id="create-modal" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                    <h4 class="modal-title">添加协作者</h4>
                                </div>
                                <div class="modal-body">
                                    <form id="add-form" action="" class="form-horizontal" role="form">
                                        <div class="form-body">
                                            <input id="appId" name="appId" type="hidden" value="${appId}">
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">用户名</label>
                                                <div class="col-md-9">
                                                    <input name="username" type="text" class="form-control" placeholder="Enter username">
                                                    <span class="help-block"> 输入一个有效的用户名. </span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">勾选权限</label>
                                                <div class="col-md-9">
                                                    <div class="checkbox-list">
                                                        <label>
                                                            <input name="role" type="checkbox" value="r" checked readonly> 读取配置 </label>
                                                        <label>
                                                            <input name="role" type="checkbox" value="w"> 修改配置 </label>
                                                        <label>
                                                            <input name="role" type="checkbox" value="c"> 创建配置 </label>
                                                        <label>
                                                            <input name="role" type="checkbox" value="d"> 删除配置 </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn default" data-dismiss="modal">取消</button>
                                    <button type="button" class="btn btn-primary save-btn">添加</button>
                                </div>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                        <!-- /.modal-dialog -->
                    </div>
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
        <script src="/assets/global/plugins/jquery-notific8/jquery.notific8.min.js" type="text/javascript"></script>
        <script src="/assets/pages/scripts/apps-users.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->

    </body>

</html>