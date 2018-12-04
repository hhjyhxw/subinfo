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
          <form id="form" action="${request.contextPath}/backpage/subjectOrder/order_list" method="post">
			<blockquote class="layui-elem-quote">
		        订单时间：<div class="layui-input-inline">
                   <input class="layui-input" placeholder="开始时间" id="LAY_demorange_s" name="createTime" value="${(record.createTime?string('yyyy-MM-dd HH:mm:ss'))!''}">
                </div>
			    <div class="layui-input-inline">
			      <input class="layui-input" placeholder="结束时间" id="LAY_demorange_e" name="endCreateTime" value="${(record.endCreateTime)!''}">
			    </div>            
		                    订单状态：  <div class="layui-input-inline"> 
		        <select name="orderStatus" id="orderStatus">
					  <option value="" >全部</option>
					  <option value="0" <#if record.orderStatus?? && record.orderStatus=='0'>selected</#if>>新创建</option>
					  <option value="1" <#if record.orderStatus?? && record.orderStatus=='1'>selected</#if>>处理中</option>
					  <option value="2" <#if record.orderStatus?? && record.orderStatus=='2'>selected</#if>>已完成</option>
                </select>
                </div>
                                     发货状态：  <div class="layui-input-inline"> 
		        <select name="shippStatus" id="shippStatus">
					  <option value="" >全部</option>
					  <option value="0" <#if record.shippStatus?? && record.shippStatus=='0'>selected</#if>>新创建</option>
					  <option value="1" <#if record.shippStatus?? && record.shippStatus=='1'>selected</#if>>已发货</option>
                </select>
                </div>          
                                    订单类型：  <div class="layui-input-inline"> 
		        <select name="orderType" id="orderType">
					  <option value="" >全部</option>
					  <option value="0" <#if record.orderType?? && record.orderType=='0'>selected</#if>>评论奖励</option>
					  <option value="1" <#if record.orderType?? && record.orderType=='1'>selected</#if>>征集奖励</option>
					  <option value="2" <#if record.orderType?? && record.orderType=='2'>selected</#if>>精华奖励</option>
                </select>
                </div>         
		       <a href="javascript:;" class="layui-btn layui-btn-small" id="search">
					<i class="layui-icon">&#xe615;</i> 搜索
				</a>
				 
			</blockquote>
			</form>	
			<fieldset class="layui-elem-field">
				<legend>订单列表</legend>
				<div class="layui-field-box">
					<table class="site-table table-hover">
						<thead>
							<tr>
								<th>订单编号</th>
								<th>订单类型</th>
								<th>所属话题</th>
								<th>奖品名称</th>
								<th>积分值</th>
								<th>收货信息</th>
								<th>状态</th>
								<th>创建时间</th>
							</tr>
						</thead>
						<tbody>
						<#list page.list as record>
						    <tr>
								<td>${(record.orderNo)!''}</td>
								<td>${(record.orderTypeStr)!''}</td>
								<td>${(record.topic.topicName)!''}</td>
								<td>${(record.giftName)!''}</td>
								<td>${(record.score)!''}</td>
								<td>${(record.receiverName)!''}|${(record.receiverPhone)!''}|${(record.receriverAddress)!''}</td>
							    <td>${(record.orderStatusStr)!''}</td>
								<td>${record.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
								
								<#--
								  <td>
								  <div class="layui-btn-group">
								
									<a href="${request.contextPath}/backpage/subjectTopic/topic_edit?id=${record.id}"  class="layui-btn layui-btn-mini">详情</a>
									<#if record.status=='0'>
									<a href="javascript:changeStatus('${record.id}','1');"  class="layui-btn layui-btn-mini" title="开始本次话题的讨论">开始</a>
									</#if>
									<#if record.status=='1'>
									 <a href="javascript:changeStatus('${record.id}','2');"  class="layui-btn layui-btn-danger layui-btn-mini " title="结束本次话题的讨论">结束</a>
									</#if>
									<a href="${request.contextPath}/backpage/subjectTopicContent/content_list?topicId=${record.id}&parentId=0"  class="layui-btn layui-btn-mini">评论列表</a>
									
									<a href="${request.contextPath}/backpage/subjectPrize/topic_set_gift?topicId=${record.id}"  class="layui-btn layui-btn-mini">奖励设置</a>
								</div>    
								</td>
								-->
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

			layui.use(['icheck', 'laypage','layer','laydate'], function() {
				var $ = layui.jquery,
					laypage = layui.laypage,
					layer = parent.layer === undefined ? layui.layer : parent.layer;
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
				    , format: 'YYYY-MM-DD hh:mm:ss'
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
				           url:'${request.contextPath}/backpage/subjectOrder/order_page_json',
				           type:'post',
				           data:{"pageNo":obj.curr,"orderStatus":$('#orderStatus').val(),"orderTypr":$('#orderType').val(),"createTime":$('#LAY_demorange_s').val(),"endCreateTime":$('#LAY_demorange_e').val()},
				           success:function(data) { 
				            str = ''; 
                            $.each(data,function(i,val){
                                str += '<tr>'      
                                str+=' <td>'+val.orderNo+'</td>'
								str+='<td>'+val.orderTypeStr+'</td>'
								str+='<td>'+val.topic.topicName+'</td>'
								str+='<td>'+val.giftName+'</td>'
								str+='<td>'+val.score+'</td>'
								str+= '<td>'+val.receiverName+'|'+val.receiverPhone+'|'+val.receriverAddress+'</td>'
							    str+= '<td>'+val.orderStatusStr+'</td>'
								str+= '<td>'+val.createTimeStr+'</td>'
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
             
		</script>
	</body>

</html>