<!DOCTYPE html>
<html class="flex-layout">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black" />
		<meta name="format-detection" content="telephone=no" />
		<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
		<title>评论详情</title>
		<link rel="stylesheet" href="${pictureVisitUrl}/htgc/css/reset.css">
		<link rel="stylesheet" href="${pictureVisitUrl}/htgc/css/myStyle.css">
		<style type="text/css">
			@font-face {
		        font-family: 'PingFang';
		        src: url('${pictureVisitUrl}/htgc/images/PingFang Regular.ttf'),
			}
			.kuozhan{
				display: inline-block;
				width: 20px;
				height: 20px;
				border-left: 2px solid #fff;
				border-top: 2px solid #fff;
				margin: 0 0 5px 15px;
				transform: rotate(-135deg);
			}
			<#-- 底部-->
			.footerss{
  			    position: fixed;
    			bottom: 0;
    			left: 0;
   				right: 0;
   				width:100%;
  			    border-top: 1px solid #f2f3f5;
			}
			.loading-after {
				position: relative;
			}

			.loading-after:after {
				content: '';
				display: block;
				width: 3px;
				height: 3px;
				border-radius: 100%;
				box-shadow: 0 -10px 0 1px currentColor, 10px 0px currentColor, 0 10px currentColor, -10px 0 currentColor, -7px -7px 0 0.5px currentColor, 7px -7px 0 1.5px currentColor, 7px 7px currentColor, -7px 7px currentColor;
				/* left-bottom */
			-webkit-animation: spin 1s steps(8) infinite;
				animation: spin 1s steps(8) infinite;
				/*center*/
				margin: 2rem auto 2rem 52%;
			}	
		</style>
		
	</head>
	
	<body style="background: #f5f5f5; overflow: hidden;">
		<input type="hidden" id="topicId" value="${subjectTopicContent.topicId}" />
		<input type="hidden" id="contentId" value="${subjectTopicContent.id}" />
		<input type="hidden" id="topicName" value="${subjectTopicContent.topicName}" />
			<!-- 当前页码 -->
		<input id="pageNo" type="hidden" value="1">
		<!-- 总页数 活动列表只取一页 -->
		<input id="totalPage" type="hidden" value="">
		
		<div class="flex">
			<div class="body" style=" width: 100%; height: 100%; position: relative; ">
				<div class="headClassify checkSee">
					<label id="totalCount">0</label>条回复
				</div>
				<div class="myWords">
					<div class="overflowH"><img class="faceImg"  src="${(subjectTopicContent.headimgurl)!}"  alt="" /><span>${(subjectTopicContent.nickName)!}</span></div>
					<div class="mLeft80">
						<div  class="words">
							<p class="myTalk">${(subjectTopicContent.contents)!}</p>
							<#if subjectTopicContent.contents?? && subjectTopicContent.contents?length gt 51>
								<span class="openAll">展开全文<img src="${pictureVisitUrl}/htgc/images/open.png" alt="" /></span>
								<span class="upDisNone" style="display: none;">收起全文<img src="${pictureVisitUrl}/htgc/images/open.png" alt="" /></span>
							</#if>
						</div>
						<ul class="praiseTime overflowH">
							<li>${(subjectTopicContent.createTime?string("yyyy-MM-dd HH:mm:ss"))!}</li>
							<li id="toContent">回复</li>
						</ul>
					</div>
				</div>
				<ul class="getPraise">
				</ul>
				<span class="allContent">已显示全部内容</span>
				<div class="discussInput bgWhite">
					<span><i></i>回复评论</span>
				</div>
			</div>
		</div>
		
		
			<!-- 发表成功——没达到上线弹窗HTML -->
		<div class="modal-comfirm" id="contentSuccess" style="display:none;">
		  	<div class="content_zhongjiang noBgImg">
		  		<div class="publicContent">
		  			<div class="zmResult">
			  			<img src="${pictureVisitUrl}/htgc/images/icon_pubulicSeccess.png"/ width="80" height="80">
			  			<p>发表回复成功！</p>
	  				</div>
	  				<a href="javascript:closeSuccesssWidow();" class="btn_close">关闭</a>
		  		</div>
		  	</div>
		</div>
		<!-- 发表成功——没达到上线弹窗HTML END-->
		
		
		<!-- 评论框-->
		<div class="modal-comfirm"  id="sendBottomBox"  style="display:none;">
			<div class="sendBottomBox" style="height:200px;">
				<div class="inputsmallBox">
					<div class="smallBoxLeft" style="overflow: auto;">
						<textarea id="commentInput" class="" style="height:118px;width: 100%;border: 0px;" name="" rows="3" cols="" maxlength="256" placeholder="写评论"></textarea>
						<ul class="huifuImages smallImages" style="height:100px; display: block;overflow: auto;">
						</ul>
					</div>
					<div class="samllBoxRight">
						<a href="javascript:canelContent();" style="margin-left:25px;background:url(${pictureVisitUrl}/htgc/images/icon_close.png) no-repeat 0px 0px;"></a>
						<a href="javascript:submitContent();">发送</a>
					</div>
				</div>
				<#--
				<ul class="commentBottomMenu" style="display:none;">
					<li><a href="javascript:chooseImages();"></a><span></span></li>
					<li><a href="javascript:chooseImages();"></a></li>
				</ul> -->
			</div>
			<#-- contentTypes==1 发表评论 contentTypes==2发表回复 -->
			<input type="hidden" id="contentTypes" value="" />
			
			<#--存储 需要回复的 子评论的  id-->
		  	<input type="hidden" id="toReplyContentId" value="" />
		  	<#--存储 需要回复的 子评论的div id-->
    		<input type="hidden" id="replyContentDom" value="" />
		</div>
 			<!-- 评论框-->
 			
		
			<#include "/subject/front/subject_public.ftl"/> 
 			<script src="${pictureVisitUrl}/js/common/dateutil.js"></script>
 			<script src="${pictureVisitUrl}/js/common/emotions.js"></script>
 			<script src="${pictureVisitUrl}/htgc/js/subjectContentDetail.js?v=6"></script>
 			<script src="${pictureVisitUrl}/js/common/shareCommon.js"></script>
	</body>
	
	 	<script>
			// 滚动到底部加载更多
			window.canLoad = true;
			window.maxScrollY = $(document).height() - $(window).height()+100;
			$(".body").on('scroll mousewheel', function(event) {
				if(window.scrollY <= maxScrollY && window.canLoad) {
					window.canLoad = false;
					$('.getPraise').addClass('loading-after');
					var htmlStr = '';
					setTimeout(function() {
						//当前页码
						var pageNo = document.getElementById("pageNo").value;
						//下一页页码
						pageNo = parseInt(pageNo) + 1;
						var totalPage = document.getElementById("totalPage").value;
						if(totalPage==null || totalPage==''){
							$('.getPraise').removeClass('loading-after');
							$('.allContent').css("display","block");
							return false;
						}
						if (pageNo > parseInt(totalPage)) {
							$('.getPraise').removeClass('loading-after');
							$('.allContent').css("display","block");
							return false;
						}
						$("#pageNo").val(pageNo);
						var parentId = $("#contentId").val();
							$.ajax({ 
								url : getBasePath()+'/frontpage/subjectContentDetail/getSubjectTopicContentSonListJson',
								data : {
									"parentId":parentId,"pageNo":pageNo
								},
								type: "POST",
								dataType: "json", 
								async:false,
								success: function(data){
									var resultString = '';
									resultString = getResultString(data.list);
			                       	$('.getPraise').append(resultString).removeClass('loading-after');
									window.canLoad = true;
									window.maxScrollY = $(document).height() - $(window).height()+10;
								}
		                   });
					},1000)
				};
			});
			
		//关闭发表成功弹窗
		function closeSuccesssWidow(){
			$("#contentSuccess").css("display","none");
		}		
			
			//提交评论
	function submitContent(){
		//contentType==1 发表评论 contentType==2发表回复
		var contentTypes = $("#contentTypes").val();
		//回复的评论Id
		var parentId = $("#contentId").val();
		//同级回复id
		var siblingsId = "";
		if(contentTypes==2){
			siblingsId = $("#toReplyContentId").val();
		}
		//话题id
		var topicId = $("#topicId").val();
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
		$.ajax({
			url : getBasePath()+'/frontpage/subjectTopicDetail/toContent',
			data : {
				"topicId":topicId,"contents":contents,"parentId":parentId,"siblingsId":siblingsId,"imgUrls":""
			},
			method : 'post',
			dataType : 'json',
			timeout:5000,
			async:false,
			success : function(data) {
				if (data!=null && data.status=='success') {
					var resultStr="";
					resultStr = getResultObjString(data.subjectTopicContent);
					$('.getPraise').prepend(resultStr)
					$("#contentSuccess").css("display","block");
					//置空内容
					$("#commentInput").val("");
					$(".smallImages").html("");
					//置空类型状态
					$("#contentTypes").val("");
				}
			},
			error : function() {
				
			}
		});
	}
		
		</script>

</html>