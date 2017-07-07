$(document).ready(function(){
    $(".checkbox-all").change(function () {
        var chec = false;
        if ($(this).is(":checked"))
        {
            chec = true;
        }
        $(".checkbox-item").prop('checked', chec);
    });

    $('#btn-action-list').click(function(){
        var list_action_value = $("#list_action").val();
        var url = $("#frm").attr('action');

        if (list_action_value == '')
        {
            alert('Vui lòng chọn thao tác để thực hiện.')
            return;
        }
        else if (list_action_value == 'delete')
        {
            if ($(".checkbox-item:checked").length == 0)
            {
                alert('Vui lòng chọn đối tượng cần xóa.');
                return;
            }
        }

        $("#frm").attr('action', url + '/delete');
        $("#frm").submit();
    });

});

function confirmDelete() {
    if (!confirm('Bạn có chắc chắn muốn xóa?')) {
        return false;
    }
}

function confirmDeleteMessage(message) {
    if (!confirm(message)) {
        return false;
    }
}
