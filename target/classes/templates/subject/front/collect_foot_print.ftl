<!DOCTYPE html>
<html class="flex-layout">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black" />
		<meta name="format-detection" content="telephone=no" />
		<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
		<title>我的足迹</title>
		<link rel="stylesheet" href="${pictureVisitUrl}/htgc/css/reset.css">
		<link rel="stylesheet" href="${pictureVisitUrl}/htgc/css/myStyle.css">
		<script src="${pictureVisitUrl}/js/jquery-2.1.4.js"></script>
		<script src="${pictureVisitUrl}/js/global.js"></script>
		<style type="text/css">
			@font-face {
		        font-family: 'PingFang';
		        src: url('${pictureVisitUrl}/htgc/images/PingFang Regular.ttf'),
			}

		</style>
		
	</head>
	
	<body style="background: #eef1f5; overflow: hidden;">
		<div class="flex">
			<div class="body" style=" width: 100%; height: 100%;">
				<div class="fontPrintTab">
					<span><i></i>话题足迹</span>
					<span  class="onDisplay"><i></i>征集足迹</span>
				</div>
				<!--话题足迹-->
				<ul class="topicPrint">
				<#list page.list as foot>
				    <li>
						<a href="${request.contextPath}/frontpage/subjectCollectDetail/collectDetail?id=${foot.topicId}">
							<dl class="unitTopic">
								<dt><img src="${pictureVisitUrl}/${foot.topic.topicUrl}"/></dt>
								<dd class="titleTopicPrint">
									<p>${foot.topic.topicName}</p>
									<span style="width: 100%;">${foot.topic.startTime?string('yyyy-MM-dd HH:mm')}~${foot.topic.endTime?string('yyyy-MM-dd  HH:mm')}</span>
								</dd>
							</dl>
						</a>
						<#if (foot.orders?size>0)>
						<div class="reward">
						   <#list foot.orders as order>
						    <#if (order.orderType=="0")>
							<p><span>发布内容奖励</span><span>${order.giftName}</span></p>
							</#if>
							 <#if (order.orderType=="1")>
							<p><span>话题采纳奖励</span><span>${order.giftName}</span></p>
							</#if>
							 <#if (order.orderType=="2")>
							<p><span>评论精华奖励</span><span>${order.giftName}</span></p>
							</#if>
							</#list>
						</div>
						</#if>
						
					</li>
				</#list>
				</ul>
				<!--话题足迹  END-->
			</div>
		</div>
		
	</body>
    <script>
       $('.fontPrintTab').find('span').click(function(){
           var index = $(this).index();
           if(index==0){
              window.location.href="${request.contextPath}/frontpage/center/topicFootPrint";
           }
       })
    </script>
</html>