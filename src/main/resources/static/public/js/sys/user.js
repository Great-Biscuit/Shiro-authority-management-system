// 自执行函数，获取用户信息，填充表格，挂载到 table 上
$(function(){
    var option = {
        url: '../sys/user/list',
        pagination: true,	//显示分页条
        sidePagination: 'server',//服务器端分页
        showRefresh: true,  //显示刷新按钮
        toolbar: '#toolbar',
        search: true,
        striped : true,     //设置为true会有隔行变色效果
        columns: [
            {checkbox:true},
            { title: '用户ID', field: 'userId', width: 45 },
            { title: '用户名', field: 'username', width: 75 },
            { title: '创建者ID', field: 'createUserId', width: 75 },
            { title: '邮箱', field: 'email', width: 90 },
            { title: '手机号', field: 'mobile', width: 100 },
            { title: '状态', field: 'status', width: 60, formatter: function(value, options, row){
                    return value === 0 ?
                        '<span class="label label-danger">禁用</span>' :
                        '<span class="label label-success">正常</span>';
                }},
            { title: '创建时间', field: 'createTime', width: 85}
        ]};
    $('#table').bootstrapTable(option);
});

// 创建 user 组件实例
var vm = new Vue({
    el:'#rrapp',
    data:{
        q:{
            username: null
        },
        showList: true,
        title:null,
        roleList:{},
        user:{
            status:1,
            roleIdList:[],
            username: '',
            password: '',
            email: '',
            mobile: ''
        }
    },
    methods: {
        // 当点击增加按钮时执行，显示增加表单
        add: function(){
            vm.showList = false;
            vm.title = "新增";
            vm.roleList = {};
            vm.user = {status:1, roleIdList:[]};
            // 获取角色信息
            this.getRoleList();
        },
        // 当点击修改按钮时执行，显示编辑表单
        update: function () {
            var userId = getSelectedRow();
            if(userId == null){
                return ;
            }
            vm.showList = false;
            vm.title = "修改";

            vm.getUser(userId);
            // 获取角色信息
            this.getRoleList();
        },
        // 删除单条或多条用户信息
        del: function(){
            var userIds = getSelectedRows();
            if(userIds == null){
                return ;
            }
            var id = 'userId';
            //提示确认框
            layer.confirm('您确定要删除所选数据吗？', {
                btn: ['确定', '取消']
            }, function(index, layero){
                var ids = new Array();
                //遍历所有选择的行数据，取每条数据对应的ID
                $.each(userIds, function(i, row) {
                    ids[i] = row[id];
                });
                $.ajax({
                    type: "POST",
                    url: "../sys/user/delete",
                    data: JSON.stringify(ids),
                    success : function(r) {
                        if(r.code === 0){
                            layer.alert('删除成功');
                            $('#table').bootstrapTable('refresh');
                        }else{
                            layer.alert(r.msg);
                        }
                    },
                    error : function() {
                        layer.alert('服务器没有返回数据，可能服务器忙，请重试');
                    }
                });
            });
        },
        // 当新增和编辑信息填写完点击确认后触发，更新数据
        saveOrUpdate: function () {
            var url = vm.user.userId == null ? "../sys/user/save" : "../sys/user/update";
            $.ajax({
                type: "POST",
                url:  url,
                contentType: "application/json",
                data: JSON.stringify(vm.user),
                success: function(r){
                    if(r.code === 0){
                        layer.alert('操作成功', function(index){
                            layer.close(index);
                            vm.reload();
                        });
                    }else{
                        layer.alert(r.msg);
                    }
                }
            });
        },
        // 获取用户信息
        getUser: function(userId){
            $.get("../sys/user/info/"+userId.userId, function(r){
                console.log("userInfo", userId.userId);
                vm.user = r.user;
                vm.user.password = null;
            });
        },
        // 获取角色信息
        getRoleList: function(){
            $.get("../sys/role/select", function(r){
                vm.roleList = r.list;
            });
        },
        // 重新加载表格
        reload: function (event) {
            vm.showList = true;
            $("#table").bootstrapTable('refresh');
        }
    }
});