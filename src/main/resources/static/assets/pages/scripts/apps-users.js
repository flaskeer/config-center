var AppsUsers = function () {
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

    var addItem = function (userId, username, keyRole) {
        var appId = $('#appId').val();
        var html =
            '<tr id="' + userId + '">' +
            '   <td> ' + username + ' </td>' +
            '   <td> ' + keyRole + ' </td>' +
            '   <td>' +
            '       <button type="button" class="btn btn-danger btn-sm del-btn" ' +
            '           data-appid="' + appId + '" data-userid="' + userId + '">删除' +
            '           <i class="glyphicon glyphicon-trash"></i></button>' +
            '   </td>' +
            '</tr>';
        $('#user-list').append(html);
    }

    var handleMod = function() {
        $('body').on('click', 'button.del-ok', function() {
            var appId = $(this).data('appid');
            var userId = $(this).data('userid');
            $.ajax({
                type: "POST",
                url: '/apps/users/delete',
                data: {
                    appId: appId,
                    userId: userId
                },
                success: function(data) {
                    if (data.code == '40005') {
                        window.location.reload();
                        return;
                    }
                    if (data.code == '20000') {
                        loadUserList();
                        $('#del-modal').modal('hide');
                        showAlert('操作成功', '提示', 'teal');
                    } else {
                        showAlert(data.message, '提示', 'tangerine');
                    }
                },
                dataType: 'json'
            });
            return false;
        });

        $('body').on('click', 'button.del-btn', function() {
            var appId = $(this).data('appid');
            var userId = $(this).data('userid');
            $('button.del-ok').data('appid', appId);
            $('button.del-ok').data('userid', userId);
            $('#del-modal').modal('show');
            return false;
        });

        $('body').on('click', 'button.save-btn', function() {
            var $form = $('#add-form');
            if ($form.find('input[name=username]').val() == '') {
                showAlert('Username不能为空', '提示', 'tangerine');
                return false;
            }
            submit($form);
            return false;
        });

        var submit = function(form) {
            $.ajax({
                type: "POST",
                url: '/apps/users/create',
                data: form.serialize(),
                success: function(data) {
                    if (data.code == '40005') {
                        window.location.reload();
                        return;
                    }
                    if (data.code == '20000') {
                        form.find('input[name=username]').val('');
                        loadUserList();
                        $('#create-modal').modal('hide');
                        showAlert('操作成功', '提示', 'teal');
                    } else {
                        showAlert(data.message, '提示', 'tangerine');
                    }
                },
                dataType: 'json'
            });
        }

    }

    var loadUserList = function () {
        $.ajax({
            type: "GET",
            url: '/apps/users/list',
            data: {
                appId: $('#appId').val()
            },
            success: function(data) {
                if (data.code == '40005') {
                    window.location.reload();
                    return;
                }
                if (data.code == '20000') {
                    $('#user-list').empty();
                    for (var i = 0; i < data.resp.appUsers.userAppList.length; i++) {
                        var item = data.resp.appUsers.userAppList[i];
                        addItem(item.userId, item.username, item.keyRole);
                    }
                } else {
                    showAlert(data.message, '提示', 'tangerine');
                }
            }
        });
    }



    return {
        //main function to initiate the module
        init: function() {
            loadUserList();
            handleMod();
        }
    };
}();

jQuery(document).ready(function() {
    AppsUsers.init();
});