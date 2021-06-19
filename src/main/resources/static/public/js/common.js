// ajax全局配置
$.ajaxSetup({
    dataType: "json",
    contentType: "application/json",
    cache: false
});

// 选择多条记录
function getSelectedRows() {
    //返回所有选择的行，当没有选择的记录时，返回一个空数组
    var rows = $("#table").bootstrapTable('getSelections');
    if (rows.length == 0) {
        layer.alert('请选择一条记录');
        return;
    }
    return rows;
}

// 选择一条记录
function getSelectedRow() {
    //返回所有选择的行，当没有选择的记录时，返回一个空数组
    var rows = $("#table").bootstrapTable('getSelections');
    if (rows.length == 0) {
        layer.alert('请选择一条记录');
        return;
    }
    if(rows.length > 1){
        layer.alert("只能选择一条记录");
        return ;
    }
    return rows[0];
}

// 判断是否有权限，用于确定增删改按钮等是否显示
function hasPermission(permission) {
    if (window.parent.permissions.indexOf(permission) > -1) {
        return true;
    } else {
        return false;
    }
}