<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>排行榜配置列表</title>
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
          <form id="form" action="${request.contextPath}/backpage/subjectRankPrizeConfig/list" method="post">
			<blockquote class="layui-elem-quote">
		                   等级名称：<div class="layui-input-inline"><input type="text" name="levelName" value="${(record.levelName)!''}" id="levelName" /></div>
					 </div>
					    排行类型名称：<div class="layui-input-inline"><input type="text" name="rankTypeName" value="${(record.rankTypeName)!''}" id="rankTypeName" /></div>
                     					 </div>

		       <a href="javascript:;" class="layui-btn layui-btn-small" id="search">
					<i class="layui-icon">&#xe615;</i> 搜索
				</a>
				 <a href="${request.contextPath}/backpage/subjectRankPrizeConfig/toinput" class="layui-btn layui-btn-small" id="search">
					<i class="layui-icon">&#xe61f;</i> 添加
				</a>
			</blockquote>
			</form>	
			<fieldset class="layui-elem-field">
				<legend>排行榜配置列表</legend>
				<div class="layui-field-box">
					<table class="site-table table-hover">
						<thead>
							<tr>
							    <th>等级名称</th>
								<th>等级值</th>
								<th>最小区间值</th>
								<th>最大区间值</th>
								<th>奖品名称</th>
								<th>排行类型名称</th>
								<th>创建时间</th>
								<th>修改时间</th>
								<th>创建人</th>
								<th>修改人</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
						<#if page??>
							<#list page.list as record>
						    <tr>
								<td>${(record.levelName)!''}</td>
								<td>${(record.randLevel)!''}</td>
								<td>${(record.minValue)!''}</td>
								<td>${(record.maxValue)!''}</td>
								<td>${(record.giftName)!''}</td>
								<td>${(record.rankTypeName)!''}</td>
								<td>${record.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
								<td>
                                 ${(record.modifyTime?string("yyyy-MM-dd HH:mm:ss"))!}
                                </td>
								<td> ${(record.createOperator)!}</td>
								<td> ${(record.modifyOperator)!}</td>
								<td>
								
								<div class="layui-btn-group">
								 	<button class="layui-btn layui-btn-small" onclick="toEdit(${record.id})">
								    	<i class="layui-icon">&#xe642;</i>&nbsp;编辑
								  	</button>
								</div>
								
								</td>
							</tr>
						</#list>
						</#if>
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
				           url:'${request.contextPath}/backpage/subjectRankPrizeConfig/getList',
				           type:'post',
				           data:{"pageNo":obj.curr,"strategyName":$('#strategyName').val()},
				           success:function(data) {
				            str = ''; 
                            $.each(data.list,function(i,val){
                                str += '<tr>'      
								str += '<td>'+val.levelName+'</td>'
								str += '<td>'+val.randLevel+'</td>'
								str += '<td>'+val.minValue+'</td>'
								str += '<td>'+val.maxValue+'</td>'
								str += '<td>'+val.giftName+'</td>'
								str += '<td>'+val.rankTypeName+'</td>'
								str += '<td>'+val.createTimeStr+'</td>'
								str += '<td>'+val.modifyTimeStr+'</td>'
								str += '<td>'+val.createOperator+'</td>'
								str += '<td>'+val.modifyOperator+'</td>'
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
				window.location.href = "${request.contextPath}/backpage/subjectRankPrizeConfig/toinput?id="+id;
			}
				
		</script>
	</body>

</html>