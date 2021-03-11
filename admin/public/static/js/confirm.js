Confirm = {
    show: function (message, callback) {

        Swal.fire({
            title: '确认删除？',
            text: message,
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '删除',
            cancelButtonText: '取消'
        }).then((result) => {
            if (result.isConfirmed) {
                if (callback) {
                    callback()
                }
            }
        })


    }
}