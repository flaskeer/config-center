var AppsCreate = function () {
    var handleCreate = function() {
        $('#apps-create-form').validate({
            errorElement: 'span', //default input error message container
            //errorClass: 'help-block', // default input error message class
            focusInvalid: false, // do not focus the last invalid input
            rules: {
                appName: {
                    required: true
                },
                description: {
                    required: true
                }
            },

            messages: {
                appName: {
                    required: "Name is required."
                },
                description: {
                    required: "Description is required."
                }
            },

            invalidHandler: function(event, validator) { //display error alert on form submit   
                $('.alert-danger>span', $('.login-form')).text('请输入应用名和描述.');
                $('.alert-danger', $('#apps-create-form')).show();
            },

            highlight: function(element) { // hightlight error inputs
                $(element)
                    .closest('.form-group').addClass('has-error'); // set error class to the control group
            },

            success: function(label) {
                label.closest('.form-group').removeClass('has-error');
                label.remove();
            },

            errorPlacement: function(error, element) {
                error.insertAfter(element.closest('.input-icon'));
            },

            submitHandler: function(form) {
                //form.submit(); // form validation success, call ajax form submit
                apps();
            }
        });
        var apps = function() {
            $.ajax({
                type: "POST",
                url: '/apps/create',
                data: $('#apps-create-form').serialize(),
                success: function(data) {
                    if (data.code == '40005') {
                        window.location.reload();
                        return;
                    }
                    if (data.code == '20000') {
                        window.location.href='/apps';
                    } else {
                        $('.alert-danger>span', $('.login-form')).text(data.message);
                        $('.alert-danger', $('.login-form')).show();
                    }
                }
            });
        }
    }

    return {
        //main function to initiate the module
        init: function() {
            handleCreate();
        }
    };
}();

jQuery(document).ready(function() {
    AppsCreate.init();
});