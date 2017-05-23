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
        <link href="/assets/pages/css/error.css" rel="stylesheet" type="text/css" />
        <!-- END PAGE LEVEL STYLES -->
    </head>
    <!-- END HEAD -->

    <body class=" page-500-full-page">
        <div class="row">
            <div class="col-md-12 page-500">
                <div class="number font-red"> Denied </div>
                <div class="details">
                    <h3>没有权限</h3>
                    <p> 你没有权限操作该页面呢。
                        <br/>
                        <a href="/"> 返回首页 </a> 这是最明智的选择。 </p>
                    <p>
                        <a href="/" class="btn red btn-outline"> Return home </a>
                        <br> </p>
                </div>
            </div>
        </div>
        <#include "./common/script.ftl"/>
        
        <#include "./common/theme_script.ftl"/>
        

    </body>

</html>