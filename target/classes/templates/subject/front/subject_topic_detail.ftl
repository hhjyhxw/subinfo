<!DOCTYPE html>
<html class="flex-layout">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black" />
		<meta name="format-detection" content="telephone=no" />
		<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
		<title>话题详情</title>
		<link rel="stylesheet" href="${pictureVisitUrl}/htgc/css/reset.css">
		<link rel="stylesheet" href="${pictureVisitUrl}/htgc/css/myStyle.css?v=3">
		<style type="text/css">
			@font-face {
		        font-family: 'PingFang';
		        src: url('${pictureVisitUrl}/htgc/images/PingFang Regular.ttf'),
			}
			<#-- 用于隐藏和释放话题的内容-->
			.maxLenths{
				max-height:280px;
			}
			<#-- 用于隐藏回复-->
			.replyContent{
  			      max-height: 100px;
    			  overflow: hidden;
			}
			
			<#-- 用于收起回复-->
			.closeReplyDetail{
				    display: block;
    				font-size: 24px;
    				color: #848e98;
    				background: url('${pictureVisitUrl}/htgc/images/turnRight.png') no-repeat 160px 8px;
   					margin-top: 5px;
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
  				  background-color:#80808052;
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
			.selectOne{
				color: blue;
    			width: 21%;
    			height: 42px;
   			 	line-height: 42px;
    			/*border-radius: 7%;*/
    			border-bottom: 2px solid blue;
    			text-align: center;
			}

            .topicContent>div>p{
                text-indent:0px;
			}
			.articleContent>p>img{
               display:inline;
			}
		</style>
		
	</head>
	
<body style="background: #eef1f5; overflow: hidden;">
		<input type="hidden" id="topicId" value="${subjectTopic.id}" />
		<input type="hidden" id="topicName" value="${subjectTopic.topicName}" />
			<!-- 当前页码 -->
		<input id="pageNo" type="hidden" value="1">
		<!-- 总页数 活动列表只取一页 -->
		<input id="totalPage" type="hidden" value="${(totalPage)!}">
		<div class="flex">
			<div class="body" style=" width: 100%; height: 100%;">
				<!--话题信息展示-->
				<div class="topticDetail bgWhite">
					<div class="detailPics"><img src="${pictureVisitUrl}/${(subjectTopic.topicUrl)!}" /></div>
					<p style="font-weight: bolder;margin:30px;"><span><h3>${subjectTopic.topicName}</h3></span></p>
					<ul class="voteSelect" <#if (subjectTopic.supportVote!='1')>style="display:none;"</#if> >
						<li>
							<span>正方：<i class="yesData">${(subjectTopic.agreeCount)!0}</i></span>
							<span class="voteYesSpan"></span>
						</li>
						<li>
							<span>反方：<i class="noData">${(subjectTopic.disagreeCount)!0}</i></span>
							<span class="voteNoSpan"></span>
						</li>
					</ul>
					<div class="topicContent overflowShow">
						<div class="articleContent maxLenths">
							${(subjectTopic.topicDetail)!}
							<#if subjectTopic.topicDetail?? && subjectTopic.topicDetail?length gt 51>
							<span class="articleOpenAll">展开全文<img src="${pictureVisitUrl}/htgc/images/open.png" alt="" /></span>
							<span class="articleUpDisNone" style="display:none;">收起全文<img src="${pictureVisitUrl}/htgc/images/open.png" alt="" /></span>
							</#if>
						</div>
					</div>
				</div>
				<!--话题信息展示end-->
				
				<!--评论信息展示-->
				<div class="friendDiscuss bgWhite">
					<p style="margin-bottom: 46px;"><span class="selectOne" id="all" style="float:left;">全部评论</span><label id="contentCount" style="float:left;margin-left:3px;">320</label><span id="jingxuan" style="float:right;">精选评论<label></label></span></p>
					<div class="noDiscuss" style="display: none;">
						<p><img src="${pictureVisitUrl}/htgc/images/sofa.png" alt="" /></p>
						<span>客官请上坐</span>
					</div>
					<div class="haveDiscuss">
						<ul class="getPraise">
							<#if contentList??>
							<#list contentList as content>
							<li>
								<div><img class="faceImg" src="${(content.headimgurl)!}" alt="" /><span>${(content.nickName)!}</span><#if '1'==content.toTop><span class="goodChoice">精选</span></#if></div>
								<div class="praiseTopicBox mLeft80">
									<div class="words" style="margin-bottom:50px;">
										<p class="myTalk">${(content.contents)!}</p>
										<#if content.contents?? && content.contents?length gt 51>
											<span class="openAll">展开全文<img src="${pictureVisitUrl}/htgc/images/open.png" alt="" /></span>
											<span class="upDisNone" style="display: none;">收起全文<img src="${pictureVisitUrl}/htgc/images/open.png" alt="" /></span>
										</#if>
									</div>
									<#if content.imgUrlsJsonList?? >
										<ul class="plImgDisplay plImgDisplay4">
											<#list content.imgUrlsJsonList as imglist>
												<li style="background-image: url(${pictureVisitUrl}/${imglist});"></li>
											</#list>
										</ul>
									</#if>
									<ul class="praiseTime overflowH">
											<li>${(content.createTime?string("yyyy-MM-dd HH:mm:ss"))!}</li>
											<li>
												<span class="thumbsYesSpan <#if (content.myThumsStatus?? && '1'==content.myThumsStatus) >sendPraise</#if>">${(content.upCount)!0}</span>
												<span class="thumbsNoSpan <#if (content.myThumsStatus?? && '0'==content.myThumsStatus)>sendStamp</#if>">${(content.downCount)!0}</span>
												<span class="toReplys">回复</span>
											</li>
											<input type="hidden" id="contentId" value="${content.id}" width="0"/>
									</ul>
									<!--回复信息展示-->
									<div class="reply" style="<#if content.sonContentCount==0>display:none;</#if>">
										<div class="replyLists">
											<div class="replyContent" style="display:block;" id="replyContent_${content.id}">
												<#if content.childrenList??>
													<#list content.childrenList as childrens>
														<p><span class="repalyName">${(childrens.nickName)!}：</span>${(childrens.contents)!}</p>
													</#list>
												</#if>
											</div>
											<span class="lookReplyDetail">
												<#if content.sonContentCount!=0>
													查看${(content.sonContentCount)!0}回复>
												</#if>
											</span>
											<span class="closeReplyDetail" style="display:none;">收起回复</span>
										</div>
									</div>
									<!--回复信息展示end-->
								</div>
								<!--praiseTopicBox  end-->
							</li>
							</#list>
							</#if>
						</ul>
						<span class="allContent border25" style="display:none;">已显示全部内容</span>
					</div>
					<!--haveDiscuss  end-->
					
					<div class="discussInput bgWhite">
						<span><i></i>发表评论</span>
					</div>
				</div>
				<!--评论信息展示 friendDiscuss end-->
				
			</div>
		</div>
		
 		<!-- 留言——弹窗HTML -->
		<div class="modal-comfirm" style="display:none;">
		  	<div class="content_zhongjiang reply_content">
		  		<div class="content_in">
		  			<p>你想对评论说点什么？</p>
		  			<textarea id="reContent" class="windowReply" name="" rows="" cols="" maxlength="300" placeholder="大家一起来留言喔！"></textarea>
		  			<#--存储 需要回复的 评论的  id-->
		  			<input type="hidden" id="toReplyContentId" value="" />
		  			<#--存储 需要回复的 评论的div id-->
    				 <input type="hidden" id="replyContentDom" value="" />
		  			<a href="#" class="windowBtn">提交</a>
		  		</div>
		  		<div class="windowClose"></div>
		  	</div>
		</div>
		<!-- 留言——弹窗HTML END-->
		
		<!-- 发表成功——没达到上线弹窗HTML -->
		<div class="modal-comfirm" id="contentSuccess" style="display:none;">
		  	<div class="content_zhongjiang noBgImg">
		  		<div class="publicContent">
		  			<div class="zmResult">
			  			<img src="${pictureVisitUrl}/htgc/images/icon_pubulicSeccess.png"/ width="80" height="80">
			  			<p>发表评论成功！</p>
			  			<p id="beanShow" style="display:none;">获得<span>5</span>个乐豆奖励</p>
	  				</div>
	  				<a href="javascript:closeSuccesssWidow();" class="btn_close">关闭</a>
		  		</div>
		  	</div>
		</div>
		<!-- 发表成功——没达到上线弹窗HTML END-->
		
		<!-- 评论框-->
		<div class="modal-comfirm"  id="sendBottomBox"  style="display:none;">
			<div class="sendBottomBox">
				<div class="inputsmallBox">
					<div class="smallBoxLeft" style="overflow: auto;">
						<#-- <input type="text"  placeholder="写评论"/> -->
						<textarea id="commentInput" class="" style="height:118px;width: 100%;border: 0px;" name="" rows="3" cols="" maxlength="256" placeholder="写评论"></textarea>
						<ul class="huifuImages smallImages" style="height:100px; display: block;overflow: auto;">
						</ul>
					</div>
					<div class="samllBoxRight">
						<a href="javascript:canelContent();" style="margin-left:25px;background:url(${pictureVisitUrl}/htgc/images/icon_close.png) no-repeat 0px 0px;"></a>
						<a href="javascript:submitContent();">发送</a>
					</div>
				</div>
				<ul class="commentBottomMenu" style="display:none;">
					<li style="width: 100%;"><a href="javascript:chooseImages();"></a><span></span></li>
					<#-- <li><a href="javascript:chooseImages();"></a></li> -->
				</ul>
			</div>
			<#-- contentTypes==1 发表评论 contentTypes==2发表回复 -->
			<input type="hidden" id="contentTypes" value="" />
		</div>
 			<!-- 评论框-->
 			
 			<#include "/subject/front/subject_public.ftl"/> 
 			<script src="${pictureVisitUrl}/js/common/dateutil.js"></script>
 			<script src="${pictureVisitUrl}/js/common/emotions.js"></script>
 			<script src="${pictureVisitUrl}/htgc/js/subjectTopicDetailUtil.js?v=3"></script>
 			<script src="${pictureVisitUrl}/htgc/js/subjectTopicDetail.js"></script>
 			<script src="${pictureVisitUrl}/js/common/shareCommon.js"></script>
 		   <script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
 	 			
	</body>
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
	   	 
		//评论列表中图片点击预览
		$(".body").on("click",".plImgDisplay4>li",function(){
			var src = $(this).css("backgroundImage").replace('url(','').replace(')','');
			previewImage(src);
			
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
	
	//提交评论
	function submitContent(){
		//contentType==1 发表评论 contentType==2发表回复
		var contentTypes = $("#contentTypes").val();
		//回复的评论Id
		var parentId = "";
		if(contentTypes==1){
			parentId = "";
		}else if(contentTypes==2){
			parentId = $("#toReplyContentId").val();
		}
		//话题id
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
			url : getBasePath()+'/frontpage/subjectTopicDetail/toContent',
			data : {
				"topicId":topicId,"imgUrls":imgUrls,"contents":contents,"parentId":parentId
			},
			method : 'post',
			dataType : 'json',
			timeout:5000,
			async:false,
			success : function(data) {
				var resultStr ="";
				if (data!=null && data.status=='success') {
					if(data.showStatus=='1'){
						$(".zmResult").find("p").eq(0).text("发表评论成功!");
						$("#beanShow").css("display","block");
						$("#contentSuccess").css("display","block");
						//置空类型状态
						$("#contentTypes").val("");
						//把新增的评论设置在前面
						resultStr = getResultString(resultStr,data.subjectTopicContent);
						$('.haveDiscuss .getPraise').prepend(resultStr)
					}else{
						$("#beanShow").css("display","none");
						if(contentTypes==2){
							$("#beanShow").css("display","none");
							$(".zmResult").find("p").eq(0).text("发表回复成功!");
							getSonContentJson(parentId,$("#replyContentDom").val());
							//置空回复的中间值：评论Id,评论id所在div id
							$("#toReplyContentId").val("");
							$("#replyContentDom").val("");
							//置空类型状态
							$("#contentTypes").val("");
						}else{
							$("#beanShow").css("display","none");
							$(".zmResult").find("p").eq(0).text("发表评论成功!");
							$("#contentSuccess").css("display","block");
							//window.location.reload();
							//把新增的评论设置在前面
							resultStr = getResultString(resultStr,data.subjectTopicContent);
							$('.haveDiscuss .getPraise').prepend(resultStr)
						}
						$("#contentSuccess").css("display","block");
					}
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
	
	<script>
			// 滚动到底部加载更多
			window.canLoad = true;
			window.maxScrollY = $(document).height() - $(window).height() - 50;
			$(".body").on('scroll touchmove', function(event) {
				if(window.scrollY >= maxScrollY && window.canLoad) {
					window.canLoad = false;
					//'.maidarif'为加载数据的父容器
					$('.haveDiscuss .getPraise').addClass('loading-after');
					setTimeout(function() {
						//当前页码
						var pageNo = document.getElementById("pageNo").value;
						//下一页页码
						pageNo = parseInt(pageNo) + 1;
						var totalPage = document.getElementById("totalPage").value;
						if(totalPage==null || totalPage==''){
							$('.haveDiscuss .getPraise').removeClass('loading-after');
							$('.allContent').css("display","block");
							return false;
						}
						if (pageNo > parseInt(totalPage)) {
							$('.haveDiscuss .getPraise').removeClass('loading-after');
							$('.allContent').css("display","block");
							return false;
						}
						$("#pageNo").val(pageNo);
						var toTop='';
						if($("#jingxuan").hasClass("selectOne")){
							toTop='1';
						}
						$.ajax({ 
							url: getBasePath()+'/frontpage/subjectTopicDetail/getTopticContentListJson',
							type: "POST",
							data:{"pageNo":pageNo,"topicId":$("#topicId").val(),"toTop":toTop},
							dataType: "json", 
							async:false,
							success: function(data){
								if(data!=null && data.list!=null){
									var resultStr = '';
									$.each(data.list, function(i, n){
										resultStr = getResultString(resultStr,n);
									});
								
			                        $('.haveDiscuss .getPraise').append(resultStr).removeClass('loading-after');
			                        window.canLoad = true;
			                        window.maxScrollY = $(document).height() - $(window).height() - 50;
								}
							}
		                   });
					}, 600)
				};
			});
		</script>
 	
</html>