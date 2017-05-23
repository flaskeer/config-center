var UsersCreate = function () {
    var handleCreate = function() {
        $('#users-create-form').validate({
            errorElement: 'span', //default input error message container
            //errorClass: 'help-block', // default input error message class
            focusInvalid: false, // do not focus the last invalid input
            rules: {
                username: {
                    required: true
                },
                password: {
                    required: true
                }
            },

            messages: {
                username: {
                    required: "Username is required."
                },
                password: {
                    required: "Password is required."
                }
            },

            invalidHandler: function(event, validator) { //display error alert on form submit   
                $('.alert-danger>span', $('.login-form')).text('请输入应用名和描述.');
                $('.alert-danger', $('#users-create-form')).show();
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
                submit();
            }
        });
        var submit = function() {
            $.ajax({
                type: "POST",
                url: '/admin/users/create',
                data: $('#users-create-form').serialize(),
                success: function(data) {
                    if (data.code == '40005') {
                        window.location.reload();
                        return;
                    }
                    if (data.code == '20000') {
                        window.location.href='/admin/users';
                    } else {
                        $('.alert-danger>span', $('.login-form')).text(data.message);
                        $('.alert-danger', $('.login-form')).show();
                    }
                },
                dataType: 'json'
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
    UsersCreate.init();
});