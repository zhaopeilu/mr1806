<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>HelloWorld</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-easyui/jquery.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-easyui/jquery.easyui.min.js"></script>
    <link rel="stylesheet" type="text/css"
          href="<%=request.getContextPath() %>/js/jquery-easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/js/jquery-easyui/themes/icon.css">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
</head>
<body>
<table id="dg"></table>
<div id="dd">
    <form id="ff" method="post">
        <div>
            <label for="name">Name:</label>
            <input class="easyui-validatebox" type="hidden" name="userId"  />
            <input class="easyui-validatebox" type="text" name="userName"  />
        </div>
        <div>
            <label for="email">Age:</label>
            <input class="easyui-validatebox" type="text" name="userAge" />
        </div>
        <div>
            <label for="email">Bir:</label>
            <input class="easyui-validatebox" type="text" name="userBir" />

        </div>
        <div>
            <label for="email">Img:</label>
            <input class="easyui-validatebox" type="text" name="userImg" />
        </div>
    </form>
</div>
<script type="text/javascript">
    $('#dg').datagrid({
        url:'<%=request.getContextPath()%>/user/queryAll.do',
        fit:true,
        columns:[[
            {field:'userId',title:'编号',width:100},
            {field:'userName',title:'名称',width:100},
            {field:'userAge',title:'年龄',width:100,align:'right'},
            {field:'userBir',title:'日期',width:100,align:'right'},
            {field:'userImg',title:'头像',width:100,align:'right'}
        ]],
        pagination:true,
        pageSize:10,
        pageList:[10,20,30,40,50],
        toolbar: [{
            text:"新增",
            iconCls: 'icon-edit',
            handler: function(){
                insertDong();
            }
        },'-',{
            text:"删除",
            iconCls: 'icon-help',
            handler: function(){
                delectUser();
            }
        },'-',{
            text:"修改",
            iconCls: 'icon-help',
            handler: function(){
                updateDialog();
            }
        }],
    });
    //新增弹框
    function insertDong() {
        $('#dd').dialog({
            title: '新增用户',
            width: 400,
            height: 200,
            closed: false,
            cache: false,
            modal: true,
            //提交按钮
            toolbar: [{
                iconCls: 'icon-edit',
                handler: function(){
                    addUser();
                }
            },'-',{
                iconCls: 'icon-help',
                handler: function(){
                    //关闭弹框
                    $('#dd').dialog('close');
                    //表单重置
                    $('#ff').form('resert');
                }
            }]
        });

    }
    //新增表单
    function addUser() {
        // 显示进度条
        $.messager.progress();
        $('#ff').form('submit', {
            url: '<%=request.getContextPath()%>/user/addUser.do',
            onSubmit: function(){
                var isValid = $(this).form('validate');
                if (!isValid){
                    // 如果表单是无效的则隐藏进度条
                    $.messager.progress('close');
                }
                // 返回false终止表单提交
                return isValid;
            },
            success: function(){
                //提交成功则隐藏进度条
                $.messager.progress('close');
                //成功后关闭弹框
                $('#dd').dialog('close');
                $('#ff').form('resert');
                $('#dg').datagrid('reload');
            }
        });
    }
    //删除信息
    function delectUser() {
        var id = $('#dg').datagrid("getSelected").userId;
        $.ajax({
            type:'post',
            url:'<%=request.getContextPath()%>/user/delectUser.do',
            data:{
                id:id
            },
            success:function(data){
                //成功后刷新表格
                $('#dg').datagrid('reload');
            },
            //错误回调函数
            error:function(){
                alert("删除失败");
            }
        })
    }
    //修改弹框
    function updateDialog() {
        //获取表格信息
        var user= $('#dg').datagrid("getSelected");
        //回显表单信息
        $('#ff').form('load',{
            userId:user.userId,
            userName:user.userName,
            userAge:user.userAge,
            userBir:user.userBir,
            userImg:user.userImg,
        });
        $('#dd').dialog({
            title: '修改用户',
            width: 400,
            height: 200,
            closed: false,
            cache: false,
            modal: true,
            //提交按钮
            toolbar: [{
                iconCls: 'icon-edit',
                handler: function(){
                    updateUser();
                }
            },'-',{
                iconCls: 'icon-no',
                handler: function(){
                    //关闭弹框
                    $('#dd').dialog('close');
                    //表单重置
                    $('#ff').form('resert');
                }
            }]
        });
    }
    //修改提交表单
    function updateUser() {
        // 显示进度条
        $.messager.progress();
        $('#ff').form('submit', {
            url: '<%=request.getContextPath()%>/user/updateUser.do',
            onSubmit: function(){
                var isValid = $(this).form('validate');
                if (!isValid){
                    // 如果表单是无效的则隐藏进度条
                    $.messager.progress('close');
                }
                // 返回false终止表单提交
                return isValid;
            },
            success: function(){
                //提交成功则隐藏进度条
                $.messager.progress('close');
                //成功后关闭弹框
                $('#dd').dialog('close');
                $('#ff').form('resert');
                $('#dg').datagrid('reload');
            }
        });
    }
</script>
</body>
</html>