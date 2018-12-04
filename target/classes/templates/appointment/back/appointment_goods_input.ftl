<!doctype html>
<html>

	<head>
		<meta charset="utf-8">
		<title><#if (record.id)??>编辑<#else>添加</#if></title>
		<link rel="stylesheet" href="../../plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="../../css/global.css" media="all">
		<link rel="stylesheet" href="../../plugins/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="../../css/table.css" />
		<link rel="stylesheet" href="../../layui/dist/css/layui.css"  media="all">
	</head>

	<body>
	<form class="layui-form" action="" name="actionForm" method="POST" enctype="multipart/form-data">
		<input type="hidden" name="id" value="${(record.id)!}">
		<input type="hidden" name="goodImage" value="${pictureVisitUrl}${(record.goodImage)!}">
		<fieldset class="layui-elem-field" style="width: 60%; text-align: center; margin-left: 20%;">
			<legend><#if (record.id)??>编辑<#else>添加</#if></legend>
			<div class="layui-form-item">
		  	</div>
  			<div class="layui-form-item">
			    <label class="layui-form-label">商品图片</label>
			   	<div class="layui-input-inline" style="width:70%">
				   	<div class="layui-form-mid layui-word-aux">
				   		<input type="file" name="pfile" id="pfile" onchange="javascript:setImagePreview();">
				   	</div>
			   		<div id="pShow" style="width:100px; height:100px; overflow:hidden;">      
						<div id="imgDivPl">
							<#if record?? && (record.goodImage)??>
								<img id="previewPl" src="${request.contextPath}${(record.goodImage)!}" width="100" height="100" onclick="toPreview(this.src)"/>
							<#else>
									<img id="previewPl" src=" width="100" height="100" onclick="toPreview(this.src)"/>
							</#if>
	               		</div>   		
					</div>
		  		</div>
		  	</div>
  			<div class="layui-form-item">
				<label class="layui-form-label">商品名称</label>
			    <div class="layui-input-inline" style="width:70%">
			        <input type="text" name="name" lay-verify="required" id="name" value="${(record.name)!}" placeholder="" autocomplete="off" class="layui-input">
		  		</div>
		  		<div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
		  	</div>
		
		  	<div class="layui-form-item">
			  	<label class="layui-form-label">龙币数量</label>
			    <div class="layui-input-inline" style="width:70%">
			        <input type="number" name="score" lay-verify="required"  id="score" value="${(record.score?c)!100}" placeholder="0" autocomplete="off" class="layui-input">
		  		</div>
		  		<div class="layui-form-mid layui-word-aux"><span style="color:red;">商品兑换需要龙币数量*</span></div>
		  	</div>
		  	<div class="layui-form-item">
			  	<label class="layui-form-label">添加库存</label>
			    <div class="layui-input-inline" style="width:70%">
			        <input type="number" name="addstore" lay-verify="" id="addstore" value="0" placeholder="0" autocomplete="off" class="layui-input">
		  		</div>
		  		<div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
		  	</div>
		  	<div class="layui-form-item">
			  	<label class="layui-form-label">剩余库存</label>
			    <div class="layui-input-inline" style="width:70%">
			        <input type="number" name="remainstore" lay-verify="" readonly="readonly" id="remainstore" value="${((record.store-record.freezeStore)?c)!0}" placeholder="0" autocomplete="off" class="layui-input">
		  		</div>
		  		<div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
		  	</div>
		  	<div class="layui-form-item">
			  	<label class="layui-form-label">总库存</label>
			    <div class="layui-input-inline" style="width:70%">
			        <input type="number" name="store" lay-verify="" readonly="readonly" id="store" value="${(record.store?c)!0}" placeholder="0" autocomplete="off" class="layui-input">
		  		</div>
		  		<div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
		  	</div>
		  	
		  	<div class="layui-form-item">
			  	<label class="layui-form-label">商品虚拟兑换量</label>
			    <div class="layui-input-inline" style="width:70%">
			        <input type="number" name="virtlSales" lay-verify="" value="${(record.virtlSales?c)!'100'}"  id="virtlSales" placeholder="0" autocomplete="off" class="layui-input">
		  		</div>
		  		<div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
		  	</div>
		  	  	<div class="layui-form-item">
			  	<label class="layui-form-label">商品实际兑换量</label>
			    <div class="layui-input-inline" style="width:70%">
			        <input type="text" name="realSales" lay-verify="required" value="${(record.realSales?c)!'0'}"  id="realSales" placeholder="0" autocomplete="off" class="layui-input" readonly="readonly">
		  		</div>
		  		<div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
		  	</div>
		  	 <div class="layui-form-item">
			  	<label class="layui-form-label">商品排序</label>
			    <div class="layui-input-inline" style="width:70%">
			        <input type="number" name="sortNum" lay-verify="" value="${(record.sortNum?c)!'99999'}"  id="sortNum" placeholder="0" autocomplete="off" class="layui-input">
		  		</div>
		  		<div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
		  	</div>



		  	<#-- old start
		  	<div class="layui-form-item">
                <label class="layui-form-label">商品限购策略</label>
                 <div class="layui-input-inline" style="width:70%">
                    <select name="goodsStrategyId" lay-verify="" id="goodsStrategyId">
                        <option value="">--请选择--</option>
                        <#if beanGoodsStrategyList??>
                            <#list beanGoodsStrategyList as beanGoodsStrategy>
                                <option value="${beanGoodsStrategy.id?c}"  <#if (record.goodsStrategyId)?? && record.goodsStrategyId==beanGoodsStrategy.id>selected="selected"</#if>>${beanGoodsStrategy.strategyName}</option>
                            </#list>
                        </#if>
                    </select>
                </div>
                <div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
            </div>
		  	<div class="layui-form-item">
			  	<label class="layui-form-label">是否需要品吸代金券兑换(非限购策略商品)</label>
			     <div class="layui-input-inline" style="width:70%">
			      	<select name="needCard" lay-verify="" id="needCard">
			      		<option value="">--请选择--</option>
			      		<option value="1" <#if (((record.needCard)!'') == '1')>selected="selected"</#if>>需要折扣券</option>
			      		<option value="0"  <#if (((record.needCard)!'') == '0')>selected="selected"</#if>>不需要折扣券</option>
			      	</select>
		  		</div>
		  		<div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
		  	</div>
		  	<div class="layui-form-item">
                <label class="layui-form-label">是否是实物</label>
                 <div class="layui-input-inline" style="width:70%">
                    <select name="virtlReal" lay-verify="required" id="virtlReal">
                        <option value="">--请选择--</option>
                        <option value="1" <#if (((record.virtlReal)!'') == '1')>selected="selected"</#if>>是实物</option>
                        <option value="0"  <#if (((record.virtlReal)!'') == '0')>selected="selected"</#if>>是虚拟商品</option>
                    </select>
                </div>
                <div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
            </div>
		  	<div class="layui-form-item">
			  	<label class="layui-form-label">所属分类</label>
			     <div class="layui-input-inline" style="width:70%">
			      	<select name="categoriesId" lay-verify="required" id="categoriesId">
			      		<option value="">--请选择--</option>
			      		<#if goodClassList??>
				      		<#list goodClassList as goodClass>
				      			<option value="${goodClass.id?c}"  <#if (record.categoriesId)?? && record.categoriesId==goodClass.id>selected="selected"</#if>>${goodClass.name}</option>
				      		</#list>
				      	</#if>
			      	</select>
		  		</div>
		  		<div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
		  	</div>

            old end -->
		  		
		  	<div class="layui-form-item">
			    <label class="layui-form-label">设置状态</label>
			    <div class="layui-input-inline" style="width:70%">
			      	<select name="status" lay-verify="required" id="status">
			      		<option value="">--请选择--</option>
			      		<option value="1" <#if (((record.status)!'') == '1')>selected="selected"</#if>>上架</option>
				  		<option value="0" <#if (((record.status)!'') == '0')>selected="selected"</#if>>下架</option>
			      	</select>
		  		</div>
		  		<div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
		  	</div>
		  	
		  	<div class="layui-form-item">
			  	<label class="layui-form-label">商品规格</label>
			    <div class="layui-textarea-inline" style="width:70%;margin-left:110px;">
			         <!-- 加载编辑器的容器 -->
					<textarea class="layui-textarea" name="goodDesc" id="goodDesc" style="display: none">  
						${(record.goodDesc)!''}
					</textarea>
		  		</div>
		  		<div class="layui-form-mid layui-word-aux"><span style="color:red;"></span></div>
		  	</div>
		  	<div class="layui-form-item">
			  	<label class="layui-form-label">商品详细</label>
			    <div class="layui-textarea-inline" style="width:70%;margin-left:110px;">
		  			<!-- 加载编辑器的容器 -->
					<textarea class="layui-textarea" name="goodDetail" id="goodDetail">  
						${(record.goodDetail)!}
					</textarea>
		  		</div>
		  		<div class="layui-form-mid layui-word-aux"><span style="color:red;"></span></div>
		  	</div>
		  	<div class="layui-form-item">
			    <div class="layui-input-block">
					<button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
				    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
			    </div>
		  	</div>
		</fieldset>
	</form>
	
	<!--图片预览--->
	<div id="preview" style="width:100%; height:100%; position:fixed; top: 50%; left:50%;
	-webkit-transform: translateX(-50%) translateY(-50%); opacity: 1;display: none; vertical-align:middle;">
		<ul style="width: 100%;height: 100%; overflow: hidden;text-align: center;display: table;float: left;position: relative;">
			<li style="display: table-cell;vertical-align: middle;height: 100%;width: 100%;">
		    	<img style="width: 22%;" id="preview_img" src="" alt=""/>
			</li>
		</ul>
	</div>
 	<script type="text/javascript" src="../../plugins/layui/layui.js?v=2"></script>
	<script type="text/javascript" src="../../js/jquery.min.js"></script>
	<script type="text/javascript">
			var fileExt = "";
			var extArr = ["jpg","png","gif"];
			//下面用于图片上传预览功能
			function setImagePreview() {
			debugger;
				//获取文件的扩展名
				var fileName = document.getElementById("pfile").value+"";
				var imagSize =  document.getElementById("pfile").files[0].size;
				/* if(imagSize > 505000){
					alert("您选择的图片大小超过规定大小，请重新选择");
					document.getElementById("pfile").value="";
					return false;
				} */
			    var lastIndex  = fileName.lastIndexOf(".");
			        fileExt = fileName.substring(lastIndex+1);
			    if(!checkFileExt(fileExt)){//如果图片格式校验格式不通过
			    	alert("图片的格式只能是jpg|png|gif");
			    	document.getElementById("pfile").value="";
			    	return;
			    }
	    
				//input
			    var docObj = document.getElementById("pfile");
				//img
			    var imgObjPreview = document.getElementById("previewPl");
			    //div
			    var divs = document.getElementById("imgDivPl");
			    if (docObj.files && docObj.files[0]) {
			        //火狐下，直接设img属性
			        imgObjPreview.style.display = 'block';
			        imgObjPreview.style.width = '100px';
			        imgObjPreview.style.height = '100px';
			        //imgObjPreview.src = docObj.files[0].getAsDataURL();
			        //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
			       imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
			    } else {
			        //IE下，使用滤镜
			        docObj.select();
			        var imgSrc = document.selection.createRange().text;
			        var localImagId = document.getElementById("localImag");
			        //必须设置初始大小
			        localImagId.style.width = "100px";
			        localImagId.style.height = "100px";
			        //图片异常的捕捉，防止用户修改后缀来伪造图片
			        try {
			            localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
			            localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
			        } catch(e) {
			            alert("您上传的图片格式不正确，请重新选择!");
			            return false;
			        }
			        imgObjPreview.style.display = 'none';
			        document.selection.empty();
			    }
			    //当图片校验通过时,清空原有的图片路径
			    return true;
		}
	
		//校验文件的扩展名
		function checkFileExt(fileExt){
			 var flag = false;
			 //循环比较
			 for(var i=0;i<extArr.length;i++){
		    	 if(extArr[i]==fileExt){
		    	   flag = true; //一旦找到合适的，立即退出循环
		    	   break;
		    	 }
			 }	
			 return flag;
		}
	
	function toPreview(src){
		document.getElementById("preview_img").src = src;
    	$('#preview').show();
	}
	$('#preview').on('click', function() {
    	$('#preview').hide();
	});
	</script>
	
	
	
	<script>
		var oldremainstore = $('#remainstore').val();
		 $('#addstore').blur(function() {
		 	  var  goodsNum = $(this).val();
		 	  if(goodsNum*1>99999){
		 	  	alert("新加库存不能大于99999");
		 	  	$(this).val(1);
				return false;
		 	  }
		      var remainstore = oldremainstore*1+goodsNum*1;
		      $('#remainstore').val(remainstore);
		 });
	
		var originalFile = "${(record.goodImage)!}";
	
		//Demo
		layui.use('form', function(){
		  var form = layui.form();
		  //监听提交
		  form.on('submit(formDemo)', function(data){
		  	if(!check()){return false;}
		  	var file = $("#pfile").val();
		  	if(originalFile == file){
		  		$("#pfile").val("");
		  	}  
		  	var regex = /^([\d]+(\.\d{1,2})?$)|^([1-9]+)$/;
		  	if($("#name").val()==''){
		  		alert("请输入商品名称");
				return false;
		  	}
		  	
		  	var score = $("#score").val();
		  	if(score==''){
		  		alert("乐豆数量不能为空");
		  		return false;
		  	}
		  	score = score.replace(',', '');
		  	if (!regex.test(score)){
		  		alert("请输正确的乐豆数量");
		  		return false;
		  	}
		  	$("#score").val(score);
		  	
		  	
		  	var store = $("#store").val();
		  	if(store==''){
		  		alert("确商品库存不能为空");
		  		return false;
		  	}
		  	store = store.replace(',', '');
		  	if (!regex.test(store)){
		  		alert("请输正确商品库存");
		  		return false;
		  	}
		  	$("#store").val(store);
		  	
		  	
		  	var needCard = $("#needCard").val();
		  	if(needCard==''){
		  		alert("请选择是否需要折扣券兑换商品");
		  		return false;
		  	}
		  	
		  	document.actionForm.action="${request.contextPath}/backpage/appointmentGoods/input";
	    	document.actionForm.submit();
		  })
		});
		
		function check(){
			var status = $("#status").val();
			if(status == ""){
				alert("请选择上下架状态");
				return false;
			}else{return true;}
		}
	</script>
	</body>
<script>
	layui.use('layedit', function(){
	 	 var layedit = layui.layedit,$ = layui.jquery;
	  
	 	 //设置图片
		  layedit.set({
			  uploadImage: {
			    url: '${request.contextPath}/backpage/upload/uploadFileImageEdit', //接口url
			    type: 'POST', //默认post
			     success: function (data) {
                    debugger;
                 }
			  }
		  });  

		  //商品详情
		  layedit.build('goodDetail', {
			   tool: [
			  'strong' //加粗
			  ,'italic' //斜体
			  ,'underline' //下划线
			  ,'del' //删除线
			  ,'|' //分割线
			  ,'left' //左对齐
			  ,'center' //居中对齐
			  ,'right' //右对齐
			  ,'link' //超链接
			  ,'unlink' //清除链接
			  ,'face' //表情
			  ,'image' //插入图片 ,'help' //帮助
			] ,height: 400
		  });
		  
		   //商品规格
		  layedit.build('goodDesc', {
			   tool: [
			  'strong' //加粗
			  ,'left' //左对齐
			  ,'center' //居中对齐
			  ,'right' //右对齐
			] ,height: 200
		  });
	});
	</script>
</html>