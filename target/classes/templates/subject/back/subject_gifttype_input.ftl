<!doctype html>
<html>

	<head>
		<meta charset="utf-8">
		<title><#if (record.id)??>编辑<#else>添加</#if></title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="format-detection" content="telephone=no">
		<link rel="stylesheet" href="${request.contextPath}/plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="${request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
	</head>

	<body>
	<form class="layui-form" action="" name="actionForm" method="POST" enctype="multipart/form-data" id="form">
		<input type="hidden" name="id" value="${(record.id)!}">
		<fieldset class="layui-elem-field" style="width: 60%; text-align: center; margin-left: 20%;">
			<legend><#if (record.id)??>编辑<#else>添加</#if></legend>
			<div class="layui-form-item">
		  	</div>
  			<div class="layui-form-item">
				<label class="layui-form-label">分类名称</label>
			    <div class="layui-input-inline" style="width:70%">
			        <input type="text" name="giftName" lay-verify="" id="giftName" value="${(record.giftName)!}" placeholder="" autocomplete="off" class="layui-input">
		  		</div>
		  		<div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
		  	</div>
		  	<div class="layui-form-item">
				<label class="layui-form-label">分类代号</label>
			    <div class="layui-input-inline" style="width:70%">
			        <input type="text" name="giftCode" lay-verify="" id="giftCode" value="${(record.giftCode)!}" placeholder="" autocomplete="off" class="layui-input" readonly="readonly">
		  		</div>
		  		<div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
		  	</div>
		  	 <div class="layui-form-item">
			  	<label class="layui-form-label">分类排序</label>
			    <div class="layui-input-inline" style="width:70%">
			        <input type="number" name="sortNum" lay-verify="" value="${(record.sortNum?c)!'99999'}"  id="sortNum" placeholder="0" autocomplete="off" class="layui-input">
		  		</div>
		  		<div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
		  	</div>
		  	<div class="layui-form-item">
			    <label class="layui-form-label">设置状态</label>
			    <div class="layui-input-inline" style="width:70%">
			      	<select name="status" lay-verify="" id="status">
			      		<option value="1" <#if (((record.status)!'') == '1')>selected="selected"</#if>>使用</option>
				  		<option value="0" <#if (((record.status)!'') == '0')>selected="selected"</#if>>停用</option>
			      	</select>
		  		</div>
		  		<div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
		  	</div>
		  	<div class="layui-form-item">
				<label class="layui-form-label">调用接口</label>
			    <div class="layui-input-inline" style="width:70%">
			        <input type="text" name="prizeClassName" lay-verify="" id="prizeClassName" value="${(record.prizeClassName)!}" placeholder="" autocomplete="off" class="layui-input"
			        	<#if (record?? && (record.id)??)>readonly="readonly"</#if>>
		  		</div>
		  		<div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
		  	</div>
		  	<div class="layui-form-item">
			    <div class="layui-input-block">
					<button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
				    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
			    </div>
		  	</div>
		</fieldset>
	</form>
	
	<script type="text/javascript" src="${request.contextPath}/plugins/layui/layui.js"></script>
	<script type="text/javascript" src="${request.contextPath}/js/jquery.min.js"></script>
	<script>
		layui.use(['form','jquery','upload','layer'], function() {
				var form = layui.form(),
					layer = layui.layer;
			  //监听提交
			  form.on('submit(formDemo)', function(data){
			  	if($("#status").val()==''){
			  		alert("请选择是否使用");
					return false;
			  	}
			  	var regex = /^([\d]+(\.\d{1,2})?$)|^([1-9]+)$/;
			  	if($("#giftName").val()==''){
			  		alert("请输入分类名称");
					return false;
			  	}
					  $.ajax({
				           url:'${request.contextPath}/backpage/subjectGifttype/input',
				           type:'post',
				           data:$('#form').serialize(),
				           timeout : 10000,
				           async: false,
				           success:function(data) { 
				             if("0000"==data.code){
				             	alert("保存成功");
				                //layer.msg("保存成功",{time:2000});
				             	  window.location.href="${request.contextPath}/backpage/subjectGifttype/list";
				              }else{
				             	 alert("保存成功");
				                  //layer.msg(data.message,{time:2000})
				                  window.location.href="${request.contextPath}/backpage/subjectGifttype/list";
				            }
		                 },    
		                error : function(data) {
		                	alert("异常,请稍后!");
		                   //layer.msg("异常,请稍后!",{time:2000}); 
		                  window.location.href="${request.contextPath}/backpage/subjectGifttype/list";  
		                }
					});
					return false;
			  })
		});
		
	</script>
	</body>
</html>