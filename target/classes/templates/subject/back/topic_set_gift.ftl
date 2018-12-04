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
				<legend>话题评论奖励设置</legend>
			</fieldset>
		<form class="layui-form" action="" id="form">
			   <input type="hidden" name="topicId" value="${(topicId)!''}">
				<div class="layui-form-item">
					<label class="layui-form-label">评论奖励</label>
					<div class="layui-input-inline">
					<select name="pinglunPrize" lay-verify="">
					<option value="">不设置奖励</option>
					<#list gifts as gift>
					    <option value="${gift.id}" <#if pinglunPrize??><#if pinglunPrize.giftId==gift.id>selected</#if></#if>>${gift.giftName}</option>
					</#list>
					</select>    
					</div>
				</div>
			
			   <div class="layui-form-item">
					<label class="layui-form-label">精华奖励</label>
					<div class="layui-input-inline">
					<select name="jinghuaPrize" lay-verify="">
					<option value="">不设置奖励</option>
					<#list gifts as gift>
					    <option value="${gift.id}" <#if jinghuaPrize??><#if jinghuaPrize.giftId==gift.id>selected</#if></#if>>${gift.giftName}</option>
					</#list>
					</select>    
					</div>
				</div>
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
				<legend>评论点赞奖励设置</legend>
			</fieldset>
			 <a href="javascript:void(0);" class="layui-btn  layui-btn-normal layui-btn-small" id="addRankPrize">添加排名奖励</a>
					  <hr> 
			<#list thumbsPrizeList as prize>
			       <div class="layui-form-item  rank">
					<label class="layui-form-label">点赞排名第${prize_index+1}</label>
					<div class="layui-input-inline">
					<select name="starPrize" lay-verify="">
					<option value="">不设置奖励</option>
						<#list gifts as gift>
						    <option value="${gift.id}" <#if prize.giftId==gift.id>selected</#if>>${gift.giftName}</option>
						</#list>
					</select>    
					</div>
					<a class="layui-btn layui-btn-primary layui-btn-small" onclick="delRankPrize($(this));">删除</a>
				</div>
			</#list>
			
			
			
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
				           url:'${request.contextPath}/backpage/subjectPrize/prize_set_save',
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
				window.getStr=function(i){
			        var str = '<div class="layui-form-item  rank"><div class="layui-inline">';
						str +=' <label class="layui-form-label">排名'+i+'</label>'
						str += '<div class="layui-input-inline">'
						str += '<select name="starPrize" lay-verify="">'
						str += '<option value="">不设置奖励</option>'
								<#list gifts as gift>
						str += '<option value="${gift.id}" >${gift.giftName}</option>'
								</#list>
						str += '</select>'    
						str += '</div>'
						str  += '<a class="layui-btn layui-btn-primary layui-btn-small" onclick="delRankPrize($(this));">删除</a> ' ;
						str += '</div></div>';
						return str;
				}	    
		
				 $('#addRankPrize').on('click',function(){
				    var i = $('.rank').length;
				    var str = getStr(++i);
                    $('.button').before(str);
                    form.render('select');
                 }) 
                 
                 window.delRankPrize=function(othis){othis.closest('.layui-form-item').remove();}
				
			});
		</script>
	</body>

</html>