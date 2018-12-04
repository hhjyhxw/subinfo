<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>订单列表</title>
		<link rel="stylesheet" href="../../plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="../../css/global.css" media="all">
		<link rel="stylesheet" href="../../plugins/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="../../css/table.css" />
		<style>
		.findTool{
			overflow:hidden;
			margin:10px 0;
		}
		.findTool li{
			float:left;
			padding：0 10px;
		}
		.findTool input{
			margin: 0 30px 0 10px;
			height:25px;
			line-height:25px;
		}
		.findTool select{
			margin: 0 30px 0 10px;
			padding:3px 20px;
			height:30px;
		}
		.findTool #search{
			padding:3px 20px;
		}
		.findTool #ship{
			padding:3px 30px;
			margin-left:30px;
		}
		.findTool #ship,#search{
		    font-size:18px;
		}
		
		.findTool #downLoad{
			 padding: 5px 30px;
   			 margin-left: 22px;
		}
		</style>
	</head>

	<body>
	        <div style="margin:0 auto;width:100%;">
	        <fieldset class="layui-elem-field">
	        <legend>查询条件</legend>
			<form action="${request.contextPath}/backpage/beanOrders/list" id="formId" style="padding-left:33px;">
			 <ul class="findTool">
			     <input type="hidden" id="pageNum" name="pageNum" value="${page.pageNum!''}">
				 <li>订单号<input type="text" name="orderNo" value="${record.orderNo!''}"/></li>
				 <li>收货手机号<input type="text" name="phone" value="${record.phone!''}"/></li>
				 <li>开始时间<input type="text" onclick="layui.laydate({elem: this, istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" id="startTime" name="startTime" value="${start!''}"></li>
				 <li>结束时间<input type="text" onclick="layui.laydate({elem: this, istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" id="endTime" name="endTime" value="${end!''}"></li>
				 <li>发货状态<select name="shippingStatus" onchange="pageSkip(document.getElementById('pageNum').value)" id="status" value="${record.shippingStatus!''}">
				                <option value="" >请选择</option>
				                <option value="1" <#if ((record.shippingStatus)!'') == '1'>selected</#if>>已发货</option>
				                <option value="0" <#if ((record.shippingStatus)!'') == '0'>selected</#if>>未发货</option>
				             </select>
				 </li>
				  <li>实物标签<select name="orderType" onchange="pageSkip(document.getElementById('pageNum').value)" id="status" value="${record.orderType!''}">
                 				                <option value="" >请选择</option>
                 				                <option value="0" <#if ((record.orderType)!'') == '0'>selected</#if>>常规烟品</option>
                 				                <option value="2" <#if ((record.orderType)!'') == '2'>selected</#if>>双11品吸烟</option>
                 				                <option value="4" <#if ((record.orderType)!'') == '4'>selected</#if>>京东卡</option>
                 				             </select>
                 				 </li>
				 <li><button id="search" >查询</button></li>
				 <li><button id="ship" onclick="return deliveryGoods();" >批量发货</button></li>
				  <li><button id="downLoad" onclick="downLoadExcel();" >下载</button></li>
			 </ul>
			</form>
			</fieldset>
			</div>
			<fieldset class="layui-elem-field">
				<legend>订单列表</legend>
				
				<div class="layui-field-box">
					<table class="site-table table-hover">
						<thead>
							<tr>
								<th><input type="checkbox" id="orChecked" >全选</th>
								<th style="display:none">ID</th>
								<th>订单号</th>
								<th>联系方式</th>
								<th>收货人</th>
							    <th>商品名称</th>
							    <th>消费积分</th>
							    <th>消费优惠券值</th>
							    <th>总额</th>
							    <th>订单状态</th>
							    <th>创建时间</th>
							    <th>收货地址</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="checkboxList">
						<#if page.list?? && (page.list?size > 0)> 
						<#list page.list as order>
						    <tr>
						    	
						        <td>
						            <input type="checkbox" onclick="noChecked()" />
						        </td>
						        
						        <td style="display:none">
							        ${order.id!""}
							    </td>
						          <td>
						            ${order.orderNo!""}
						        </td>
						        <td>
						            ${order.phone!""}
						        </td>
						         <td>
						            ${order.name!""}
						        </td>
						        <td>
						        	${order.goodName!""}
						        </td>
						        <td>
						        	${order.score!""}
						        </td>
						        <td>
						        	${(order.coupon)!(order.discountAmount)!}
						        </td>
						        <td>
						            ${(order.totalScore)!(order.score+order.coupon)}
						        </td>
						        <td>
	            				    <#if order.shippingStatus=='1'>已发货</#if>
			   						<#if order.shippingStatus=='0'>未发货</#if>
						        	
						        </td>
						        <td>
						        	${order.createTime?string("yyyy-MM-dd HH:mm:ss")}
						        </td>
						        <td>
						        	${(order.provinceName)!}${(order.cityName)!}${(order.countyName)!}${(order.detailAddress)!}
						        </td>
								<th>
								<div class="layui-btn-group">
								 	<button class="layui-btn layui-btn-small" onclick="detail(${order.id?c})">
								    	<#-- <i class="layui-icon">&#xe642;</i> -->&nbsp;订单明细
								  	</button>
									 <#--
								  	<button class="layui-btn layui-btn-small" onclick="delById(${order.id?c})">
								    	<i class="layui-icon">&#xe640;</i>&nbsp;删除
								  	</button>
									-->
								  	
								</div>
								</th>
							</tr>
						</#list>
						<#else>
						    <tr>
						        <th colspan="10" style="font-size:30px;padding:20px;">现在还没有任何订单哦！</th>
						    </tr>
						
						</#if>
						
						</tbody>
					</table>

				</div>
				
			</fieldset>
			<div class="admin-table-page layui-field-box">
				<div id="page" class="page">
				总共${page.total}条记录，分${page.pages}页显示，每页${page.pageSize}条记录，当前第${page.pageNum}页
			    <span style="float:right;margin-right:10%;">
				    <a class="" onclick="pageSkip(1)" href="#">首页 </a>
			        <#if page.hasPreviousPage??>
			        <a class="" onclick="pageSkip(${page.prePage})" href="#" >上一页 </a>
			        <#else>
			        <a class="" onclick="pageSkip(1)" href="#" >上一页 </a>
			        </#if>
				    <#if page.hasNextPage??>
				    <a class="" onclick="pageSkip(${page.nextPage})" href="#" >下一页 </a>
				    <#else>
				    <a class="" onclick="pageSkip(${page.pages})" href="#" >下一页 </a>
				    </#if>
				    <a class="" onclick="pageSkip(${page.pages})" href="#" >末页 </a>
				    <input type="text" id="inputPageNo" value="${page.pageNum}" name="pageNum" style="width:30px;"/>
				    <button id="skip" onclick='pageSkip(document.getElementById("inputPageNo").value)'>GO</button>
			    </span>
				</div>
				
			</div>
		</div>
		<script type="text/javascript" src="../../js/jquery.min.js"></script>
        <script type="text/javascript" src="../../plugins/layui/layui.js"></script>
		<script>
			layui.config({
				base: '../../plugins/layui/modules/'
			});
			
			
			//订单明细
			function detail(id){
				window.location.href = "${request.contextPath}/backpage/beanOrders/orderDetail?id="+id;
			}
			
			
			
			function pageSkip(pageNum){
			  var formSubmit = document.getElementById('formId');
			  $('#pageNum').attr('value',pageNum);
			  formSubmit.submit();
			}
		    
		    var orderNoList=new Array();
		    function deliveryGoods(){
		     orderNoList.splice(0,orderNoList.length);
		     $.each($('tbody tr td input:checkbox:checked'),function(){
                var orderNo = $(this).parent().parent().children('td:eq(2)').text().trim();
                orderNoList.push(orderNo);
            });
            //var operatorOrderNos=JSON.stringify(orderNoList);
            $.ajax({
              url:'${request.contextPath}/backpage/beanOrders/deliveryGoods',
              data:{'operatorOrderNos':orderNoList.toString()},
              type:'post',
              success:function(data){
                if(data.result.code=='200'){
                  alert('批量发货成功!');
                  var currentPageNo = $('#pageNum').attr('value');
                  if(orderNoList.length == 10){
                   if(${page.hasNextPage?c}){
                    currentPageNo = currentPageNo + 1;
                   }else{
                    currentPageNo = currentPageNo - 1;
                   }
                  }
                  pageSkip(currentPageNo);
                }else if(data.result.code=='400'){
                  alert('更新异常！');
                }else{
                  alert('网络故障！');
                }
              }
            });
            
            
		    
		     return false;
		    }
		    
			//全选或全不选
			$("#orChecked").click(function(){   
			    if(this.checked){   
			        $('tbody tr td').children(":checkbox").prop("checked", true);  
			    }else{   
				    $('tbody tr td').children(":checkbox").prop("checked", false);
			    }   
			});
			
			//去掉或加上全选框前的勾
			function noChecked(){
			 var checkedNum = $('tbody tr td input:checkbox:checked').length;
			 var checkboxNum = $('tbody tr td input:checkbox').length;
			 if(checkedNum == checkboxNum){
			  $("#orChecked").prop("checked", true);
			 }else{
			  $("#orChecked").prop("checked", false);
			 }
			 
			}
			
			//删除
			function delById(id){
			    layui.use(['layer', 'form'], function(){
				  var layer = layui.layer
				  ,form = layui.form;
				  //询问框
				layer.confirm('您确定要删除该订单吗？', {
				  btn: ['确定','取消'] //按钮
				}, function(){
				  var url = '${request.contextPath}/backpage/beanOrders/delete';
					$.post(url, {
		                'id':id
		            }, function(ret) {
					    if(ret == "0000"){
					    	layer.msg("删除成功");
					    	window.location.href = "${request.contextPath}/backpage/beanOrders/list";
					    }else{
					    	layer.msg("删除失败");
					    }
		            });
				}, function(){
				 
				  });
				});
			    
				
			}
			
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
		    
		    
			//下载
			function downLoadExcel(){
			    $("#formId").attr('action',"${request.contextPath}/backpage/beanOrderReport/downLoadOrderlist");    //通过jquery为action属性赋值
    		    $("#formId").submit();    //提交ID为myform的表单
    		    window.setTimeout(function(){
    		    	 $("#formId").attr('action',"${request.contextPath}/backpage/beanOrders/list");    //通过jquery为action属性赋值
    		    },1000);
			}
	    </script>
	    <script>
	    	
	    </script>
	</body>

</html>