<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>话题列表</title>
		<link rel="stylesheet" href="${request.contextPath}/plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="${request.contextPath}/css/global.css" media="all">
		<link rel="stylesheet" href="${request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="${request.contextPath}/css/table.css" />
		<style>
		  img {
		    display: inline-block;
		    brecord: none;
		    width: 20px;
          }
		</style>
	</head>

	<body>
		<div class="admin-main">
          <form id="form" action="${request.contextPath}/backpage/subjectTopic/topic_list" method="post">
			<blockquote class="layui-elem-quote">
		                    话题名称：<div class="layui-input-inline"><input type="text" name="topicName" value="${(record.topicName)!''}" id="topicName" /></div>
		                   期数：<div class="layui-input-inline"><input type="text" name="periods" value="${(record.periods)!''}" id="periods" /></div>           
		                   话题状态：  <div class="layui-input-inline"> 
		        <select name="status" id="status">
					  <option value="" >全部</option>
					  <option value="0" <#if record.status?? && record.status=='0'>selected</#if>>未开始</option>
					  <option value="1" <#if record.status?? && record.status=='1'>selected</#if>>进行中</option>
					  <option value="2" <#if record.status?? && record.status=='2'>selected</#if>>已结束</option>
                </select>
                </div>
                          
		       <a href="javascript:;" class="layui-btn layui-btn-small" id="search">
					<i class="layui-icon">&#xe615;</i> 搜索
				</a>
				 <a href="${request.contextPath}/backpage/subjectTopic/topic_add" class="layui-btn layui-btn-small" id="search">
					<i class="layui-icon">&#xe61f;</i> 创建话题
				</a>
			</blockquote>
			</form>	
			<fieldset class="layui-elem-field">
				<legend>话题列表</legend>
				<div class="layui-field-box">
					<table class="site-table table-hover">
						<thead>
							<tr>
							    <th>期数</th>
								<th>话题名称</th>
								<th>支持人数</th>
								<th>反对人数</th>
								<th>开始时间</th>
								<th>结束时间</th>
								<th>状态</th>
								<th>创建人</th>
								<th>创建时间</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
						<#list page.list as record>
						    <tr>
						         <td>${(record.periods)!''}</td>
								<td>${(record.topicName)!''}</td>
								<td>${(record.agreeCount)!'0'}</td>
								<td>${(record.disagreeCount)!'0'}</td>
								<td>${record.startTime?string("yyyy-MM-dd HH:mm:ss")}</td>
								<td>
                                 ${record.endTime?string("yyyy-MM-dd HH:mm:ss")}
                                </td>
                                <td>
                                    <#if record.status=='0'>
                                                                                               未开始
                                    </#if>
                                    <#if record.status=='1'>
                                                                                             进行中
                                    </#if>
                                      <#if record.status=='2'>
                                      已结束
                                    </#if>
                                </td>
								<td> ${record.createOperator}</td>
								
                                		<td>
                                    ${record.createTime?string("yyyy-MM-dd HH:mm:ss")}
                                </td>
								<td>
								<div class="layui-btn-group">
								
									<a href="${request.contextPath}/backpage/subjectTopic/topic_edit?id=${record.id}"  class="layui-btn layui-btn-mini">详情</a>
								<#--	<#if record.status=='0'>
									<a href="javascript:changeStatus('${record.id}','1');"  class="layui-btn layui-btn-mini" title="开始本次话题的讨论">开始</a>
									</#if>
									<#if record.status=='1'>
									 <a href="javascript:changeStatus('${record.id}','2');"  class="layui-btn layui-btn-danger layui-btn-mini " title="结束本次话题的讨论">结束</a>
									</#if>
									-->
									<a href="${request.contextPath}/backpage/subjectTopicContent/content_list?topicId=${record.id}&parentId=0"  class="layui-btn layui-btn-mini">评论列表</a>
									
									<a href="${request.contextPath}/backpage/subjectPrize/topic_set_gift?topicId=${record.id}"  class="layui-btn layui-btn-mini">奖励设置</a>
								</div>    
								</td>
							</tr>
						</#list>
						</tbody>
					</table>

				</div>
			</fieldset>
			<div class="admin-table-page">
				<div id="page" class="page">
				</div>
			</div>
		</div>
		<script type="text/javascript" src="${request.contextPath}/plugins/layui/layui.js"></script>
		<script type="text/javascript" src="${request.contextPath}/js/jquery.min.js"></script>
		<script>
			layui.config({
				base: '${request.contextPath}/plugins/layui/modules/'
			});

			layui.use(['icheck', 'laypage','layer'], function() {
				var $ = layui.jquery,
					laypage = layui.laypage,
					layer = parent.layer === undefined ? layui.layer : parent.layer;
				$('input').iCheck({
					checkboxClass: 'icheckbox_flat-green'
				});
				//page
				laypage({
					cont: 'page',
					pages: ${page.pages} //总页数
						,
					groups: 10 //连续显示分页数
						,
					first:true,
					last:true,
					jump: function(obj, first) {
						//得到了当前页，用于向服务端请求对应数据
						var curr = obj.curr;
						if(!first) {
						 $.ajax({
				           url:'${request.contextPath}/backpage/subjectTopic/topic_page_json',
				           type:'post',
				           data:{"pageNo":obj.curr,"topicName":$('#topicName').val(),"status":$('#status').val(),"periods":$('#periods').val()},
				           success:function(data) { 
				            str = ''; 
                            $.each(data,function(i,val){
                                str += '<tr>'   
                                str += '<td>'+val.periods+'</td>'   
								str += '<td>'+val.topicName+'</td>'
								str += '<td>'+val.agreeCount+'</td>'
								str += '<td>'+val.disagreeCount+'</td>'
								str += '<td>'+val.startTimeStr+'</td>'
								str += '<td>'+val.endTimeStr+'</td>'
								str += '<td>'+(val.status==='0'?'未开始':(val.status==='1'?'进行中':'已结束'))+'</td>'
							    str += '<td>'+val.createOperator+'</td>'
							    str += '<td>'+val.createTimeStr+'</td>'
								str += '<td><div class="layui-btn-group">'
							

                             str += '<a href="${request.contextPath}/backpage/subjectTopic/topic_edit?id='+val.id+'"  class="layui-btn layui-btn-mini">详情</a> '
							<#--		if(val.status==='0'){
							str += '<a href="javascript:changeStatus(\''+val.id+'\',\'1\');"  class="layui-btn layui-btn-mini" title="开始本次话题的讨论">开始</a> '
									}
                                    if(val.status=='1'){
									str += ' <a href="javascript:changeStatus(\''+val.id+'\',\'2\');"  class="layui-btn layui-btn-danger layui-btn-mini " title="结束本次话题的讨论">结束</a>'
								}
								-->
									str += '<a href="${request.contextPath}/backpage/subjectTopicContent/content_list?topicId='+val.id+'&parentId=0"  class="layui-btn layui-btn-mini">评论列表</a>'
									
                                    str += '<a href="${request.contextPath}/backpage/subjectPrize/topic_set_gift?topicId='+val.id+'"  class="layui-btn layui-btn-mini">奖励设置</a>'
                                str += '</div></td>'
                                str += '</tr>'
                            
                            })
                            $('.layui-elem-field').find('tbody').html(str)
                         },    
                        error : function() {    
                           layer.msg("异常！");    
                        } 
				 })
				 	}
					}
				});

				$('#search').on('click', function() {
					$('#form').submit();
				});
				$('.site-table tbody tr').on('click', function(event) {
					var $this = $(this);
					var $input = $this.children('td').eq(0).find('input');
					$input.on('ifChecked', function(e) {
						$this.css('background-color', '#EEEEEE');
					});
					$input.on('ifUnchecked', function(e) {
						$this.removeAttr('style');
					});
					$input.iCheck('toggle');
				}).find('input').each(function() {
					var $this = $(this);
					$this.on('ifChecked', function(e) {
						$this.parents('tr').css('background-color', '#EEEEEE');
					});
					$this.on('ifUnchecked', function(e) {
						$this.parents('tr').removeAttr('style');
					});
				});
			
						
			});
                function changeStatus(id,status){
                     var content = (status==='1'?'开始本次话题讨论？':'结束本次话题讨论？');
                     
                     layer.confirm(content, {
						  btn: ['是的','算了'] //按钮
						}, function(){
						  	 $.ajax({
				           url:'${request.contextPath}/backpage/subjectTopic/change_topic_status',
				           type:'post',
				           data:{"id":id,"status":status},
				           success:function(data) { 
				               layer.msg('状态修改成功',{time:2000})
				              $('#form').submit();
                          },    
                        error : function() {    
                           layer.msg("异常！");    
                        } 
				      })
						}, function(){
						  layer.msg('已取消',{time:2000});
						});
                
                
                
                  
                }
		</script>
	</body>

</html>