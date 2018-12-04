<!DOCTYPE html>
<html class="flex-layout">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black" />
		<meta name="format-detection" content="telephone=no" />
		<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
		<title>${typeStr!'我的评论'}</title>
		<link rel="stylesheet" href="${pictureVisitUrl}/htgc/css/reset.css">
		<link rel="stylesheet" href="${pictureVisitUrl}/htgc/css/myStyle.css?v=1">
		<script src="${pictureVisitUrl}/js/common/jquery-2.1.4.js"></script>
		<script src="${pictureVisitUrl}/js/common/global.js"></script>
		<script src="${pictureVisitUrl}/js/common/basepath.js"></script>
		<script src="${pictureVisitUrl}/js/common/shareCommon.js"></script>
 		<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
		<style type="text/css">
			@font-face {
		        font-family: 'PingFang';
		        src: url('${pictureVisitUrl}/htgc/images/PingFang Regular.ttf'),
			}
		.words {
		    position: relative;
		    margin-bottom: 0px;
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
			.getPraise li>.orderUser>.faceImg{
					width: 50px;
					height: 50px;
					margin: 5px 20px 35px 8px;
				}
				.orderUserName{
					float: left;
					width: 500px;
				}
				.orderUserName>div{
					line-height: 36px;
					height: 36px;
					width: 100%;
					margin-top: -12px;
				}
				.orderUserName>span:nth-child(1){
					font-size: 24px;
					display: block;
				}
				.orderUserName>div:nth-child(2)>span:nth-child(1){
					font-size: 22px;
					color: #848e98;
					float: left;
					margin-top: 15px;
				}
			.huifuTopic{
				overflow: hidden;
				    background: #fff;
				}
				.huifuTopic>dd{
				    width: 400px;
				    padding-right: 0;
				
			}
		</style>
		
	</head>
	
	<body style="background: #fff; overflow: hidden;">
		<div class="flex">
			<div class="body" style=" width: 100%; height: 100%; position: relative; ">
				<div class="headClassify">
					<a href="${request.contextPath}/frontpage/center/index" class="backBtn"></a>
					   <span class="selectCommentType">${typeStr!'我的评论'}</span><span class="kuozhan"></span>
				</div>
				<div class="modal-comfirm"  style="display:none;">
					<ul class="commentClassify">
						<li <#if type??&&type=="0">class="currentComment"</#if>>我的评论</li>
						<li  <#if type??&&type=="1">class="currentComment"</#if>>所有评论</li>
						<li></li>
					</ul>
				</div>
				<ul class="getPraise">
				<#list page as content>
				     <li> 
						       <#if (content.parentId!=0)>    
						         <div class="overflowH">
						         <img class="faceImg" src="${content.headimgurl}" alt="" />
						         <div class="orderUserName">
						         <span>${content.nickName}</span>
						         <div><span>${(content.createTime?string('MM-dd HH:mm'))!}</span></div></div>
						         </div>
									<div class="praiseTopicBox">
										<div  class="words">
											<p class="myTalk">回复<span class="repalyName">@${content.parent.nickName}：</span>${content.contents}
											<#if (content.picJsonStr??)>&nbsp;<a href="javascript:void(0)" onclick="showPic($(this))">查看图片</a><input type="hidden" value='${content.picJsonStr}' /></#if>
											</p>
										</div>
										<ul class="praiseTime overflowH">
											<li>
											</li>
										</ul>
								<#else>
								    <div  class="overflowH">
								    <img class="faceImg" src="${content.headimgurl}" alt="" />
								     <div class="orderUserName">
								    <span>${content.nickName}</span>
								    <div><span>${(content.createTime?string('MM-dd HH:mm'))!}</span></div>
								    </div>
								    </div>
										<div class="praiseTopicBox">
											<div  class="words">
												<p class="myTalk">${content.contents}
<#if (content.picJsonStr??)>&nbsp;<a href="javascript:void(0)" onclick="showPic($(this))">查看图片</a><input type="hidden" value='${content.picJsonStr}' /></#if>
                                            </p>
											</div>
											<ul class="praiseTime overflowH">
												<li>
												</li>
											</ul>
								
								</#if>
							<div class="reply">
							      <#if (content.parentId!=0)>
							        <div class="replyLists">
										<p><span class="repalyName">@${content.parent.nickName}：</span>${content.parent.contents}<#if (content.parent.picJsonStr??)>&nbsp;<a href="javascript:void(0)" onclick="showPic($(this))">查看图片</a><input type="hidden" value='${content.parent.picJsonStr}' /></#if></p>
									</div>
							      </#if>
								<a href="${request.contextPath}/frontpage/subjectTopicDetail/topicDetail?id=${content.topicId}" style="padding:20px 20px 25px">
									<dl class="huatiBlock  <#if (content.parentId!=0)> huifuTopic  </#if>">
										<dt><img src="${pictureVisitUrl}/${content.topic.topicUrl}"/></dt>
										<dd>${content.topic.topicName}</dd>
									</dl>
								</a>
								
							</div>
						</div>
					</li>
				</#list>
				</ul>
				<span class="allContent">已显示全部内容</span>
			</div>
		</div>
	</body>
    <script>
$.fn.ready(function(){
        $('.selectCommentType').click(function(){
         $('.modal-comfirm').show();
      })
      $('.commentClassify').find('li').click(function(){
           $('.modal-comfirm').hide();
           var index = $(this).index();
           if(index==1){
              window.location.href="${request.contextPath}/frontpage/center/contentList?type=1"
           }else{
              window.location.href="${request.contextPath}/frontpage/center/contentList?type=0"
           }
      })
		getSignature('');
		  wx.config({
	    		debug: false, 
	       		appId: v_appid,
		    	timestamp: v_timestamp,
		   		nonceStr: v_noncestr,
		    	signature: v_signature,
	       		jsApiList: ['previewImage']
	   	 });
	   	 
	   	  window.previewImage=function(src){
				wx.previewImage({
		    	  current: src,
		     	  urls: src
	     });
	     }
	   	 window.showPic=function(o){
	   	   var data=o.siblings('input').val();
	   	   var obj = JSON.parse(data);
	   	   previewImage(obj);
	   	 }
	   
		
	});
		
   </script>
</html>