Validator = {
    require: function (value, text) {
        if (Tool.isEmpty(value)) {
            Toast.warning(text + "不能为空");
            return false;
        } else {
            return true
        }
    },

    length: function (value, text, min, max) {
        // 如果为空，就不做后续校验
        if (Tool.isEmpty(value)) {
            return true;
        }
        if (!Tool.isLength(value, min, max)) {
            Toast.warning(text + "长度" + min + "~" + max + "位");
            return false;
        } else {
            return true
        }
    }
};