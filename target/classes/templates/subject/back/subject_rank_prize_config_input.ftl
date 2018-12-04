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
				<label class="layui-form-label">等级名称</label>
			    <div class="layui-input-inline" style="width:70%">
			        <input type="text" name="levelName" lay-verify="required" id="levelName" value="${(record.levelName)!}" placeholder="" autocomplete="off" class="layui-input">
		  		</div>
		  		<div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
		  	</div>
		  	<div class="layui-form-item">
				<label class="layui-form-label">等级值</label>
			    <div class="layui-input-inline" style="width:70%">
			        <input type="text" name="randLevel" lay-verify="required" id="strategyType" value="${(record.randLevel)!}" placeholder="" autocomplete="off" class="layui-input"
			        >
		  		</div>
		  		<div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
		  	</div>
		  	<div class="layui-form-item">
                <label class="layui-form-label">最小区间值</label>
                <div class="layui-input-inline" style="width:70%">
                    <input type="text" name="minValue" lay-verify="required" id="minValue" value="${(record.minValue)!}" placeholder="" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">最大区间值</label>
                <div class="layui-input-inline" style="width:70%">
                    <input type="number" name="maxValue" lay-verify="required" id="maxValue" value="${(record.maxValue)!}" placeholder="" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">奖励设置</label>
                <div class="layui-input-inline">
                <select name="giftId" lay-verify="required">
                <option value="">请选择</option>
                <#list gifts as gift>
                    <option value="${gift.id}" <#if (record??) && (record.giftId??) ><#if record.giftId==gift.id>selected</#if></#if>>${gift.giftName}</option>
                </#list>
                </select>
                </div>
            </div>
             <div class="layui-form-item">
                <label class="layui-form-label">所属排行类型</label>
                <div class="layui-input-inline">
                <select name="rankTypeId" lay-verify="required">
                <option value="">请选择</option>
                <#list subjectRankTypeList as subjectRankType>
                    <option value="${subjectRankType.id}" <#if (record??) && (record.rankTypeId??)><#if record.rankTypeId==subjectRankType.id>selected</#if></#if>>${subjectRankType.typeName}</option>
                </#list>
                </select>
                </div>
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

			  	var regex = /^([\d]+(\.\d{1,2})?$)|^([1-9]+)$/;

					  $.ajax({
				           url:'${request.contextPath}/backpage/subjectRankPrizeConfig/input',
				           type:'post',
				           data:$('#form').serialize(),
				           timeout : 10000,
				           async: false,
				           success:function(data) { 
				             if("0000"==data.code){
				             	alert("保存成功");
				                //layer.msg("保存成功",{time:2000});
				             	  window.location.href="${request.contextPath}/backpage/subjectRankPrizeConfig/list";
				              }else{
				             	 alert("保存成功");
				                  //layer.msg(data.message,{time:2000})
				                  window.location.href="${request.contextPath}/backpage/subjectRankPrizeConfig/list";
				            }
		                 },    
		                error : function(data) {
		                	alert("异常,请稍后!");
		                   //layer.msg("异常,请稍后!",{time:2000}); 
		                  window.location.href="${request.contextPath}/backpage/subjectRankPrizeConfig/list";
		                }
					});
					return false;
			  })
		});
		
	</script>
	</body>
</html>