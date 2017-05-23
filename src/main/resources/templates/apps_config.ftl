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
                                <span>应用配置</span>
                            </li>
                        </ul>
                        
                    </div>
                    <!-- END PAGE BAR -->
                    <!-- BEGIN PAGE TITLE-->
                    <h3 class="page-title"> 应用配置
                        <small>每个应用对应一套配置，导入配置会完全替换之前的配置以文件配置为准，配置的key长度不能超过100呢。
                            单个数据不同步请点击同步按钮，全量同步会全量导入数据库配置数据到zk中覆盖zk数据。</small>
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
                                        <span class="caption-subject font-dark sbold uppercase">${appName} 配置信息 [系统当前连接的zk地址为:${serverLists}]</span>

                                    </div>
                                    <div class="actions">
                                        
                                        <div id="search-config" class="col-md-4 input-group pull-left" style="padding-right: 10px;">
                                            <input type="text" name="keyName" value="" class="form-control" placeholder="Search for Key Name">
                                            <span class="input-group-btn">
                                                <button id="search-btn" class="btn blue" type="button">搜索</button>
                                            </span>
                                        </div>
                                        <div id="import-config" class="col-md-4 input-group pull-left" style="padding-right: 10px;">
                                            
                                            <input type="file" class="form-control">
                                            <span class="input-group-btn">
                                                <button id="import-btn" class="btn green btn-outline" type="button">导入</button>
                                            </span>
                                        </div>
                                        <div class="col-md-4 input-group pull-left" style="padding-right: 10px;">
                                            <span class="input-group-btn">
                                                <a href="/apps/config/export?appId=${appId}" target="_blank" class="btn yellow btn-outline" style="margin-right: 10px;">导出</a>
                                                <button id="all-sync-btn" class="btn purple btn-outline" type="button" data-toggle="modal" data-target="#all-sync-modal">全量同步</button>
                                                <button id="history-btn" class="btn dark btn-outline" type="button">历史</button>
                                                <a href="/apps/config/opts?appId=${appId}" class="btn dark btn-outline">日志</a>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="portlet-body form">
                                    <div class="form-horizontal" >
                                        
                                        <div id="config-list" class="form-body">
                                            还没有任何配置呢
                                        </div>
                                        
                                        <div class="form-actions">
                                            <div class="row">
                                                <form class="add-form">
                                                <input id="appId" name="appId" type="hidden" value="${appId}">
                                                <div class="col-md-3">
                                                    <input name="keyName" type="text" class="form-control" placeholder="Key Name">
                                                </div>
                                                <div class="col-md-3">
                                                    <input name="valueData" type="text" class="form-control" placeholder="Value Data">
                                                </div>
                                                <div class="col-md-3">
                                                    <input name="description" type="text" class="form-control" placeholder="Description">
                                                </div>
                                                <div class="col-md-3">
                                                    <button type="submit" class="btn green">添加</button>
                                                </div>
                                                </form>
                                            </div>
                                        </div>
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
                                <div class="modal-body"> 确定要删除该配置吗？ </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn default" data-dismiss="modal">取消</button>
                                    <button type="button" class="btn btn-danger del-ok">确定</button>
                                </div>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                        <!-- /.modal-dialog -->
                    </div>
                    <div class="modal fade bs-modal-sm" id="all-sync-modal" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog modal-sm">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                    <h4 class="modal-title">提示</h4>
                                </div>
                                <div class="modal-body"> 确定要全量同步配置吗？ </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn default" data-dismiss="modal">取消</button>
                                    <button type="button" class="btn btn-primary all-sync-ok">确定</button>
                                </div>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                        <!-- /.modal-dialog -->
                    </div>
                    <div class="modal fade draggable-modal" id="history-modal" tabindex="-1" role="basic" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                    <h4 class="modal-title">历史版本</h4>
                                </div>
                                <div class="modal-body">
                                    <form action="" class="form-horizontal" role="form">
                                        <div class="form-body">
                                            <div class="table-scrollable">
                                                <table class="table table-striped table-bordered table-advance table-hover">
                                                    <thead>
                                                    <tr>

                                                        <th> 选择 </th>
                                                        <th> 版本生成时间 </th>
                                                        <th> 操作描述 </th>
                                                    </tr>
                                                    </thead>
                                                    <tbody id="history-list">
                                                    <tr>
                                                        <td>
                                                            <input type="checkbox" id="inlineCheckbox22" value="option2" disabled>
                                                        </td>
                                                        <td colspan="2"> 正在加载... </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </div>

                                            <div>
                                                <button type="button" class="btn btn-info" id="history-prev-btn">上一页</button>
                                                <button type="button" class="btn btn-info" id="history-next-btn">下一页</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn default" data-dismiss="modal">取消</button>
                                    <button type="button" class="btn btn-primary" id="use-history-ok">应用历史版本</button>
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
        <script src="/assets/pages/scripts/apps-config.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->

    </body>

</html>