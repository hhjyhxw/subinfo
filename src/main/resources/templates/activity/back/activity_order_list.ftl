<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>订单列表</title>
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
          <form id="form" action="${request.contextPath}/backpage/activityOrder/list" method="post">
			<blockquote class="layui-elem-quote">
		                   用户名称：<div class="layui-input-inline"><input type="text" name="realName" value="${(record.realName)!''}" id="realName" /></div>
					 </div>
					   城市：<select style="width:12%;" name="cityId" lay-verify="" id="status" value="${(record.cityId)!''}">
                            <option value="">全部</option>
                            <option value="1" <#if (record.cityId?? && record.cityId == 1)>selected="selected"</#if>>南宁</option>
                            <option value="2" <#if (record.cityId?? && record.cityId == 2)>selected="selected"</#if>>柳州</option>
                            <option value="3" <#if (record.cityId?? && record.cityId == 3)>selected="selected"</#if>>桂林</option>
                            <option value="4" <#if (record.cityId?? && record.cityId == 4)>selected="selected"</#if>>玉林</option>
                            <option value="5" <#if (record.cityId?? && record.cityId == 5)>selected="selected"</#if>>梧州</option>
                            <option value="6" <#if (record.cityId?? && record.cityId == 6)>selected="selected"</#if>>河池</option>
                            <option value="7" <#if (record.cityId?? && record.cityId == 7)>selected="selected"</#if>>百色</option>
                            <option value="8" <#if (record.cityId?? && record.cityId == 8)>selected="selected"</#if>>北海</option>
                        </select>

		       <a href="javascript:;" class="layui-btn layui-btn-small" id="search">
					<i class="layui-icon">&#xe615;</i> 搜索
				</a>
			</blockquote>
			</form>	
			<fieldset class="layui-elem-field">
				<legend>类型列表</legend>
				<div class="layui-field-box">
					<table class="site-table table-hover">
						<thead>
							<tr>
								<th>用户名</th>
								<th>城市</th>
								<th>认购目标</th>
								<th>提交时间</th>
							</tr>
						</thead>
						<tbody>
						<#list page.list as record>
						    <tr>
								<td>${(record.realName)!''}</td>
								<td>${(record.cityName)!''}</td>
								<td>${(record.amout)!''}万</td>
								<td>${record.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
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
				           url:'${request.contextPath}/backpage/activityOrder/getList',
				           type:'post',
				           data:{"pageNo":obj.curr,"realName":$('#realName').val(),"":$("#cityId").val()},
				           success:function(data) {
				            str = ''; 
                            $.each(data.list,function(i,val){
                                str += '<tr>'      
								str += '<td>'+val.realName+'</td>'
								str += '<td>'+val.cityName+'</td>'
								str += '<td>'+val.amout+'万</td>'
								str += '<td>'+val.createTime+'</td>'
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