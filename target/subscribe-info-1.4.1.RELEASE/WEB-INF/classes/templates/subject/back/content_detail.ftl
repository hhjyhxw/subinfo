<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>评论详情</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="format-detection" content="telephone=no">
		<link rel="stylesheet" href="${request.contextPath}/plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="${request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
	    <style>
		  img {
		    display: inline-block;
		    brecord: none;
		    width: 80px;
          }
		</style>
	</head>

	<body>
		<div style="margin: 15px;">
		<blockquote class="layui-elem-quote layui-quote-nm">
			 ${content.contents}
			  <br>————${content.nickName} &nbsp;${content.createTime?string('yyyy-MM-dd HH:mm:ss')}
		 </blockquote>
		<fieldset class="layui-elem-field">
		  <legend>配图</legend>
		  <div class="layui-field-box">
		      <#if content.imgUrls??>
		             
		      <#else>
		             无
		      </#if>
		  </div>
		</fieldset>
		<div>
    <button class="layui-btn layui-btn-sm <#if content.toTop=='1'>layui-btn layui-btn-disabled</#if>" <#if content.toTop=='1'>title="当前已为精华评论"<#else> onclick="content_totop('${content.id}')" </#if>>置为精华</button>
    <button class="layui-btn layui-btn-danger layui-btn-sm <#if content.status=='0'>layui-btn layui-btn-disabled</#if>" <#if content.status=='0'>title="当前评论已置为用户不可见" <#else> onclick="deleteContent('${content.id}');"</#if> >删除</button>
  </div>	
		</div>
		<script type="text/javascript" src="${request.contextPath}/plugins/layui/layui.js"></script>
		<script type="text/javascript" src="${request.contextPath}/js/jquery.min.js"></script>
		<script>
			layui.config({
				base: '${request.contextPath}/plugins/layui/modules/'
			});
			layui.use(['layer'], function() {
				var layer = parent.layer === undefined ? layui.layer : parent.layer;
			});
			
			function deleteContent(id){
			   layer.confirm('删除后该评论内容对用户不可见？', {
					  btn: ['删除','算了'] //按钮
					}, function(){
					   	 $.ajax({
				           url:'${request.contextPath}/backpage/subjectTopicContent/delete_content',
				           type:'post',
				           data:{"id":id},
				           success:function(data) { 
				               layer.msg('删除成功,该评论对用户已不可见',{time:2000})
                          },    
                        error : function() {    
                           layer.msg("异常！");    
                        } 
				      })
					}, function(){
					  layer.msg('已取消删除', {
					    time: 2000});
					});
			}
			function content_totop(id){
			   layer.confirm('精华帖可获得配置的奖励？', {
					  btn: ['确认','算了'] //按钮
					}, function(){
					   	 $.ajax({
				           url:'${request.contextPath}/backpage/subjectTopicContent/content_totop',
				           type:'post',
				           data:{"id":id},
				           success:function(data) { 
				               layer.msg('已置为精华,奖励自动发放',{time:2000})
                          },    
                        error : function() {    
                           layer.msg("异常！");    
                        } 
				      })
					}, function(){
					  layer.msg('已取消', {
					    time: 2000});
					});
			}
			<#if content.imgUrls==''>
			 var arr = [];
			<#else>
			 var arr = ${content.imgUrls};
			 </#if>
			 var contentPath = "${request.contextPath}";
			 var photos = new Array();
			$(document).ready(function(){
				var str = '';
				for(j = 0,len=arr.length; j < len; j++) {
	                 str +='<img src="'+contentPath+ arr[j]+'" title="点击查看大图" onclick="viewBigImg();">';
	                 var data = new Object();
	                 data.alt=j;
	                 data.pid=j;
	                 data.src=contentPath+ arr[j];
	                 data.thumb=arr[j];
	                 photos.push(data);
	                 
	            }
	            $('.layui-field-box').html(str);
			})
			function viewBigImg(){
			    var photo = new Object();
			    photo.title='配图';
			    photo.id='1';
			    photo.start=0;
			    photo.data=photos;
			     layer.photos({
				    photos: photo
				    ,anim: 5 
				  });
			}
			
		</script>
	</body>

</html>