<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>话题奖励设置</title>
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
		<div style="margin: 15px;">
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
				<legend>征集奖励设置</legend>
			</fieldset>
		  <form class="layui-form" action="" id="form">
			   <input type="hidden" name="topicId" value="${(topicId)!''}">
				<div class="layui-form-item">
					<label class="layui-form-label">选中奖励</label>
					<div class="layui-input-inline">
					<select name="collectPrize" lay-verify="">
					<option value="">不设置奖励</option>
					<#list gifts as gift>
					    <option value="${gift.id}" <#if collectPrize??><#if collectPrize.giftId==gift.id>selected</#if></#if>>${gift.giftName}</option>
					</#list>
					</select>    
					</div>
				</div>
			
				<div class="layui-form-item button">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
						<button type="reset" class="layui-btn layui-btn-primary">重置</button>
					    <a href="javascript:history.go(-1);" class="layui-btn">返回</a>
					</div>
				</div>
			</form>

		</div>
		<script type="text/javascript" src="${request.contextPath}/plugins/layui/layui.js"></script>
		<script type="text/javascript" src="${request.contextPath}/js/jquery.min.js"></script>
		<script>
		
			layui.use(['form','jquery','upload','layedit','laydate'], function() {
				var form = layui.form(),
					layer = layui.layer;
					layedit = layui.layedit;
				 
				//监听提交
				form.on('submit(demo1)', function(data) {
					   $.ajax({
				           url:'${request.contextPath}/backpage/subjectPrize/collect_set_save',
				           type:'post',
				           data:$('#form').serialize(),
				           success:function(data) { 
				             if("0000"==data){
				                  layer.msg('保存成功',{time:2000})
				              }else{
				                  layer.msg(data.message,{time:2000})
				            }
                         },    
                        error : function() {    
                           layer.msg("异常！");    
                        } 
				 })
					return false;
				});
			});
		</script>
	</body>

</html>