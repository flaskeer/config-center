var AppsConfig = function () {
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

    var addItem = function(id, appId, keyName, valueData, description, sync) {
        var hidden = 'hidden';
        if (!sync) {
            hidden = '';
        }
        if (description == null) {
            description = '';
        }
        var html =
        '<form id="' + id + '" class="mod-form">' +
        '    <div class="form-group">' +
        '        <input name="appId" type="hidden" value="' + appId + '">' +
        '        <div class="col-md-3">' +
        '            <input type="text" name="keyName" class="form-control" value="' + keyName + '" readonly>'+
        '        </div>' +

        '        <div class="col-md-3">' +
        '            <input name="valueData" type="text" class="form-control " placeholder="Value Data" value="' + valueData + '" readonly>' +
        '        </div>'+
        '        <div class="col-md-3">'+
        '            <input name="description" type="text" class="form-control " placeholder="Description" value="' + description + '" readonly>'+
        '        </div>'+
        '        <div class="col-md-3">'+
        '            <button type="button" class="btn btn-warning sync-btn '+ hidden +'" data-id="' + id + '" data-keyname="' + keyName + '">同步</button>' +
        '            <button type="button" class="btn btn-primary mod-btn">修改</button>' +
        '            <button type="button" class="btn btn-danger del-btn" data-id="' + id + '" data-keyname="' + keyName + '">删除</button>' +
        '        </div>' +
        '    </div>' +
        '</form>';

        $('#config-list').append(html);
    }

    var handleMod = function() {
        $('body').on('click', 'button.del-ok', function() {
            var id = $(this).data('id');
            var keyName = $(this).data('keyname');
            var appId = $('#appId').val();
            $.ajax({
                type: "POST",
                url: '/apps/config/delete',
                data: {
                    appId: appId,
                    keyName: keyName
                },
                success: function(data) {
                    if (data.code == '40005') {
                        window.location.reload();
                        return;
                    }
                    if (data.code == '20000') {
                        $('#' + id).remove();
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
        $('body').on('click', 'button.mod-btn', function() {
        
            $(this).attr('class', 'btn green save-btn');
            $(this).attr('type', 'submit');
            $(this).text('保存');

            $valueDataInput = $(this).parents('form').find('input[name=valueData]');
            $valueDataInput.removeAttr('readonly');
            $valueDataInput.select();
            $valueDataInput.focus();
            $descriptionInput = $(this).parents('form').find('input[name=description]');
            $descriptionInput.removeAttr('readonly');

            $(this).next().attr('class', 'btn default cancel-btn');
            $(this).next().text('取消');
            return false;
        });
        $('body').on('click', 'button.del-btn', function() {
            var id = $(this).data('id');
            var keyName = $(this).data('keyname');
            $('button.del-ok').data('id', id);
            $('button.del-ok').data('keyname', keyName);
            $('#del-modal').modal('show');
            return false;
        });
        $('body').on('click', 'button.cancel-btn', function() {
        
            $(this).prev().attr('class', 'btn btn-primary mod-btn');
            $(this).prev().attr('type', 'button');
            $(this).parents('form').find('input[name=valueData]').attr('readonly', true);
            $(this).parents('form').find('input[name=description]').attr('readonly', true);
            $(this).prev().text('修改');
            $(this).attr('class', 'btn btn-danger del-btn');
            $(this).text('删除');
            return false;
        });
        $('body').on('click', 'button.save-btn', function() {
            var $form = $(this).parents('form');
            if ($form.find('input[name=valueData]').val() == '') {
                showAlert('Value Data不能为空', '提示', 'tangerine');
                return false;
            }
            submit($form);
            return false;
        });
        $('body').on('click', 'button.sync-btn', function () {

            var keyName = $(this).data('keyname');
            var appId = $('#appId').val();
            $.ajax({
                type: "POST",
                url: '/apps/config/sync',
                data: {
                    appId: appId,
                    keyName: keyName
                },
                success: function(data) {
                    if (data.code == '40005') {
                        window.location.reload();
                        return;
                    }
                    if (data.code == '20000') {
                        loadConfigList();
                        showAlert('操作成功', '提示', 'teal');
                    } else {
                        showAlert(data.message, '提示', 'tangerine');
                    }
                },
                dataType: 'json'
            });
            return false;
        });
        $('body').on('click', 'button.all-sync-ok', function () {
            var appId = $('#appId').val();
            $.ajax({
                type: "POST",
                url: '/apps/config/all/sync',
                data: {
                    appId: appId
                },
                success: function(data) {
                    if (data.code == '40005') {
                        window.location.reload();
                        return;
                    }
                    if (data.code == '20000') {
                        loadConfigList();
                        $('#all-sync-modal').modal('hide');
                        showAlert('操作成功', '提示', 'teal');
                    } else {
                        showAlert(data.message, '提示', 'tangerine');
                    }
                },
                dataType: 'json'
            });
            return false;
        });
        
        var submit = function(form) {
            $.ajax({
                type: "POST",
                url: '/apps/config/update',
                data: form.serialize(),
                success: function(data) {
                    if (data.code == '40005') {
                        window.location.reload();
                        return;
                    }
                    if (data.code == '20000') {
                        $saveBtn = form.find('button.save-btn');
                        $saveBtn.attr('class', 'btn btn-primary mod-btn');
                        $saveBtn.attr('type', 'button');
                        form.find('input[name=valueData]').attr('readonly', true);
                        form.find('input[name=description]').attr('readonly', true);
                        $saveBtn.text('修改');

                        $cancelBtn = form.find('button.cancel-btn');
                        $cancelBtn.attr('class', 'btn btn-danger del-btn');
                        $cancelBtn.text('删除');

                        showAlert('操作成功', '提示', 'teal');
                    } else {
                        showAlert(data.message, '提示', 'tangerine');
                    }
                },
                dataType: 'json'
            });
        }
        
    }

    var handleAdd = function() {
        $('.add-form').validate({
            errorElement: 'span', //default input error message container
            //errorClass: 'help-block', // default input error message class
            focusInvalid: false, // do not focus the last invalid input
            rules: {
                keyName: {
                    required: true
                },
                valueData: {
                    required: true
                }
            },

            messages: {
                keyName: {
                    required: "Key Name is required."
                },
                valueData: {
                    required: "Value Data is required."
                }
            },

            invalidHandler: function(event, validator) { //display error alert on form submit   
                showAlert('请输入Key Name & Value Data', '提示', 'ruby');
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
                submit($(form));
                
            }
        });
        
        var submit = function(form) {
            $button = form.find('button');
            $button.attr('disabled', 'disabled');
            $.ajax({
                type: "POST",
                url: '/apps/config/create',
                data: form.serialize(),
                success: function(data) {
                    if (data.code == '40005') {
                        window.location.reload();
                        return;
                    }
                    if (data.code == '20000') {
                        var configuration = data.resp.configuration;
                        addItem(configuration.id, configuration.appId ,configuration.keyName, configuration.valueData,
                            configuration.description, true);
                        form.find('input[name=keyName]').val('');
                        form.find('input[name=valueData]').val('');
                        form.find('input[name=description]').val('');
                        showAlert('操作成功', '提示', 'teal');
                    } else {
                        showAlert(data.message, '提示', 'tangerine');
                    }
                }
            });
            setTimeout(function() {
                $button.removeAttr('disabled');
            }, 1000);
        }

    }

    var handleImport = function() {
        $('body').on('click', '#import-btn', function() {
            var formData = new FormData();
            formData.append('file', $('#import-config').find('input[type=file]')[0].files[0]);
            formData.append('appId', $('#appId').val());
            $.ajax({
                type: "POST",
                url: '/apps/config/import',
                data: formData,
                success: function(data) {
                    if (data.code == '40005') {
                        window.location.reload();
                        return;
                    }
                    if (data.code == '20000') {
                        loadConfigList('');
                        var file = $('#import-config').find('input[type=file]');
                        file.after(file.clone().val(""));
                        file.remove();
                        showAlert('操作成功', '提示', 'teal');
                    } else {
                        showAlert(data.message, '提示', 'tangerine');
                    }
                },
                cache: false,
                processData: false,
                contentType: false
            });
        });
    }

    var loadConfigList = function(keyName) {
        $.ajax({
            type: "GET",
            url: '/apps/config/list',
            data: {
                appId: $('#appId').val(),
                keyName: keyName
            },
            success: function(data) {
                if (data.code == '40005') {
                    window.location.reload();
                    return;
                }
                if (data.code == '20000') {
                    $('#config-list').empty();
                    if (data.resp.list.length <= 0) {
                        $('#config-list').append('没有配置项呢');
                    }
                    for (var i = 0; i < data.resp.list.length; i++) {
                        var item = data.resp.list[i];
                        addItem(item.id, item.appId, item.keyName, item.valueData, item.description, item.sync);
                    }
                } else {
                    showAlert(data.message, '提示', 'tangerine');
                }
            }
        });
    }

    var handleSearch = function() {
        $('body').on('click', '#search-btn', function() {
            var keyName = $('#search-config').find('input[name=keyName]').val();
            loadConfigList(keyName);
        });
        $('#search-config').find('input[name=keyName]').keypress(function(e) {
            if (e.which == 13) {
                var keyName = $(this).val();
                loadConfigList(keyName);
                return false;
            }
        });
    }

    var loadHistoryConfig = function (page) {
        $.ajax({
            type: "GET",
            url: '/apps/config/history/list',
            data: {
                page: page,
                appId: $('#appId').val()
            },
            success: function(data) {
                if (data.code == '40005') {
                    window.location.reload();
                    return;
                }
                if (data.code == '20000') {
                    $('#history-list').empty();
                    if (data.resp.histories.length <= 0) {
                        var html = '<tr><td colspan="2">没有历史版本呢</td></tr>';
                        $('#history-list').append(html);
                        $('#history-next-btn').data('more', 0);
                    } else {
                        $('#history-next-btn').data('more', 1);
                    }
                    for (var i = 0; i < data.resp.histories.length; i++) {
                        var item = data.resp.histories[i];
                        var html =
                            '<tr>' +
                            '    <td>' +
                            '    <input type="checkbox" class="history-item" value="'+ item.id +'">' +
                            '        </td>' +
                            '    <td>'+ item.createTime +'</td>' +
                            '    <td>'+ item.description +'</td>' +
                            '</tr>';
                        $('#history-list').append(html);
                    }
                    if (page >= 1) {
                        $('#history-prev-btn').data('page', page - 1);
                        $('#history-next-btn').data('page', page + 1);
                    }
                } else {
                    showAlert(data.message, '提示', 'tangerine');
                }
            }
        });
    }

    var handleHistory = function () {
        $('body').on('click', '#history-btn', function () {
            $('#history-modal').modal('show');
            loadHistoryConfig(1);
        });

        $('body').on('click', '#history-prev-btn', function () {
            var page = $('#history-prev-btn').data('page');
            if (page < 1) {
                showAlert('已经是第一页了呢', '提示', 'tangerine');
                return;
            }
            loadHistoryConfig(page);
        });
        $('body').on('click', '#history-next-btn', function () {
            var more = $('#history-next-btn').data('more');
            if (more == 0) {
                showAlert('没有更多了呢', '提示', 'tangerine');
                return;
            }
            var page = $('#history-next-btn').data('page');
            loadHistoryConfig(page);
        });
        $('body').on('click', 'input.history-item', function () {
            var id = $(this).val();
            $('input.history-item').each(function () {
                if ($(this).val() != id) {
                    $(this).removeAttr('checked');
                }
            });
        });
        $('body').on('click', '#use-history-ok', function () {
            $checked = $('input.history-item:checked');
            if ($checked.length < 1) {
                showAlert('必须选择一个历史版本', '提示', 'tangerine');
                return;
            }
            if ($checked.length > 1) {
                showAlert('只能选择一个历史版本呢', '提示', 'tangerine');
                return;
            }
            var id = $checked.val()
            $.ajax({
                type: 'POST',
                url: '/apps/config/history/use',
                data: {
                    appId: $('#appId').val(),
                    historyId: id
                },
                success: function (data) {
                    if (data.code == '40005') {
                        window.location.reload();
                        return;
                    }
                    if (data.code == '20000') {
                        $('#history-modal').modal('hide');
                        var keyName = $('#search-config').find('input[name=keyName]').val();
                        loadConfigList(keyName);
                        showAlert('操作成功', '提示', 'teal');
                    } else {
                        showAlert(data.message, '提示', 'tangerine');
                    }
                }
            });
        })
    }

    return {
        //main function to initiate the module
        init: function() {
            loadConfigList('');
            handleMod();
            handleAdd();
            handleImport();
            handleSearch();
            handleHistory();
        }
    };
}();

jQuery(document).ready(function() {
    AppsConfig.init();
});