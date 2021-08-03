// 自执行函数，获取角色信息，填充表格，挂载到 table 上
$(function(){
    var option = {
        url: '../sys/role/list',
        pagination: true,	//显示分页条
        sidePagination: 'server',//服务器端分页
        showRefresh: true,  //显示刷新按钮
        toolbar: '#toolbar',
        search: true,
        striped : true,     //设置为true会有隔行变色效果
        columns: [
            {checkbox:true},
            { title: '角色ID', field: 'roleId',width: 45 },
            { title: '角色名称', field: 'roleName', width: 75 },
            { title: '创建者ID', field: 'createUserId', width: 75 },
            { title: '备注', field: 'remark', width: 100 },
            { title: '创建时间', field: 'createTime', width: 80}
        ]};
    $('#table').bootstrapTable(option);
});

//菜单树
var menu_ztree;
var menu_setting = {
    data: {
        simpleData: {
            enable: true,
            idKey: "menuId",
            pIdKey: "parentId",
            rootPId: -1
        },
        key: {
            url:"nourl"
        }
    },
    check:{
        enable:true,
        nocheckInherit:true
    }
};

// 创建 role 组件实例
var vm = new Vue({
    el:'#rrapp',
    data:{
        q:{
            roleName: null
        },
        showList: true,
        title: null,
        role:{
            menuIdList:[]
        }
    },
    methods: {
        // 当点击增加按钮时执行，显示增加表单
        add: function(){
            vm.showList = false;
            vm.title = "新增";
            // 获取菜单信息
            vm.getMenuTree(null);
        },
        // 当点击修改按钮时执行，显示编辑表单
        update: function () {
            var roleId = getSelectedRow();
            if(roleId == null){
                return ;
            }
            vm.showList = false;
            vm.title = "修改";
            // 获取菜单信息
            vm.getMenuTree(roleId);
        },
        // 删除单条或多条角色信息
        del: function(){
            var roleIds = getSelectedRows();
            if(roleIds == null){
                return ;
            }
            var id = 'roleId';
            //提示确认框
            layer.confirm('您确定要删除所选数据吗？', {
                btn: ['确定', '取消']
            }, function(index, layero){
                var ids = new Array();
                //遍历所有选择的行数据，取每条数据对应的ID
                $.each(roleIds, function(i, row) {
                    ids[i] = row[id];
                });

                $.ajax({
                    type: "POST",
                    url: "../sys/role/delete",
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
        // 获取角色信息
        getRole: function(roleId){
            roleId = roleId.roleId;
            $.get("../sys/role/info/"+roleId, function(r){
                vm.role = r.role;
                console.log("role:", roleId, r.role);
                //勾选角色所拥有的菜单
                var menuIds = vm.role.menuIdList;
                for(var i=0; i<menuIds.length; i++) {
                    var node = menu_ztree.getNodeByParam("menuId", menuIds[i]);
                    menu_ztree.checkNode(node, true, false);
                }
            });
        },
        // 当新增和编辑信息填写完点击确认后触发，更新数据
        saveOrUpdate: function () {
            //获取选择的菜单
            var nodes = menu_ztree.getCheckedNodes(true);
            var menuIdList = new Array();
            for(var i=0; i<nodes.length; i++) {
                menuIdList.push(nodes[i].menuId);
            }
            vm.role.menuIdList = menuIdList;

            var url = vm.role.roleId == null ? "../sys/role/save" : "../sys/role/update";
            $.ajax({
                type: "POST",
                url: url,
                contentType: "application/json",
                data: JSON.stringify(vm.role),
                success: function(r){
                    if(r.code === 0){
                        layer.alert('操作成功', function(index){
                            layer.close(index);
                            vm.reload();
                        });
                    }else{
                        layer.alert(r.msg);
                    }
                },
                error : function() {
                    layer.alert('服务器没有返回数据，可能服务器忙，请重试');
                }
            });
        },
        // 获取菜单信息
        getMenuTree: function(roleId) {
            //加载菜单树
            $.get("../sys/menu/listall", function(r){
                menu_ztree = $.fn.zTree.init($("#menuTree"), menu_setting, r);
                //展开所有节点
                menu_ztree.expandAll(true);

                if(roleId != null){
                    vm.getRole(roleId);
                }
            });
        },
        // 重新加载表格
        reload: function (event) {
            vm.showList = true;
            $("#table").bootstrapTable('refresh');
        }
    }
});