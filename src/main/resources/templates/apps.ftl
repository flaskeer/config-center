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
                                <span>我的应用</span>
                            </li>
                        </ul>
                        
                    </div>
                    <!-- END PAGE BAR -->
                    <!-- BEGIN PAGE TITLE-->
                    <h3 class="page-title"> 我的应用
                        <small>每个应用对应一套配置，可以创建多个应用对应多个环境使用</small>
                    </h3>
                    <!-- END PAGE TITLE-->
                    <!-- END PAGE HEADER-->
                    <!-- BEGIN DASHBOARD STATS 1-->
                    <div class="row">
                        <div class="col-md-12">
                            <!-- BEGIN SAMPLE TABLE PORTLET-->
                            <div class="portlet light bordered">
                                <div class="portlet-title">
                                    <div class="caption">
                                        <i class="icon-social-dribbble font-green"></i>
                                        <span class="caption-subject font-green bold uppercase">APP Table</span>
                                    </div>
                                    <div class="actions">
                                        <a class="btn btn-success" href="/apps/create">
                                            创建 <i class="icon-plus"></i>
                                        </a>
                                        
                                    </div>
                                </div>
                                <div class="portlet-body">
                                    <div class="table-scrollable">
                                        <table class="table table-bordered table-hover">
                                            <thead>
                                                <tr>
                                                    <th> 应用Id </th>
                                                    <th> 应用名 </th>
                                                    <th> 创建时间 </th>
                                                    <th> 应用描述 </th>
                                                    <th> 操作 </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <#if page.totalElements <= 0>
                                                <tr>
                                                    <td colspan="5"><p class="text-center">还没有创建应用呢</p></td>
                                                </tr>
                                                </#if>
                                                <#list page.content as item>
                                                <tr id="${item.appId}">
                                                    <td> ${item.appId} </td>
                                                    <td> ${item.appName} </td>
                                                    <td> ${item.createTime?number_to_datetime} </td>
                                                    <td> ${item.description} </td>
                                                    <td>
                                                        <a href="/apps/config?appId=${item.appId}" class="btn btn-success btn-sm">配置 <i class="icon-wrench"></i></a>
                                                        <a href="/apps/status?appId=${item.appId}" class="btn btn-info btn-sm">状态 <i class="glyphicon glyphicon-eye-open"></i></a>
                                                        <#if item.keyRole == "a">
                                                            <a href="/apps/users?appId=${item.appId}" class="btn purple btn-sm">协作者 <i class="icon-people"></i></a>
                                                            <button type="button" class="btn btn-danger btn-sm del-btn" data-appid="${item.appId}">删除 <i class="glyphicon glyphicon-trash"></i></button>
                                                        </#if>
                                                    </td>
                                                </tr>
                                                </#list>
                                                
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-5 col-sm-5">
                                        </div>
                                        <div class="col-md-7 col-sm-7">
                                            <#import "./common/pagin.ftl" as pagin/>
                                            <@pagin.genPagin url="/apps" totalPages=page.totalPages currPage=page.number+1 size=page.size showPageNum=5 />
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <!-- END SAMPLE TABLE PORTLET-->
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
                                <div class="modal-body"> 确定要删除该应用吗？ </div>
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
                <!-- END CONTENT BODY -->
            </div>
            <!-- END CONTENT -->
            
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
        <script src="/assets/pages/scripts/apps.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->

    </body>

</html>