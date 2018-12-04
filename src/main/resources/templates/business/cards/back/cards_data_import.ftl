<!doctype html>
<html>

	<head>
		<meta charset="utf-8">
		<title>卡密数据导入</title>
		<link rel="stylesheet" href="../../plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="../../css/global.css" media="all">
		<link rel="stylesheet" href="../../plugins/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="../../css/table.css" />
		<link rel="stylesheet" href="../../layui/dist/css/layui.css"  media="all">
	</head>

	<body>
	<form class="layui-form" action="" name="actionForm" method="POST" enctype="multipart/form-data" id="formData">
		<fieldset class="layui-elem-field" style="width: 60%; text-align: center; margin-left: 20%;">
			<legend>卡密数据导入</legend>
			<div class="layui-form-item">
		  	</div>
  			<div class="layui-form-item" style="font-size:18px;">
			    <label class="layui-form-label">数据文件:</label>
			   	<div class="layui-input-inline" style="width:70%">
				   	<div class="layui-form-mid layui-word-aux">
				   		<input type="file" name="fileName" id="pfile">
				   	</div>
				   	<div class="layui-form-mid layui-word-aux">
		  		    <a href="${request.contextPath}/backpage/cardSecrect/downloadModel.do" style="font-size:16px;color:blue;">下载模板</a>
		  		</div>
		  		</div>
		  		
		  	</div>
		  	
		  	<div class="layui-form-itm">
		  	    <div class="layui-input-block">
		  	       <p style="font-size:20px;color:red;">${errmsg!""}</p>
		  	    </div>
		  	   
		  	</div>
		  	
		  	<div class="layui-form-item">
			    <div class="layui-input-block">
					<button class="layui-btn" lay-submit lay-filter="formDemo" onclick="doSubmit()">开始导入</button>
				    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
			    </div>
		  	</div>
		</fieldset>
	</form>

 	<script type="text/javascript" src="../../plugins/layui/layui.js?v=2"></script>
	<script type="text/javascript" src="../../js/jquery.min.js"></script>
	<script>
	   
	   function doSubmit(){
	      
	      //获取选择的文件名
	      var file = $('#pfile').val();
	      if(file == ''){
	        alert("请选择文件！");
	        return false;
	      }
	      
	      //获取文件的扩展名
	      var fileEtx = file.substring(file.lastIndexOf('.')+1);
	      if(fileEtx != 'xlsx' && fileEtx != 'xls'){
	        alert("请选择正确的excel文件！");
	        return false;
	      }
	      
	      document.actionForm.action="${request.contextPath}/backpage/cardSecrect/importExcel.do";
	      document.actionForm.submit();
	      
	   }
	    
	</script>
</html>