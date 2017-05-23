/**
 * Created by cheshun on 17/1/2.
 */
var Users = function () {
    var showAlert = function(text, title, theme) {

        var settings = {
            theme: theme,
            sticky: false,
            horizontalEdge: 'top',
            verticalEdge: 'right',
            heading: title,
            life: 5000
        };

        $.notific8('zindex', 11500);
        $.notific8(text, settings);
    }
    
    var handle = function () {
        /**
         * 修改密码按钮绑定调用模态框事件
         */
        $('body').on('click', '.mod-pwd', function() {
            var username = $(this).data('username');
            $('#mod-pwd-form').find('input[name=username]').val(username);
            $('#mod-pwd-form').find('input[name=password]').val('');
            $('.alert-danger', $('#mod-pwd-form')).hide();
            $('#mod-password').modal('show');
            return false;
        });
        /**
         * 修改密码模态框确认事件
         */
        $('body').on('click', '.mod-pwd-ok', function() {
            $form = $('#mod-pwd-form');
            $.ajax({
                type: "POST",
                url: '/admin/users/password/update',
                data: $form.serialize(),
                success: function(data) {
                    if (data.code == '40005') {
                        window.location.reload();
                        return;
                    }
                    if (data.code == '20000') {
                        $('#mod-password').modal('hide');
                        showAlert('操作成功', '提示', 'teal');
                    } else {
                        $('.alert-danger>span', $('#mod-pwd-form')).text(data.message);
                        $('.alert-danger', $('#mod-pwd-form')).show();
                    }
                }
            });
            return false;
        });
        /**
         * 删除用户按钮绑定调用模态框事件
         */
        $('body').on('click', '.del-user', function() {
            var username = $(this).data('username');
            $('#del-modal').find('button.del-ok').data('username', username);
            $('#user-del-message').hide();
            $('#del-modal').modal('show');
        });
        /**
         * 删除用户模态框确认事件
         */
        $('body').on('click', '.del-ok', function() {
            var username = $(this).data('username');
            $.ajax({
                type: "POST",
                url: '/admin/users/delete',
                data: {
                    username: username
                },
                success: function(data) {
                    if (data.code == '40005') {
                        window.location.reload();
                        return;
                    }
                    if (data.code == '20000') {
                        $('#del-modal').modal('hide');
                        showAlert('操作成功', '提示', 'teal');
                    } else {
                        $('#user-del-message>span').text(data.message);
                        $('#user-del-message').show();
                    }
                }
            });
        });
    }
    return {

        //main function to initiate the module
        init: function () {
            handle();
        }

    };
}();
jQuery(document).ready(function() {
    Users.init();
});
