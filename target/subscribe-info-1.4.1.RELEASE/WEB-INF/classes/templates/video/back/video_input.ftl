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
		<input type="hidden" name="imagesUrl" value="${pictureVisitUrl}${(record.imagesUrl)!}">
		<fieldset class="layui-elem-field" style="width: 60%; text-align: center; margin-left: 20%;">
			<legend><#if (record.id)??>编辑<#else>添加</#if></legend>
			<div class="layui-form-item">
		  	</div>
  			<div class="layui-form-item">
			    <label class="layui-form-label">封面图片</label>
			   	<div class="layui-input-inline" style="width:70%">
				   	<div class="layui-form-mid layui-word-aux">
				   		<input type="file" name="pfile" id="pfile" onchange="javascript:setImagePreview();">
				   	</div>
			   		<div id="pShow" style="width:100px; height:100px; overflow:hidden;">      
						<div id="imgDivPl">
							<#if record?? && (record.imagesUrl)??>
								<img id="previewPl" src="${request.contextPath}${(record.imagesUrl)!}" width="100" height="100" onclick="toPreview(this.src)"/>
							<#else>
									<img id="previewPl" src=" width="100" height="100" onclick="toPreview(this.src)"/>
							</#if>
	               		</div>   		
					</div>
		  		</div>
		  	</div>
  			<div class="layui-form-item">
				<label class="layui-form-label">标题</label>
			    <div class="layui-input-inline" style="width:70%">
			        <input type="text" name="title" lay-verify="" id="title" value="${(record.title)!}" placeholder="标题" autocomplete="off" class="layui-input">
		  		</div>
		  		<div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
		  	</div>
		
		  	<div class="layui-form-item">
			  	<label class="layui-form-label">视频描述</label>
			    <div class="layui-input-inline" style="width:70%">
			        <input type="text" name="videoDesc" lay-verify=""  id="videoDesc" value="${(record.videoDesc)!}" placeholder="视频描述" autocomplete="off" class="layui-input">
		  		</div>
		  		<div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
		  	</div>
		  	<div class="layui-form-item">
			  	<label class="layui-form-label">播放地址</label>
			    <div class="layui-input-inline" style="width:70%">
			        <input type="text" name="videoAddress" lay-verify="" id="videoAddress" value="${(record.videoAddress)!}" placeholder="视频播放地址" autocomplete="off" class="layui-input">
		  		</div>
		  		<div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
		  	</div>
		  	<div class="layui-form-item">
			  	<label class="layui-form-label">播放时间</label>
			    <div class="layui-input-inline" style="width:70%">
			        <input type="text" name="playTime" lay-verify="" id="playTime" onclick="layui.laydate({elem: this, istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" value="${(record.playTime?string("yyyy-MM-dd HH:mm:ss"))!}" placeholder="首播时间" autocomplete="off" class="layui-input">
		  		</div>
		  		<div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
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
		
	
		var originalFile = "${(record.imagesUrl)!}";
	
		//Demo
		layui.use('form', function(){
		  var form = layui.form();
		  //监听提交
		  form.on('submit(formDemo)', function(data){

		  	var file = $("#pfile").val();
		  	if(originalFile == file){
		  		$("#pfile").val("");
		  	}  

            var title = $("#title").val();
		  	if(title == ''){
		  		alert("请输入视屏标题");
				return false;
		  	}
		  	
		  	
		  	var videoAddress = $("#videoAddress").val();
		  	if(videoAddress==''){
		  		alert("请输入视屏播放链接");
		  		return false;
		  	}
		  	
		  	var playTime = $("#playTime").val();
		  	if(playTime==''){
		  		alert("请选择视屏的播放时间");
		  		return false;
		  	}

		  		playTimse = $("input[name$='playTime']").val();
		  		debugger;
		  	document.actionForm.action="${request.contextPath}/backpage/video/save";
	    	document.actionForm.submit();
		  })
		});
		
		
	</script>
	</body>
<script>
	layui.use('layedit', function(){
	 	 var layedit = layui.layedit,$ = layui.jquery;
	  
	 	 //设置图片
		  layedit.set({
			  uploadImage: {
			    url: '${request.contextPath}/backpage/upload/uploadGoodsImage', //接口url
			    type: 'POST' //默认post
			  }
		  });  
	 
		  
		  layui.use('laydate', function(){
			  var laydate = layui.laydate;
		  
		  var playTime = {
			    min: laydate.now()
			    ,max: '2099-06-16 23:59:59'
			    ,istoday: false
			    ,choose: function(datas){
			      end.min = datas; //开始日选好后，重置结束日的最小日期
			      end.start = datas //将结束日的初始值设定为开始日
			    }
			  };
		  });
	});
	</script>
</html>