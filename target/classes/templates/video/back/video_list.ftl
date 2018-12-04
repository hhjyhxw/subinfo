<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>视频列表</title>
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
	        <blockquote class="layui-elem-quote">
	        <div style="margin:0 auto;width:100%;">
	        <fieldset class="layui-elem-field">
	        <legend>查询条件</legend>
			 <ul class="findTool">
			     <input type="hidden" id="pageNum" name="pageNum" value="${page.pageNum!''}">
				 <li>标题<input type="text" name="title" id="title" value="${record.title!''}"/></li>
				 <li>上传时间<input type="text" onclick="layui.laydate({elem: this, istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" id="startTime" name="startTime" value="${start!''}">
				          ~
				           <input type="text" onclick="layui.laydate({elem: this, istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" id="endTime" name="endTime" value="${end!''}">
				 </li>
				 <a href="javascript:;" class="layui-btn layui-btn-small" id="search">
					<i class="layui-icon">&#xe615;</i> 查找
				</a>
				<button class="layui-btn layui-btn-small" id="toAdd">
				     <i class="layui-icon">&#xe608;</i> 添加
				</button>
			 </ul>
			</fieldset>
			</div>
			</blockquote>
			<fieldset class="layui-elem-field">
				<legend>视频列表</legend>
				
				<div class="layui-field-box">
					<table class="site-table table-hover">
						<thead>
							<tr>
								<th><input type="checkbox" id="orChecked" ></th>
								<th style="display:none">ID</th>
								<th>标题</th>
							    <th>图片</th>
							    <th>描述</th>
							    <th>播放地址</th>
							    <th>播放时间</th>
							    <th>上传时间</th>
							    <th>创建人</th>
							    <th>修改时间</th>
							    <th>修改人</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="checkboxList">
						<#if page.list?? && (page.list?size > 0)> 
						<#list page.list as video>
						    <tr>
						    	
						        <td>
						            <input type="checkbox" onclick="noChecked()" />
						        </td>
						        
						        <td style="display:none">
							        ${video.id!""}
							    </td>
						        
						        <td>
						            ${video.title!""}
						        </td>
						        <td>
						        	<img src="${pictureVisitUrl}${video.imagesUrl!""}" height="70" width="70"/>
						        </td>
						        <td>
						        	${video.videoDesc!""}
						        </td>
						        <td>
						        	${video.videoAddress!""}
						        </td>
						        <td>
						            ${(video.playTime?string("yyyy-MM-dd HH:mm:ss"))!""}
						        </td>
						        <td>
	            				    ${(video.createTime?string("yyyy-MM-dd HH:mm:ss"))!""}
						        </td>
						        <td>
						        	${video.createUser!""}
						        </td>
						        <td>
						        	${(video.modifyTime?string("yyyy-MM-dd HH:mm:ss"))!""}
						        </td>
						        <td>
						        	${video.lastModUser!""}
						        </td>
								<th>
								<div class="layui-btn-group">
								 	<button class="layui-btn layui-btn-small" onclick="toEdit(${video.id?c})">
								    	<i class="layui-icon">&#xe642;</i>&nbsp;编辑
								  	</button>
									 
								  	<button class="layui-btn layui-btn-small" onclick="delById(${video.id?c})">
								    	<i class="layui-icon">&#xe640;</i>&nbsp;删除
								  	</button>
									
								  	
								</div>
								</th>
							</tr>
						</#list>
						<#else>
						    <tr>
						        <th colspan="11" style="font-size:30px;padding:20px;">没有找到任何视频哦！</th>
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
				    <button id="skip" class="layui-btn layui-btn-small" onclick='pageSkip(document.getElementById("inputPageNo").value)'>GO</button>
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
			
			//跳转到新增页面
			$('#toAdd').on('click', function() {
				window.location.href = "${request.contextPath}/backpage/video/toAdd"
			});
			
			//修改视频信息
			function toEdit(id){
				window.location.href = "${request.contextPath}/backpage/video/toAdd?id="+id;
			}
			
			//搜索
			$('#search').on('click',function(){
			    var requestUrl = "${request.contextPath}/backpage/video/list"
			    var title = $('#title').val();
			    if(title != null && "" != title){
			        requestUrl = requestUrl + "?title=" + title;
			    }else{
			        requestUrl = requestUrl + "?"
			    }
			    var start = $('#startTime').val();
			    if(start != null && "" != start){
			      if(requestUrl.charAt(requestUrl.length - 1) == '?'){
			         requestUrl = requestUrl + "startTime=" + start;
			      }else{
			         requestUrl = requestUrl + "&startTime=" + start;
			      }
			    }
			    var end = $('#endTime').val();
			    if(end != null && "" != end){
			      if(requestUrl.charAt(requestUrl.length - 1) == '?'){
			         requestUrl = requestUrl + "endTime=" + end;
			      }else{
			         requestUrl = requestUrl + "&endTime=" + end;
			      }
			    }
			    //alert(requestUrl);
			    window.location.href = requestUrl;
			});
			
			function pageSkip(pageNum){
			    var requestUrl = "${request.contextPath}/backpage/video/list?pageNum=" + pageNum
			    var title = $('#title').val();
			    if(title != null && "" != title){
			        requestUrl = requestUrl + "&title=" + title;
			    }
			    var start = $('#startTime').val();
			    if(start != null && "" != start){
			        requestUrl = requestUrl + "&startTime=" + start;
			    }
			    var end = $('#endTime').val();
			    if(end != null && "" != end){
			        requestUrl = requestUrl + "&endTime=" + end;
			    }
			    //alert(requestUrl);
			    window.location.href = requestUrl;
			    
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
				layer.confirm('您确定要删除该视频吗？', {
				  btn: ['确定','取消'] //按钮
				}, function(){
				  var url = '${request.contextPath}/backpage/video/delete';
					$.post(url, {
		                'id':id
		            }, function(ret) {
					    if(ret == "0000"){
					    	layer.msg("删除成功");
					    	pageSkip(document.getElementById('pageNum').value);
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
		    
	    </script>
	    <script>
	    	
	    </script>
	</body>

</html>