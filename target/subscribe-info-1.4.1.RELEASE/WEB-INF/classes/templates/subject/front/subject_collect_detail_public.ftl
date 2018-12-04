<!DOCTYPE html>
<html class="flex-layout">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black" />
		<meta name="format-detection" content="telephone=no" />
		<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
		<title>发表征集建议</title>
		<link rel="stylesheet" href="${pictureVisitUrl}/htgc/css/reset.css">
		<link rel="stylesheet" href="${pictureVisitUrl}/htgc/css/myStyle.css">
		<style type="text/css">
			@font-face {
		        font-family: 'PingFang';
		        src: url('${pictureVisitUrl}/htgc/images/PingFang Regular.ttf'),
			}
			
			.imgsdispalys{
	  		  width: 100%;
   			  padding: 20px 10px;
   			  display: -webkit-flex;
   			  display: flex;
   			 flex-direction: row;
    		 -webkit-flex-direction: row;
    		 flex-wrap: wrap;
   			 -webkit-flex-wrap: wrap;
   			 justify-content: left;
   			 align-items: center;
   			 -webkit-align-items: center;
   			 align-content: baseline;
   			 -webkit-align-content: baseline;
  			  overflow: hidden;
			}
			
			.phones li{
				position:relative;
				box-sizing: border-box;
    			flex: 0 0 100%;
   				margin-bottom: 10px;
   				max-width: 100%;
   				background-size: cover;
    			background-position: center;
    			background-repeat: no-repeat;
    			flex: 0 0 48%;
   				width: 160px;
    			height: 188px;
    			margin:3px 3px;
			}
			.delimg{
				     position: absolute;
  					 width: 45px;
  					 height: 45px;
   					 background-size: cover;
    				background: url(${pictureVisitUrl}/htgc/images/x.png);
    				background-size: cover;
   					 background-position: center;
   				 	right: -8px;
   				 	top: -12px;
   				 	z-index: 50;
   				 	border-radius: 63%;
			}
		</style>
	</head>
	
	<body style="background: #eef1f5; overflow: hidden;">
		<input type="hidden" name="topicId" id="topicId" value="${topicId}"/>
		<div class="flex" style="">
			<div class="body" style=" width: 100%; height: 100%; position: relative;">
				<div class="submitComment"><a href="javascript:submitContent();">发表</a></div>
				<textarea id="commentInput" class="commentInput" style="min-height:118px;margin-bottom: 1px;" name="" rows="10" cols="" maxlength="256" placeholder="说点什么吧，优质评论将会优先展示"></textarea>
				<div class="praiseTopicBox">
					<ul class="imgsdispalys phones">
					</ul>
				</div>
				<ul class="commentBottomMenu">
					<li><a href="javascript:chooseImages();"></a><span></span></li>
					<li><a href="javascript:chooseImages();"></a></li>
				</ul>
			</div>
		</div>
		
		
			
 			<!-- 活动奖励提示——弹窗HTML -->
		<div class="modal-comfirm"  style="display:none;">
		  	<div class="content_zhongjiang" style="background:#54a5f6;">
		  		<p class="changeLd">恭喜您获得奖励，请在我的获奖记录查看!</p>
		  		<div class="dragonImg"><img id="exchangeImg" src="${pictureVisitUrl}/ldsc/img/dragon.png" alt="" /></div>
		  		<div class="windowClose">确 定</div>
		  	</div>
		</div>
		<!-- 活动奖励提示HTML END-->
		
		
		<#include "/subject/front/subject_public.ftl"/> 
	</body>
	
	 <script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
	 <script src="${pictureVisitUrl}/js/common/emotions.js"></script>
	<script type="text/javascript">
		 wx.config({
	    		debug: false, 
	       		appId: '${jssdk.appid}',
		    	timestamp: '${jssdk.timeStamp}',
		   		nonceStr: '${jssdk.nonceStr}',
		    	signature: '${jssdk.sign}',
	       		jsApiList: ['getLocation', 'chooseImage', 'uploadImage', 'previewImage','onMenuShareTimeline','onMenuShareAppMessage','onMenuShareQQ','onMenuShareWeibo','onMenuShareQZone']
	    });
	    	
	    	
	
		function chooseImages() {
			var lengths = $('.phones').children().length;
			if(lengths>3){
				alert("最多上传4张图片");
				return;
			}
			wx.chooseImage({
				count: 4,
				sizeType: ['original', 'compressed'], // 可以指定是原图还是压缩图，默认二者都有
				sourceType: ['album', 'camera'], // 可以指定来源是相册还是相机，默认二者都有
				success: function (res) {
					var localIds = res.localIds; // 返回选定照片的本地ID列表，localId可以作为img标签的src属性显示图片
					if(localIds.length+lengths>4){
						alert("最多上传4张图片");
						return;
					}
					uploadImg(localIds);
				},
				error: function (XMLHttpRequest, textStatus, errorThrown) {
					alert("上传失败，请重新上传");
				}
				
			});
		}
		//具体上传图片
	var counnt = 0;
	function uploadImg(localIds) {
		if(localIds.length == 0){
			if(counnt>0){
				//alert("上传成功"+counnt);
				counnt = 0;
			}else{
				alert("上传失败，请重新上传");
			}
		}else{
		
		var localId = localIds.pop();
		wx.uploadImage({
			localId: localId, // 需要上传的图片的本地ID，由chooseImage接口获得
			isShowProgressTips: 1, // 默认为1，显示进度提示
			success: function (res) {
				var serverId = res.serverId;
				 setTimeout(function(){
					$.ajax({
						url: getBasePath()+"/frontpage/upload/uploadFileImage",
						dataType: "json",
						async: false,
						contentType: "application/x-www-form-urlencoded; charset=UTF-8",
						data: {"mediaId": serverId},
						type: "POST",
						timeout: 6000,
						success: function (data) {
							if(data!=null && data.code==0){
								createLiNotes(data.data.src);
								counnt++;
								//递归下载							
								uploadImg(localIds);
								return true;
							}else{
								//递归下载		
								uploadImg(localIds);
								return true;
							}
						},
						error: function (data) {
							//递归下载							
							uploadImg(localIds);
							return true;
						}
					},2000);
				});
			},
			fail: function (error) {
				alert("上传失败，请重新上传");
				return false;
			}
		});
		
		}
	}
	//上传成功创建新图片节点
	function createLiNotes(imgsuls){
			var str = '<li style="">'
			str+='<img style="height: 182px;width:300px;" src="${pictureVisitUrl}/'+imgsuls+'" onclick="previewImage(this);"/>'
			str+='<input type="hidden" name="imgs" value="'+imgsuls+'"/><i onclick="delimgs(this);" class="delimg"></i></li>';
			$('.phones').append(str);
	}
	
	//图片预览
	function previewImage(obj){
		var src ="${pictureVisitUrl}"+$(obj).siblings("input").val();
		wx.previewImage({
		      current: src,
		      urls: [src]
		});
	}
	//删除图片节点
	function delimgs(obj){
		$(obj).closest("li").remove();
	}
	
	//提交评论
	function submitContent(){
		var topicId = $("#topicId").val();
		 var imgsArray=new Array()
 		 $("input[name^='imgs']").each(function(i, el) {
   				// imgsArray[i] =$(this).val();
   				 imgsArray.push($(this).val());
   		  });
		if(topicId==null || topicId==''){
			alert("请从微信公众号进入");
			return;
		}
		var contents = $("#commentInput").val();
		if(contents==null || contents==''){
			alert("内容不能为空");
			return;
		}
		contents = utf16toEntities(contents);
		$.ajax({
			url : getBasePath()+'/frontpage/subjectCollectDetail/toContent',
			data : {
				"topicId":topicId,"imgUrls":JSON.stringify(imgsArray),"contents":contents
			},
			method : 'post',
			dataType : 'json',
			timeout:5000,
			async:false,
			success : function(data) {
				if (data!=null && data.status=='success') {
					alert("发表征集建议成功");
					window.location.href=getBasePath()+"/frontpage/subjectCollectDetail/collectDetail?id="+topicId;
					return;
				}
			},
			error : function() {
				
			}
		});
	}
	
</script>


    <script type="text/javascript">
		//关闭获奖提示框
		$(".windowClose").click(function(){
			window.location.href=getBasePath()+"/frontpage/subjectTopicDetail/topicDetail?id="+$("#topicId").val();
			$(".modal-comfirm").css("display","none");
		});
		
 	  </script>
</html>