<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>征集主题</title>
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
				<legend>主题<#if topic??>修改<#else>添加</#if></legend>
			</fieldset>

			<form class="layui-form" action="" id="form">
			   <#if topic??><input type="hidden" name="id" value="${(topic.id)!''}"></#if>
				<div class="layui-form-item">
					<label class="layui-form-label">征集主题</label>
					<div class="layui-input-block">
						<input type="text" name="topicName" <#if topic??>value="${topic.topicName}" </#if>  lay-verify="required" autocomplete="off" placeholder="请输入征集主题" class="layui-input" style="width:190px;">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">期数</label>
					<div class="layui-input-block">
						<input type="number" name="periods" <#if topic??>value="${topic.periods}" </#if>  lay-verify="required" autocomplete="off" placeholder="当前期数" class="layui-input" style="width:190px;">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">开始时间</label>
					<div class="layui-input-block">
						 <input class="layui-input" placeholder="开始时间" id="LAY_demorange_s" name="startTime" <#if topic??>value="${topic.startTime?string('yyyy-MM-dd HH:mm:ss')}"</#if> lay-verify="required">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">结束时间</label>
					<div class="layui-input-block">
					 <input class="layui-input" placeholder="结束时间" id="LAY_demorange_e" name="endTime" <#if topic??>value="${topic.endTime?string('yyyy-MM-dd HH:mm:ss')}"</#if> lay-verify="required" >
					</div>
				</div>
				<#if topic??>
				<div class="layui-form-item">
					<label class="layui-form-label">状态</label>
					<div class="layui-input-block">
					<select name="status" lay-verify="">
					  <option value="0" <#if topic.status=='0'>selected</#if>>未开始</option>
					  <option value="1" <#if topic.status=='1'>selected</#if>>进行中</option>
					  <option value="2" <#if topic.status=='2'>selected</#if>>结束</option>
					</select>    
					</div>
				</div>
				</#if>
				<div class="layui-form-item layui-form-text">
				    <label class="layui-form-label">征集详情描述</label>
				    <div class="layui-input-block">
				      <textarea class="layui-textarea layui-hide" name="topicDetail" lay-verify="content" id="LAY_demo_editor"><#if topic??>${topic.topicDetail!''}</#if></textarea>
				    </div>
				  </div>
				<div class="layui-form-item">
					<label class="layui-form-label">预览图片</label>
				<div class="site-demo-upload">
				  <img id="LAY_demo_upload" width="640px" height="278px" <#if topic??> src="${request.contextPath}/${(topic.topicUrl)!''}" </#if>>
				  <input type="hidden" name="topicUrl"  <#if topic??>value="${(topic.topicUrl)!''}"</#if> id="LAY_IMG_URL">
              </div>
               <div class="layui-form-mid layui-word-aux" style="float:right;margin-right:950px;"><span style="color:red;text-align:center;">图片建议640x278 px;大小1M,图片名称不带中文</span></div>
				</div>
			  	<div class="layui-form-item">
					<label class="layui-form-label">添加图片</label>
				<div class="site-demo-upload">
				   <input type="file" name="file" lay-type="images" width="90px" class="layui-upload-file">
              </div>
			</div>
				<div class="layui-form-item">
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
				 layui.upload({
				    url: '${request.contextPath}/backpage/upload/uploadGoodsImage'
				    ,method: 'post' //上传接口的http类型
				    ,success: function(res){
				      if(res.code!='0'){
				         layer.msg(res.msg,{time:2000})
				         return ;
				       }
				      LAY_demo_upload.src = "${request.contextPath}"+res.data.src;
				      LAY_IMG_URL.value=res.data.src;
				    }
  });	
                layedit.set({ uploadImage: {
				    url: '${request.contextPath}/backpage/upload/uploadFileImageEdit' //接口url
				    ,type: 'post' //默认post
				  }});
                var editIndex = layedit.build('LAY_demo_editor');
                var start = {
				    min: '1900-01-01'
				    ,max: '2099-06-16'
				    ,istoday: true
				    ,istime: true
				    , format: 'YYYY-MM-DD hh:mm:ss'
				    ,choose: function(datas){
				      end.min = datas; //开始日选好后，重置结束日的最小日期
				      end.start = datas //将结束日的初始值设定为开始日
				    }
				  };
				  
				  var end = {
				    min: '1900-01-01'
				    ,max: '2099-06-16'
				    ,istoday: true
				    ,istime: true
				    , format: 'YYYY-MM-DD  hh:mm:ss'
				    ,choose: function(datas){
				      start.max = datas; //结束日选好后，重置开始日的最大日期
				    }
				  };
				   document.getElementById('LAY_demorange_s').onclick = function(){
				    start.elem = this;
				    laydate(start);
				  }
				  document.getElementById('LAY_demorange_e').onclick = function(){
				    end.elem = this
				    laydate(end);
				  }
				//监听提交
				form.on('submit(demo1)', function(data) {
				      layedit.sync(editIndex);
					   $.ajax({
				           url:'${request.contextPath}/backpage/collectTopic/collect_save',
				           type:'post',
				           data:$('#form').serialize(),
				           success:function(data) { 
				             if("0000"==data.code){
				               layer.msg('添加成功',{time:2000})
				               setTimeout(function(){window.location="${request.contextPath}/backpage/collectTopic/collect_list"},500);
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