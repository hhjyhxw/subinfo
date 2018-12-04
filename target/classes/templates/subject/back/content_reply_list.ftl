<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>layui</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="${request.contextPath}/plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="${request.contextPath}/css/global.css" media="all">
		<link rel="stylesheet" href="${request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="${request.contextPath}/css/table.css" />
</head>
<body>
            

<#list list as content>
    <blockquote class="layui-elem-quote layui-quote-nm">
		  ${content.contents}
		  <br>——${content.nickName} &nbsp;${content.createTime?string('yyyy-MM-dd HH:mm:ss')}
		</blockquote>
    <blockquote class="layui-elem-quote"></blockquote> 
</#list> 

 

 

 

             
          
<script type="text/javascript" src="${request.contextPath}/plugins/layui/layui.js"></script>
<script type="text/javascript" src="${request.contextPath}/js/jquery.min.js"></script>
</body>
</html>