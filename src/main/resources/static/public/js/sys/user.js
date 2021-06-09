// $(function () {
//     $("#jqGrid").jqGrid({
//         url: 'http://localhost:8090/sys/user/list',
//         datatype: "json",
//         colModel: [
// 			{ label: '用户ID', name: 'userId', index: "user_id", width: 45, key: true },
// 			{ label: '用户名', name: 'username', width: 75 },
//             { label: '所属部门', name: 'deptName', sortable: false, width: 75 },
// 			{ label: '邮箱', name: 'email', width: 90 },
// 			{ label: '手机号', name: 'mobile', width: 100 },
// 			{ label: '状态', name: 'status', width: 60, formatter: function(value, options, row){
// 				return value === 0 ?
// 					'<span class="label label-danger">禁用</span>' :
// 					'<span class="label label-success">正常</span>';
// 			}},
// 			{ label: '创建时间', name: 'createTime', index: "create_time", width: 85}
//         ],
// 		viewrecords: true,
//         height: 385,
//         rowNum: 10,
// 		rowList : [10,30,50],
//         rownumbers: true,
//         rownumWidth: 25,
//         autowidth:true,
//         multiselect: true,
//         pager: "#jqGridPager",
//         jsonReader : {
//             root: "page.list",
//             page: "page.currPage",
//             total: "page.totalPage",
//             records: "page.totalCount"
//         },
//         prmNames : {
//             page:"page",
//             rows:"limit",
//             order: "order"
//         },
//         gridComplete:function(){
//         	//隐藏grid底部滚动条
//         	$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" });
//         }
//     });
// });

$(function(){
    var option = {
        url: '../sys/user/list',
        pagination: true,	//显示分页条
        sidePagination: 'server',//服务器端分页
        showRefresh: true,  //显示刷新按钮
        toolbar: '#toolbar',
        search: true,
        striped : true,     //设置为true会有隔行变色效果
        //idField: 'menuId',
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


var setting = {
    data: {
        simpleData: {
            enable: true,
            // idKey: "deptId",
            pIdKey: "parentId",
            rootPId: -1
        },
        key: {
            url:"nourl"
        }
    }
};
var ztree;

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
            roleIdList:[]
        }
    },
    methods: {
        // query: function () {
        //     vm.reload();
        // },
        add: function(){
            vm.showList = false;
            vm.title = "新增";
            vm.roleList = {};
            vm.user = {status:1, roleIdList:[]};

            //获取角色信息
            this.getRoleList();

            // vm.getDept();
        },
        // getDept: function(){
        //     //加载部门树
        //     $.get("http://localhost:8090/sys/dept/list", function(r){
        //         ztree = $.fn.zTree.init($("#deptTree"), setting, r);
        //         var node = ztree.getNodeByParam("deptId", vm.user.deptId);
        //         if(node != null){
        //             ztree.selectNode(node);
        //
        //             vm.user.deptName = node.name;
        //         }
        //     })
        // },
        update: function () {
            var userId = getSelectedRow();
            if(userId == null){
                return ;
            }

            vm.showList = false;
            vm.title = "修改";

            vm.getUser(userId);
            //获取角色信息
            this.getRoleList();
        },
        permissions: function () {
            var userId = getSelectedRow();
            if(userId == null){
                return ;
            }

            window.location.href="../sys/permissions/index/"+userId;
        },
        del: function () {
            var userIds = getSelectedRows();
            if(userIds == null){
                return ;
            }

            confirm('确定要删除选中的记录？', function(){
                $.ajax({
                    type: "POST",
                    url: "../sys/user/delete",
                    contentType: "application/json",
                    data: JSON.stringify(userIds),
                    success: function(r){
                        if(r.code == 0){
                            alert('操作成功', function(){
                                location.reload();
                            });
                        }else{
                            alert(r.msg);
                        }
                    }
                });
            });
        },
        saveOrUpdate: function () {
            var url = vm.user.userId == null ? "../sys/user/save" : "../sys/user/update";
            $.ajax({
                type: "POST",
                url:  url,
                contentType: "application/json",
                data: JSON.stringify(vm.user),
                success: function(r){
                    if(r.code === 0){
                        alert('操作成功', function(){
                            vm.reload();
                        });
                    }else{
                        alert(r.msg);
                    }
                }
            });
        },
        getUser: function(userId){
            $.get("../sys/user/info/"+userId, function(r){
                vm.user = r.user;
                vm.user.password = null;

                // vm.getDept();
            });
        },
        getRoleList: function(){
            $.get("../sys/role/select", function(r){
                vm.roleList = r.list;
            });
        },
        // deptTree: function(){
        //     layer.open({
        //         type: 1,
        //         offset: '50px',
        //         skin: 'layui-layer-molv',
        //         title: "选择部门",
        //         area: ['300px', '450px'],
        //         shade: 0,
        //         shadeClose: false,
        //         content: jQuery("#deptLayer"),
        //         btn: ['确定', '取消'],
        //         btn1: function (index) {
        //             var node = ztree.getSelectedNodes();
        //             //选择上级部门
        //             vm.user.deptId = node[0].deptId;
        //             vm.user.deptName = node[0].name;
        //
        //             layer.close(index);
        //         }
        //     });
        // },
        reload: function () {
            vm.showList = true;
            var page = $("#table").jqGrid('getGridParam','page');
            $("#table").jqGrid('setGridParam',{
                postData:{'username': vm.q.username},
                page:page
            }).trigger("reloadGrid");
        }
    }
});