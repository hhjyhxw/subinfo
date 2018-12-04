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
				<label class="layui-form-label">活动名称</label>
			    <div class="layui-input-inline" style="width:70%">
			        <input type="text" name="activityName" lay-verify="required" id="activityName" value="${(record.activityName)!}" placeholder="" autocomplete="off" class="layui-input">
		  		</div>
		  		<div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
		  	</div>

            <div class="layui-form-item">
                <label class="layui-form-label">开始时间</label>
                <div class="layui-input-inline" style="width:70%">
                    <input type="text" name="startTime" lay-verify="required" id="startTime" onclick="layui.laydate({elem: this, istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" value="${(record.startTime?string("yyyy-MM-dd HH:mm:ss"))!}" placeholder="限购开始时间" autocomplete="on" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">结束时间</label>
                <div class="layui-input-inline" style="width:70%">
                    <input type="text" name="endTime" lay-verify="required" id="endTime" onclick="layui.laydate({elem: this, istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" value="${(record.endTime?string("yyyy-MM-dd HH:mm:ss"))!}" placeholder="限购结束时间" autocomplete="on" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">状态</label>
                 <div class="layui-input-inline" style="width:70%">
                    <select name="status" lay-verify="required" id="status">
                        <option value="">--请选择--</option>
                        <option value="0" <#if (((record.status)!'') == '0')>selected="selected"</#if>>未开始</option>
                        <option value="1"  <#if (((record.status)!'') == '1')>selected="selected"</#if>>进行中</option>
                        <option value="2"  <#if (((record.status)!'') == '2')>selected="selected"</#if>>已结束</option>
                    </select>
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

                        if($("#activityName").val()==''){
                            alert("请输入类型名称");
                            return false;
                        }
					  $.ajax({
				           url:'${request.contextPath}/backpage/appointmentActivity/input',
                           type:'post',
                           data:$('#form').serialize(),
                           timeout : 10000,
                           async: false,
				           success:function(data) { 
				             if("0000"==data.code){
				             	alert("保存成功");
				                //layer.msg("保存成功",{time:2000});
				             	  window.location.href="${request.contextPath}/backpage/appointmentActivity/list";
				              }else{
				             	 alert("保存成功");
				                  //layer.msg(data.message,{time:2000})
				                  window.location.href="${request.contextPath}/backpage/appointmentActivity/list";
				            }
		                 },    
		                error : function(data) {
		                	alert("异常,请稍后!");
		                   //layer.msg("异常,请稍后!",{time:2000}); 
		                  window.location.href="${request.contextPath}/backpage/appointmentActivity/list";
		                }
					});
					return false;
			  })
		});

		layui.use('laydate', function(){
              var laydate = layui.laydate;

              var start = {
                min: laydate.now()
                ,max: '2099-06-16 23:59:59'
                ,istoday: false
                ,choose: function(datas){
                  end.min = datas; //开始日选好后，重置结束日的最小日期
                  end.start = datas //将结束日的初始值设定为开始日
                }
              };

              var end = {
                min: laydate.now()
                ,max: '2099-06-16 23:59:59'
                ,istoday: false
                ,choose: function(datas){
                  start.max = datas; //结束日选好后，重置开始日的最大日期
                }
              };
     });
	</script>
	</body>
</html>