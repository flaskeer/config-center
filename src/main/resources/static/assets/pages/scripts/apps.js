var Apps = function () {
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
        $('body').on('click', 'button.del-btn', function() {
            var appId = $(this).data('appid');
            $('button.del-ok').data('appid', appId);
            $('#del-modal').modal('show');
            return false;
        });
        $('body').on('click', 'button.del-ok', function() {
            var appId = $(this).data('appid');
            $.ajax({
                type: "POST",
                url: '/apps/delete',
                data: {
                    appId: appId
                },
                success: function(data) {
                    if (data.code == '40005') {
                        window.location.reload();
                        return;
                    }
                    if (data.code == '20000') {
                        $('#' + appId).remove();
                        $('#del-modal').modal('hide');
                        showAlert('操作成功', '提示', 'teal');
                    } else {
                        showAlert(data.message, '提示', 'tangerine');
                    }
                }
            });
            return false;
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
    Apps.init();
});
