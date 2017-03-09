/**
 * 创建一个空对象
 */
function M() {
    console.log('gulp test');
    return new Object();
}

/**
 * 判断是否为空
 */
function empty(data) {
    console.log(data);
    if (typeof data == 'object') {
        if (data == '') {
            return true;
        }
    } else if (typeof data == 'array') {
        if (data.length == 0) {
            return true;
        }
    } else if (typeof data == 'string') {
        if (data == '') {
            return true;
        }
    }
    return false;
}

exports.M=M;
exports.empty=empty;