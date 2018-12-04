<!DOCTYPE html>
<html class="flex-layout">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black" />
		<meta name="format-detection" content="telephone=no" />
		<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
		<title>征集详情</title>
		<link rel="stylesheet" href="${pictureVisitUrl}/htgc/css/reset.css">
		<link rel="stylesheet" href="${pictureVisitUrl}/htgc/css/myStyle.css?v=3">
		<style type="text/css">
			@font-face {
		        font-family: 'PingFang';
		        src: url('${pictureVisitUrl}/htgc/images/PingFang Regular.ttf'),
			}
			
			.maxHeights{
				max-height: 250px;
				overflow: hidden;
			}
			<#--对评论进行回复的弹框-->
			.reply_content {
   				 font-size: 1.4rem;
    			 padding: 1.5rem;
  				  width: 80%;
   				 box-sizing: border-box;
   				 position: absolute;
   				 left: 10%;
  				  top: 30%;
  				  vertical-align: middle;
  				  background-color:white;
   				 border-radius: 5px;
			}
			
			.reply_content .btn-close {
   				display: block;
 				width: 43%;
   				height: 4rem;
    			line-height: 4rem;
   				margin-top: 1.5rem;
    			text-align: center;
   				background-color: #2671fe7d;
    			color: #fff;
   				border-radius: 4px;
			}
			
			.collectionCon>h3 {
   	 	padding: 36px 33px;
    	width: 100%;
    	box-sizing: border-box;
    	line-height: 50px;
    	font-size: 32px;
    	color: #000;
    	font-weight: bold;
    	text-align: center;
	}
		</style>
		
	</head>
	
	<body style="background: #fff; overflow: hidden;">
		<div class="flex">
			<div class="body" style=" width: 100%; height: 100%;">
				<a href="#" class="bannerImg">
					<img src="${pictureVisitUrl}/${(collectTopic.topicUrl)!}" />
				</a>
				<div class="collectionCon pLeftRight20">
					<div></div>
					<p style="font-weight: bolder;"><span><h3>主题：${(collectTopic.topicName)!}</h3></span></p>
					<div>
						<div class="words">
							<p class="myTalk maxHeights" style="padding: 0 20px;">${(collectTopic.topicDetail)!}</p>
							
								<#if collectTopic.topicDetail?? && collectTopic.topicDetail?length gt 51>
									<span class="openAll" style="text-align: center;">展开全文<img src="${pictureVisitUrl}/htgc/images/open.png" alt="" /></span>
									<span class="upDisNone" style="display: none;text-align: center;">收起全文<img src="${pictureVisitUrl}/htgc/images/open.png" alt="" /></span>
								</#if>
							
						</div>
						<span style="font-size:23px;text-align: center;margin-bottom:200px;">时间：${collectTopic.startTime?string("yyyy-MM-dd HH:mm:ss")!} - ${collectTopic.endTime?string("yyyy-MM-dd HH:mm:ss")!}</span>
					</div>
				</div>
			</div>
		</div>
		<div class="discussInput bgWhite" style="padding:13px 25px 39px 25px;">
            <span style="height: 58px;line-height: 58px;font-size: 30px;"><i></i>提交你的征集</span>
        </div>
		<#--
		<div style="margin-top: 100px;height:300px;">
			<a href="javascript:openCollection();" class="submitYouCollection" style="position: fixed; bottom: 0; right: 0; left: 0;">提交你的征集</a>
		</div>
		-->
		
		
			<#-- 征集建议框 
			<div class="reply-alert" style="background-color: rgba(0, 0, 0, 0.6);display:none;">
   				<div class="reply_content">
    				 <p><textarea id="reContent" style="background: #f2f3f5;width:100%;height:237px;line-height:30px;font-size: 30px;border-radius: 2%;border-width: 0px;"  maxlength="255"></textarea>
    				 	<input type="hidden" id="topicId" value="${(collectTopic.id)!}" />
    				 </p>
     			 	 <a href="javascript:void(0)" style="float:left;" class="btn-close cancel">取消</a>
     			 	 <a href="javascript:void(0)" style="float:right;"  class="btn-close submitContent">提交</a>
   				</div>
 			</div> 
 			-->
 			<!-- 征集建议框 end -->
 			
 			
		<!-- 发表成功——没达到上线弹窗HTML -->
		<div class="modal-comfirm" id="contentSuccess" style="display:none;">
		  	<div class="content_zhongjiang noBgImg">
		  		<div class="publicContent">
		  			<div class="zmResult">
			  			<img src="${pictureVisitUrl}/htgc/images/icon_pubulicSeccess.png"/ width="80" height="80">
			  			<p>提交成功！</p>
			  			<p id="beanShow" style="display:none;">获得<span>5</span>个乐豆奖励</p>
	  				</div>
	  				<a href="javascript:closeSuccesssWidow();" class="btn_close">关闭</a>
		  		</div>
		  	</div>
		</div>
		<!-- 发表成功——没达到上线弹窗HTML END-->
		
		<!-- 评论框-->
		<div class="modal-comfirm"  id="sendBottomBox"  style="display:none;z-index:2">
				<input type="hidden" id="topicId" value="${(collectTopic.id)!}" />
			<div class="sendBottomBox" style="z-index:3;">
				<div class="inputsmallBox">
					<div class="smallBoxLeft" style="overflow: auto;">
						<textarea id="commentInput" class="" style="height:118px;width: 100%;border: 0px;" name="" rows="3" cols="" maxlength="256" placeholder="提交你的征集"></textarea>
						<ul class="huifuImages smallImages" style="height:100px; display: block;overflow: auto;">
						</ul>
					</div>
					<div class="samllBoxRight">
						<a href="javascript:canelContent();" style="margin-left:25px;background:url(${pictureVisitUrl}/htgc/images/icon_close.png) no-repeat 0px 0px;"></a>
						<a href="javascript:submitContent();">发送</a>
					</div>
				</div>
				<ul class="commentBottomMenu">
						<li style="width: 100%;"><a href="javascript:chooseImages();"></a><span></span></li>
                    	<#-- <li><a href="javascript:chooseImages();"></a></li> -->
				</ul>
			</div>
		</div>
 			<!-- 评论框-->
 	
	</body>
	<#include "/subject/front/subject_public.ftl"/> 
 	<script src="${pictureVisitUrl}/js/common/dateutil.js"></script>
 	<script src="${pictureVisitUrl}/js/common/emotions.js"></script>
 	<script src="${pictureVisitUrl}/htgc/js/subjectCollectDetail.js"></script>
 	<script src="${pictureVisitUrl}/js/common/shareCommon.js"></script>
 	<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
 	<script type="text/javascript">
 		$.fn.ready( function(){
			 getSignature('');
		  wx.config({
	    		debug: false, 
	       		appId: v_appid,
		    	timestamp: v_timestamp,
		   		nonceStr: v_noncestr,
		    	signature: v_signature,
	       		jsApiList: ['chooseImage', 'uploadImage','previewImage']
	   	 });
		
	});
		//关闭发表成功弹窗
		function closeSuccesssWidow(){
			$("#contentSuccess").css("display","none");
		}
		//删除图片节点
		function delimgs(obj){
			$(obj).closest("li").remove();
		}
	    //图片预览
			function previewImage(src){
				wx.previewImage({
		    	  current: src,
		     	 urls: [src]
			});
		}
	//选择图片
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
			str+='<img src="${pictureVisitUrl}/'+imgsuls+'" />'
			str+='<input type="hidden" name="imgs" value="'+imgsuls+'" />'
			str+='<span onclick="delimgs(this);"></span></li>';
			$('.smallImages').append(str);
	}
	
	////打开输入框
	function openCollection(){
		//打开评论框  并且 获取评论框焦点
		$("#sendBottomBox").css("display","block");
		//获取焦点
		$("#commentInput").focus();
	}
	$(".discussInput").click(function(){
        //打开评论框  并且 获取评论框焦点
        $(this).css("display","none");
        $("#sendBottomBox").css("display","block");
        //获取焦点
        $("#commentInput").focus();
	});
	//取消评论
	function canelContent(){
		$(".sendBottomBox").css("bottom","0");
		$("#sendBottomBox").css("display","none");
		$("#commentInput").val("");
		$(".huifuImages").html("");
		$(".discussInput").css("display","block");
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
		$("#sendBottomBox").css("display","none");
		var imgUrls = "";
        if (imgsArray === undefined || imgsArray.length == 0) {
            imgsArray = "";
        }else{
            imgUrls = JSON.stringify(imgsArray);
        }
		$.ajax({
			url : getBasePath()+'/frontpage/subjectCollectDetail/toContent',
			data : {
				"topicId":topicId,"imgUrls":imgUrls,"contents":contents
			},
			method : 'post',
			dataType : 'json',
			timeout:5000,
			async:false,
			success : function(data) {
				if (data!=null && data.status=='success') {
				    if(data.showStatus=='1'){
				        $("#beanShow").css("display","block");
				    }else{
				      $("#beanShow").css("display","none");
				    }
					$("#contentSuccess").css("display","block");
					//window.location.href=getBasePath()+"/frontpage/subjectCollectDetail/collectDetail?id="+topicId;
					//return;
				}
				//置空内容
				$("#commentInput").val("");
				$(".smallImages").html("");
				$(".discussInput").css("display","block");
			},
			error : function() {
			    $(".discussInput").css("display","block");
			}
		});
	}
	
	</script>

</html>