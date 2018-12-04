<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>评论列表</title>
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
          <form id="form" action="${request.contextPath}/backpage/subjectTopicContent/content_list" method="post">
            <input type="hidden" name="topicId" value="${record.topicId}">
			
			<blockquote class="layui-elem-quote">
			        评论内容：<div class="layui-input-inline"><input type="text" name="contents" value="${(record.contents)!''}" id="contents" /></div>
			        评论人：<div class="layui-input-inline"><input type="text" name="nickName" value="${(record.nickName)!''}" id="nickName" /></div>
		                   评论状态：  <div class="layui-input-inline"> 
		        <select name="status" id="status">
					  <option value="" >全部</option>
					  <option value="0" <#if record.status?? && record.status=='0'>selected</#if>>用户不可见</option>
					  <option value="1" <#if record.status?? && record.status=='1'>selected</#if>>用户可见</option>
                </select>
                </div>
                                    是否精华：  <div class="layui-input-inline"> 
		        <select name="toTop" id="toTop">
					  <option value="" >全部</option>
					  <option value="0" <#if record.toTop?? && record.toTop=='0'>selected</#if>>否</option>
					  <option value="1" <#if record.toTop?? && record.toTop=='1'>selected</#if>>是</option>
                </select>
                </div>
                          
		       <a href="javascript:;" class="layui-btn layui-btn-small" id="search">
					<i class="layui-icon">&#xe615;</i> 搜索
				</a>
				 <a href="${request.contextPath}/backpage/subjectTopic/topic_list" class="layui-btn layui-btn-small" id="search">
					<i class="layui-icon">&#xe65c;</i> 返回话题列表
				</a>
				
				 <a href="${request.contextPath}/backpage/subjectTopicContent/downLoadContentlist?topicId=${record.topicId}" class="layui-btn layui-btn-small" id="search">
					<i class="layui-icon">&#xe65c;</i> 下载
				</a>
			</blockquote>
			</form>	
			<fieldset class="layui-elem-field">
				<legend>评论列表</legend>
				<div class="layui-field-box">
					<table class="site-table table-hover">
						<thead>
							<tr>
								<th>话题名称</th>
								<th>评论内容</th>
								<th>评论时间</th>
								<th>点赞数</th>
								<th>评论人</th>
								<th>头像</th>
								<th>openid</th>
								<th>用户可见状态</th>
								<th>是否精华</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
						<#list page.list as record>
						    <tr>
								<td>${(record.topicName)!''}</td>
								<td>${(record.contents)!''}</td>
								<td>${record.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
								<td>
                                 ${record.upCount!'0'}
                                </td>
                                <td>
                                 ${record.nickName!'0'}
                                </td>
                                 <td>
                                 <img src="${record.headimgurl}" />
                                </td>
                                 <td>
                                 <#if record.user??>
                                     ${record.user.openid}
                                 </#if>
                                </td>
                                <td>
                                    <#if record.status=='0'>
                                                                                              不可见
                                    </#if>
                                    <#if record.status=='1'>
                                                                                            可见
                                    </#if>
                                </td>
								<td> 
                                    <#if record.toTop=='0'>
                                                                                         否
                                    </#if>
                                    <#if record.toTop=='1'>
                                                                                           是
                                    </#if>
                                 </td>
								<td>
								<div class="layui-btn-group">
								
									<a href="javascript:contentDetai('${record.id?c}');"  class="layui-btn layui-btn-mini">详情</a>
									
									<a href="javascript:starList('${record.id?c}');"  class="layui-btn layui-btn-mini">点赞列表</a>
								
								    <a href="javascript:replyList('${record.id?c}','${record.topicId}');"  class="layui-btn layui-btn-mini">回复列表</a>
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
				           url:'${request.contextPath}/backpage/subjectTopicContent/content_page_json',
				           type:'post',
				           data:{"pageNo":obj.curr,"contents":$('#contents').val(),"status":$('#status').val(),"toTop":$('#toTop').val(),"nickName":$('#nickName').val()},
				           success:function(data) { 
				            str = ''; 
                            $.each(data,function(i,val){
                               
                                str += '<tr>'      
								str += '<td>'+val.topicName+'</td>'
								str += '<td>'+val.contents+'</td>'
								str += '<td>'+val.createTimeStr+'</td>'
								str += '<td>'+val.upCount+'</td>'
								str += '<td>'+val.nickName+'</td>'
								str += '<td><img src="'+val.headimgurl+'" /></td>'
								str += '<td>'+val.user.openid+'</td>'
							    str += '<td>'+((val.status=='1')?'可见':'不可见')+'</td>'
							    str += '<td>'+((val.toTop==='0')?'否':'是')+'</td>'
								str += '<td>'
							

                                 str += '<a href="javascript:contentDetai(\''+val.id+'\')"  class="layui-btn layui-btn-mini">详情</a>&nbsp; '
									
								 str += ' <a href="javascript:starList(\''+val.id+'\');"  class="layui-btn layui-btn-mini">点赞列表</a>'
									
                                 str += ' <a href="javascript:replyList(\''+val.id+'\',\''+val.topicId+'\');"  class="layui-btn layui-btn-mini">回复列表</a>'
									
                                str += '</td>'
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
			
			    function starList(id){
			       layer.open({
			          title :'点赞记录',
					  type: 2, 
					  content: '${request.contextPath}/backpage/subjectTopicContent/thumbs_list?contentId='+id,
					  area: ['900px', '400px'] 
					});
			      
			    }
			    
			    function contentDetai(id){
			      layer.open({
			          title :'评论详情',
					  type: 2, 
					  content: '${request.contextPath}/backpage/subjectTopicContent/content_detail?id='+id,
					  area: ['900px', '400px'] 
					});
			    }
			    function replyList(id,topicId){
			     layer.open({
			          title :'回复列表',
					  type: 2, 
					  content: '${request.contextPath}/backpage/subjectTopicContent/reply_list?parentId='+id+'&topicId='+topicId,
					  area: ['900px', '400px'] 
					});
			    }
              
		</script>
	</body>

</html>