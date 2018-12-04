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
				<label class="layui-form-label">广告名称</label>
			    <div class="layui-input-inline" style="width:70%">
			        <input type="text" name="adName" lay-verify="required" id="adName" value="${(record.adName)!}" placeholder="" autocomplete="off" class="layui-input">
		  		</div>
		  		<div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
		  	</div>
		  	<div class="layui-form-item">
				<label class="layui-form-label">跳转地址</label>
			    <div class="layui-input-inline" style="width:70%">
			        <input type="text" name="addJumpurl" lay-verify="required" id="addJumpurl" value="${(record.addJumpurl)!}" placeholder="" autocomplete="off" class="layui-input">
		  		</div>
		  		<div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
		  	</div>
		  	<div class="layui-form-item">
			  	<label class="layui-form-label">广告位置</label>
			     <div class="layui-input-inline" style="width:70%">
			      	<select name="posittionId" lay-verify="required" id="posittionId">
			      		<option value="">--请选择--</option>
			      		<#if positionList??>
				      		<#list positionList as adPosition>
				      			<option value="${adPosition.id?c}"  <#if (record.posittionId)?? && record.posittionId==adPosition.id>selected="selected"</#if>>${adPosition.positionName}</option>
				      		</#list>
				      	</#if>
			      	</select>
		  		</div>
		  		<div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
		  	</div>
		  	 <div class="layui-form-item">
			  	<label class="layui-form-label">排序</label>
			    <div class="layui-input-inline" style="width:70%">
			        <input type="number" name="sortNum" lay-verify="required|number" value="${(record.sortNum?c)!'99999'}"  id="sortNum" placeholder="0" autocomplete="off" class="layui-input">
		  		</div>
		  		<div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
		  	</div>
		  	<div class="layui-form-item">
			    <label class="layui-form-label">设置状态</label>
			    <div class="layui-input-inline" style="width:70%">
			      	<select name="status" lay-verify="required" id="status">
			      		<option value="1" <#if (((record.status)!'') == '1')>selected="selected"</#if>>使用</option>
				  		<option value="0" <#if (((record.status)!'') == '0')>selected="selected"</#if>>停用</option>
			      	</select>
		  		</div>
		  		<div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
		  	</div>
		  	
		  	
		  	<div class="layui-form-item">
				<label class="layui-form-label">预览图片</label>
				<div class="site-demo-upload">
				  <img id="LAY_demo_upload" width="640px" height="307px" <#if record??> src="${request.contextPath}/${(record.adImgurl)!''}" </#if>>
				  <input type="hidden" name="adImgurl"  <#if record??>value="${(record.adImgurl)!''}"</#if> id="LAY_IMG_URL">
              </div>
              <div class="layui-form-mid layui-word-aux" style="float:right;margin-right:450px;"><span style="color:red;text-align:center;">图片建议640x307 px;大小1M,图片名称不带中文</span></div>
			</div>
			 <div class="layui-form-item">
				<label class="layui-form-label">添加图片</label>
				<div class="site-demo-upload">
				   <input type="file" name="file" lay-type="images" width="90px" class="layui-upload-file">
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
					
				//上传图片
				layui.upload({
				    url: '${request.contextPath}/backpage/upload/uploadGoodsImage'
				    ,method: 'post' //上传接口的http类型
				    ,success: function(res){
				      if(res.code!='0'){
				         layer.msg(res.msg,{time:2000})
				         return ;
				       }
				      LAY_demo_upload.src = "${request.contextPath}/"+res.data.src;
				      LAY_IMG_URL.value=res.data.src;
					}
				 });
				
					
			  //监听提交
			  form.on('submit(formDemo)', function(data){
					  $.ajax({
				           url:'${request.contextPath}/backpage/subjectAd/input',
				           type:'post',
				           data:$('#form').serialize(),
				           timeout : 10000,
				           async: false,
				           success:function(data) { 
				             if("0000"==data.code){
				             	alert("保存成功");
				                //layer.msg("保存成功",{time:2000});
				             	  window.location.href="${request.contextPath}/backpage/subjectAd/list";
				              }else{
				             	 alert("保存成功");
				                  //layer.msg(data.message,{time:2000})
				                  window.location.href="${request.contextPath}/backpage/subjectAd/list";
				            }
		                 },    
		                error : function(data) {
		                	alert("异常,请稍后!");
		                   //layer.msg("异常,请稍后!",{time:2000}); 
		                  window.location.href="${request.contextPath}/backpage/subjectAd/list";  
		                }
					});
					return false;
			  })
		});
		
	</script>
	</body>
</html>