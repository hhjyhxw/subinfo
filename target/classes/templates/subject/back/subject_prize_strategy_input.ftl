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
				<label class="layui-form-label">类型名称</label>
			    <div class="layui-input-inline" style="width:70%">
			        <input type="text" name="strategyName" lay-verify="required" id="strategyName" value="${(record.strategyName)!}" placeholder="" autocomplete="off" class="layui-input">
		  		</div>
		  		<div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
		  	</div>
		  	<div class="layui-form-item">
				<label class="layui-form-label">类型值</label>
			    <div class="layui-input-inline" style="width:70%">
			        <input type="text" name="strategyType" lay-verify="required" id="strategyType" value="${(record.strategyType)!}" placeholder="" autocomplete="off" class="layui-input"
			        <#if (record?? && (record.id)??)>readonly="readonly"</#if>>
		  		</div>
		  		<div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
		  	</div>
		  	 <div class="layui-form-item">
			  	<label class="layui-form-label">业务处理类</label>
			    <div class="layui-input-inline" style="width:70%">
                    <input type="text" name="className" lay-verify="required" id="className" value="${(record.className)!}" placeholder="" autocomplete="off" class="layui-input"
                    <#if (record?? && (record.id)??)>readonly="readonly"</#if>>
                </div>
                <div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
		  	</div>
		  	<div class="layui-form-item">
                <label class="layui-form-label">每次获取积分值</label>
                <div class="layui-input-inline" style="width:70%">
                    <input type="text" name="score" lay-verify="required" id="score" value="${(record.score)!0}" placeholder="" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux"><span style="color:red;">(配置奖该字段无效)*</span></div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">奖励设置</label>
                <div class="layui-input-inline">
                <select name="giftId">
                <option value="">请选择</option>
                <#list gifts as gift>
                    <option value="${gift.id}" <#if (record??) && (record.giftId??) ><#if record.giftId==gift.id>selected</#if></#if>>${gift.giftName}</option>
                </#list>
                </select>
                </div>
                 <div class="layui-form-mid layui-word-aux"><span style="color:red;">(贡献值奖，该字段无效；配置奖先读对应话题配置，再都该配置)*</span></div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">每天(或者每个事件)获取得次数上限</label>
                <div class="layui-input-inline" style="width:70%">
                    <input type="number" name="dayLimitTime" lay-verify="required" id="score" value="${(record.dayLimitTime)!0}" placeholder="" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux"><span style="color:red;">小于等于0不限制*</span></div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">每天获取得总额上限</label>
                <div class="layui-input-inline" style="width:70%">
                    <input type="number" name="totaolLimit" lay-verify="" id="score" value="${(record.totaolLimit)!}" placeholder="" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux"><span style="color:red;">小于等于0不限制(配置奖该字段无效)*</span></div>
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

			  	if($("#strategyName").val()==''){
			  		alert("请输入类型名称");
					return false;
			  	}
					  $.ajax({
				           url:'${request.contextPath}/backpage/subjectPrizeStrategy/input',
				           type:'post',
				           data:$('#form').serialize(),
				           timeout : 10000,
				           async: false,
				           success:function(data) { 
				             if("0000"==data.code){
				             	alert("保存成功");
				                //layer.msg("保存成功",{time:2000});
				             	  window.location.href="${request.contextPath}/backpage/subjectPrizeStrategy/list";
				              }else{
				             	 alert("保存成功");
				                  //layer.msg(data.message,{time:2000})
				                  window.location.href="${request.contextPath}/backpage/subjectPrizeStrategy/list";
				            }
		                 },    
		                error : function(data) {
		                	alert("异常,请稍后!");
		                   //layer.msg("异常,请稍后!",{time:2000}); 
		                  window.location.href="${request.contextPath}/backpage/subjectPrizeStrategy/list";
		                }
					});
					return false;
			  })
		});
		
	</script>
	</body>
</html>