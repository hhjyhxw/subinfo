<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>活动管理</title>
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
          <form id="form" action="${request.contextPath}/backpage/appointmentActivity/list" method="post">
			<blockquote class="layui-elem-quote">
		                   活动名称：<div class="layui-input-inline"><input type="text" name="activityName" value="${(record.activityName)!''}" id="activityName" /></div>
					 </div>
					   状态：<select style="width:12%;" name="status" lay-verify="" id="status" value="${(record.status)!''}">
                            <option value="">全部</option>
                            <option value="0" <#if (((record.status)!'') == '0')>selected="selected"</#if>>未开始</option>
                            <option value="1" <#if (((record.status)!'') == '1')>selected="selected"</#if>>进行中</option>
                             <option value="2" <#if (((record.status)!'') == '2')>selected="selected"</#if>>已结束</option>
                        </select>

		       <a href="javascript:;" class="layui-btn layui-btn-small" id="search">
					<i class="layui-icon">&#xe615;</i> 搜索
				</a>
				 <a href="${request.contextPath}/backpage/appointmentActivity/toinput" class="layui-btn layui-btn-small" id="search">
					<i class="layui-icon">&#xe61f;</i> 添加
				</a>
			</blockquote>
			</form>	
			<fieldset class="layui-elem-field">
				<legend>类型列表</legend>
				<div class="layui-field-box">
					<table class="site-table table-hover">
						<thead>
							<tr>
								<th>活动名称</th>
								<#-- <th>活动文字描述</th> -->
								<th>开始时间</th>
								<th>结束时间</th>
								<th>状态</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
						<#list page.list as record>
						    <tr>
								<td>${(record.activityName)!''}</td>
								<#-- <td>${(record.activityDetail)!''}</td> -->
								<td>${record.startTime?string("yyyy-MM-dd HH:mm:ss")}</td>
								<td>${record.endTime?string("yyyy-MM-dd HH:mm:ss")}</td>
								<td>
								    <#if (record.status=='0')>
								        未开始
								    </#if>
								   <#if (record.status=='1')>
                                        进行中
                                    </#if>
								    <#if (record.status=='2')>
                                        已结束
                                    </#if>
								</td>
								<td>
								<div class="layui-btn-group">
								 	<button class="layui-btn layui-btn-small" onclick="toEdit(${record.id})">
								    	<i class="layui-icon">&#xe642;</i>&nbsp;编辑
								  	</button>
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
				           url:'${request.contextPath}/backpage/appointmentActivity/getList',
				           type:'post',
				           data:{"pageNo":obj.curr,"strategyName":$('#strategyName').val()},
				           success:function(data) {
				            str = ''; 
                            $.each(data.list,function(i,val){
                                str += '<tr>'      
								str += '<td>'+val.activityName+'</td>'
								//str += '<td>'+val.activityDetail+'</td>'
								str += '<td>'+val.startTime+'</td>'
								str += '<td>'+val.endTime+'</td>'
								str += '<td>'+val.status+'</td>'
								str += '<td>'
								str += '<div class="layui-btn-group">';
                            	str += '<button class="layui-btn layui-btn-small" onclick="toEdit('+val.id+')">';
                            	str += '<i class="layui-icon">&#xe642;</i>&nbsp;编辑';
								str += '</button>';
                            	str += '</div>';
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
			
			//跳转修改
			function toEdit(id){
				window.location.href = "${request.contextPath}/backpage/appointmentActivity/toinput?id="+id;
			}
				
		</script>
	</body>

</html>