$(document).ready(function() {
    add_user = function (e) {
        console.log("Insite")
        val = $(this).val()
        url = $(this).closest('form').attr('action')
        console.log(val)
        console.log(url)
        $.ajax({
            method: "PUT",
            url: url + ".json",
            data: {add_dev: true, developer_id: val}
        })
            .done(function (msg) {
                console.log('Success')
            })
            .fail(function (jqXHR, textStatus) {
                console.log("Request failed: " + textStatus);
            });
    }
    $('.user_select').change(add_user);

    add_field = function (e) {
        console.log('ad field')
        e.preventDefault();
        select = $(".user_main").first().clone()
        select.appendTo("#user_conteiner")
        $('.user_select').unbind( "change" );
        $('.user_select').change(add_user);
    }

    $('#add_user').click(add_field);

    $('#user_conteiner a.delete_user').click(function (e) {
        e.preventDefault();
        console.log('delete')
        elem = $(this).closest('.user_main')
        console.log(elem)
        elem.delete()
        //send request to delete developer from task
    });
});