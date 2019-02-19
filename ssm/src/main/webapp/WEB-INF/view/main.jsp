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
<!--布局-->
<body class="easyui-layout">
<div data-options="region:'north',title:'明锐教育',split:true" style="height:100px;">
    <center><font><h1>明锐教育管理系统</h1></font></center>
</div>
<div data-options="region:'south',title:'South Title',split:true" style="height:100px;">
    友情链接：
    <a href="#">QQ阅读</a>
    <a href="#">QQ阅读</a><nusp></nusp>
</div>
<div data-options="region:'east',iconCls:'icon-reload',title:'East',split:true" style="width:100px;">
    招商广告：
</div>
<div data-options="region:'west',title:'West',split:true" style="width:200px;">
    <ul id="tt" class="easyui-tree">
        <li>
            <span>明锐教育目录</span>
            <ul>
                <li>
                    <span>用户目录</span>
                    <ul>
                        <li>
                            <span><a href="javascript:queryUseraa('用户列表','http://localhost:8082/list.do')">学生信息列表</a></span>
                        </li>
                        <li>
                            <span><a href="#">百度搜索</a></span>
                        </li>
                        <li>
                            <span><a href="#">淘宝购物</a></span>
                        </li>
                    </ul>
                </li>
            </ul>
        </li>
    </ul>
</div>
<div data-options="region:'center',title:'欢迎 ${login}'" style="padding:5px;background:#eee;">
    <div id="首頁" class="easyui-tabs" style="width:500px;height:250px;" fit="true">
        <div title="主页" style="padding:20px;display:none;">
            <img src="<%=path%>/imgs/323007.jpg" alt="无法显示">
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    //跳转到展示页面
    function queryUseraa(title,url) {
        if($('#tabs').tabs("exists",title)){
            $('#tabs').tabs("getSelected");
        }else{
            // add a new tab panel
            $('#tabs').tabs('add',{
                title:title,
                content:'<iframe style="width:100%;height:100%;position:relative;" src="'+url+'" frameborder="0" scrolling="true" ></iframe>',
                closable:true,
                tools:[{
                    iconCls:'icon-mini-refresh',
                    handler:function(){
                        // 更新选择的面板的新标题和内容
                        var tab = $('#tabs').tabs('getSelected');  // 获取选择的面板
                        $('#tabs').tabs('update', {
                            tab: tab,
                            options: {

                            }
                        });
                    }
                }]
            });
        }
    }
</script>
</html>