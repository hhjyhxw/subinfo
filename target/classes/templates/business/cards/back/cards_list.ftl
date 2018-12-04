<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>卡密表</title>
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
	        <blockquote  class="layui-elem-quote">
	        <div style="margin:0 auto;width:100%;">
	        <fieldset  class="layui-elem-field">
	        <legend>查询条件</legend>
			       <div class="layui-form-item">
				    <div class="layui-inline">
				      <label class="layui-form-label">卡号</label>
				      <div class="layui-input-inline">
				        <input type="text" name="cardAccount" id="cardAccount" lay-verify="required|phone" autocomplete="off" class="layui-input" value="${record.cardAccount!''}">
				      </div>
				    </div>
				    
				    <div class="layui-inline">
				      <label class="layui-form-label">面额</label>
				      <div class="layui-input-inline">
				        <input type="text" name="account" id="account" lay-verify="email" autocomplete="off" class="layui-input" value="${record.account!''}">
				      </div>
				    </div>
				    
				    <div class="layui-inline">
				      <label class="layui-form-label">商品编号</label>
				      <div class="layui-input-inline">
				        <input type="text" name="cardGoodsId" id="cardGoodsId" lay-verify="cardGoodsId" autocomplete="off" class="layui-input" value="${record.cardGoodsId!''}">
				      </div>
				    </div>
				    
				    <div class="layui-inline">
				      <label class="layui-form-label">使用状态</label>
				      <div class="layui-input-inline">
				        <select name="isUse" style="height:38px;width:130px;" id="isUse" value="${record.isUse!''}">
				          <option value="">全部</option>
				            <option value="0" <#if (((record.isUse)!'')== "0")>selected="selected"</#if>>未使用</option>
				            <option value="1" <#if (((record.isUse)!'')== "1")>selected="selected"</#if>>已使用</option>
				          </optgroup>
				        </select>
				      </div>
				    </div>

				    <div class="layui-inline">
			            <button class="layui-btn" id="card_search">查找</button>
				    </div>
				    
				    <div class="layui-inline">
				      <a href="${request.contextPath}/backpage/cardSecrect/toImportExcel.do">
						<button type="button" class="layui-btn layui-btn-normal" id="import">导入数据</button>
					  </a>
				    </div>
				    
				  </div>
			</fieldset>
			</div>
			</blockquote>
			<fieldset class="layui-elem-field">
				<legend>卡密列表</legend>
				
				<div class="layui-field-box">
					<table class="site-table table-hover">
						<thead>
							<tr>
								<th><input type="checkbox" id="checkedAll" onclick="isselect()"></th>
								<th style="display:none">ID</th>
								<th>卡号</th>
							    <th>卡密</th>
							    <th>面额</th>
							    <th>商品编号</th>
							    <th>是否可用</th>
								<th style="display:none">操作</th>
							</tr>
							
						</thead>
						<tbody id="checkboxList">
						<#if page.list?? && (page.list?size > 0)> 
						<#list page.list as card>
						    <tr>
						    	
						        <td>
						            <input type="checkbox" name="ids" />
						        </td>
						        
						        <td style="display:none">
							        ${card.cardId!""}
							    </td>
						        
						        <td>
						            ${card.cardAccount!""}
						        </td>
						        <td>
						        	${card.cardSecrect!""}
						        </td>
						        <td>
						        	${card.account!""}
						        </td>
						        <td>
						            ${card.cardGoodsId!""}
						        </td>
						        <td>
	            				    <#if card.isUse=='0'>未使用</#if>
						        	<#if card.isUse=='1'>已使用</#if>
						        </td>
								<th style="display:none">
								<div class="layui-btn-group">
								 	<button class="layui-btn layui-btn-small">
								    	<i class="layui-icon">&#xe642;</i>&nbsp;编辑
								  	</button>
									 
								  	<button class="layui-btn layui-btn-small">
								    	<i class="layui-icon">&#xe640;</i>&nbsp;删除
								  	</button>
								</div>
								</th>
							</tr>
						</#list>
						<#else>
						    <tr>
						        <th colspan="8" style="font-size:30px;padding:20px;">目前还没有任何数据哦！</th>
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
			        <a class="" href="#" >上一页 </a>
			        </#if>
				    <#if page.hasNextPage??>
				    <a class="" onclick="pageSkip(${page.nextPage})" href="#" >下一页 </a>
				    <#else>
				    <a class="" href="#" >下一页 </a>
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
            
            //搜索功能
            $('#card_search').on('click',function(){
                
                //url
                var requestUrl = "${request.contextPath}/backpage/cardSecrect/cardSecrectList.do"
                requestUrl = setUrl(requestUrl);
			    window.location.href = requestUrl;
            });
            
            //翻页功能
            function pageSkip(pageNum){
               var requestUrl = "${request.contextPath}/backpage/cardSecrect/cardSecrectList.do?pageNum=" + pageNum;
               requestUrl = setUrl(requestUrl);
               window.location.href = requestUrl;
            }
            
            //拼装url
            function setUrl(requestUrl){
               
               
               //卡号
                var cardAccount = $('#cardAccount').val();
			    if(cardAccount != null && "" != cardAccount){
			        if(requestUrl.indexOf("?") == -1){
			             requestUrl += "?cardAccount=" + cardAccount;
			        }else{
			             requestUrl += "&cardAccount=" + cardAccount;
			        }
			    }
			    
			    //面额
			    var account = $('#account').val();
			    if(account != null && "" != account){
			        if(requestUrl.indexOf("?") == -1){
			            requestUrl += "?account=" + account;
			        }else{
			            requestUrl += "&account=" + account;
			        } 
			    }
			    
			    //商品编号
			    var cardGoodsId = $('#cardGoodsId').val();
			    if(cardGoodsId != null && "" != cardGoodsId){
			        if(requestUrl.indexOf("?") == -1){
			            requestUrl += "?cardGoodsId=" + cardGoodsId;
			        }else{
			            requestUrl += "&cardGoodsId=" + cardGoodsId;
			        } 
			    }
			    
			    //使用状态
			    var isUse = $('#isUse').val();
			    if(isUse != null && "" != isUse){
			      if(requestUrl.indexOf("?") == -1){
			            requestUrl += "?isUse=" + isUse;
			        }else{
			            requestUrl += "&isUse=" + isUse;
			        } 
			    }
			    return requestUrl;
            }
            
            function isselect(){
                var all = document.getElementById("checkedAll");
                var ids = document.getElementsByName("ids");
                for(var i=0;i<ids.length;i++){
                   ids[i].checked = all.checked;
                }
            }
	    	
	    </script>
	    <script>
	        
	    </script>
	</body>

</html>