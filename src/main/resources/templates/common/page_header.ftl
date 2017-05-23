<!-- BEGIN HEADER -->
<div class="page-header navbar navbar-fixed-top">
    <!-- BEGIN HEADER INNER -->
    <div class="page-header-inner ">
        <!-- BEGIN LOGO -->
        <div class="page-logo">
            <a href="/">
                <img src="/assets/layouts/layout/img/logo.png" alt="logo" class="logo-default" /> </a>
            <div class="menu-toggler sidebar-toggler"> </div>
        </div>
        <!-- END LOGO -->
        <!-- BEGIN RESPONSIVE MENU TOGGLER -->
        <a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse"> </a>
        <!-- END RESPONSIVE MENU TOGGLER -->
        <!-- BEGIN TOP NAVIGATION MENU -->
        <div class="top-menu">
            <ul class="nav navbar-nav pull-right">


                <!-- BEGIN USER LOGIN DROPDOWN -->
                <!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
                <li class="dropdown dropdown-user">
                    <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                        <img alt="" class="img-circle" src="/assets/layouts/layout/img/avatar3_small.jpg" />
                        <span class="username username-hide-on-mobile"> ${Session.user.username} </span>
                        <i class="fa fa-angle-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-default">
                        <li>
                            <a class="head-mod-pwd">
                                <i class="icon-user"></i> 修改密码 </a>
                        </li>

                        <li class="divider"> </li>

                        <li>
                            <a href="/logout">
                                <i class="icon-key"></i> 退出 </a>
                        </li>
                    </ul>
                </li>
                <!-- END USER LOGIN DROPDOWN -->

            </ul>
        </div>
        <!-- END TOP NAVIGATION MENU -->
    </div>
    <!-- END HEADER INNER -->
</div>
<!-- END HEADER -->
<div class="modal fade" id="head-mod-password" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">修改密码</h4>
            </div>
            <div class="modal-body">
                <form id="head-mod-pwd-form" class="form-horizontal" role="form">
                    <div class="alert alert-danger display-hide">
                        <button class="close" data-close="alert"></button>
                        <span> Some text. </span>
                    </div>
                    <div class="form-body">
                        
                        <div class="form-group">
                            <label class="col-md-3 control-label">原密码</label>
                            <div class="col-md-9">
                                <input type="password" name="oldPassword" class="form-control" placeholder="Enter old password">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">新密码</label>
                            <div class="col-md-9">
                                <input type="password" name="newPassword" class="form-control" placeholder="Enter new password">
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn default" data-dismiss="modal">取消</button>
                <button type="button" class="btn green head-mod-pwd-ok">确定修改</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>