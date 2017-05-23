/**
 * Created by cheshun on 17/1/2.
 */
var PageHeader = function() {

    var handleModPassword = function() {
        
        $('body').on('click', '.head-mod-pwd', function() {
            $('.alert-danger', $('#head-mod-pwd-form')).hide();
            $('#head-mod-pwd-form').find('input').val('');
            $('#head-mod-password').modal('show');
            return false;
        });

        $('body').on('click', '.head-mod-pwd-ok', function() {
            $form = $('#head-mod-pwd-form');
            
            $.ajax({
                type: "POST",
                url: '/users/password/update',
                data: $form.serialize(),
                success: function(data) {
                    if (data.code == '40005') {
                        window.location.reload();
                        return;
                    }
                    if (data.code == '20000') {
                        $('#head-mod-password').modal('hide');
                    } else {
                        $('.alert-danger>span', $('#head-mod-pwd-form')).text(data.message);
                        $('.alert-danger', $('#head-mod-pwd-form')).show();
                    }
                },
                dataType: 'json'
            });
        });
    }

    return {
        //main function to initiate the module
        init: function() {
            handleModPassword();
        }

    };
}();

jQuery(document).ready(function() {
    PageHeader.init();
});