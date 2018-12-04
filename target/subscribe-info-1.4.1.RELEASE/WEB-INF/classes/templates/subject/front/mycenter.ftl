<!DOCTYPE html>
<html class="flex-layout">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black" />
		<meta name="format-detection" content="telephone=no" />
		<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
		<title>个人中心</title>
		<link rel="stylesheet" href="${pictureVisitUrl}/htgc/css/reset.css">
		<link rel="stylesheet" href="${pictureVisitUrl}/htgc/css/center.css?v=1">
		<link rel="stylesheet" href="${pictureVisitUrl}/htgc/css/myStyle.css?v=2">
		<script src="${pictureVisitUrl}/js/common/jquery-2.1.4.js"></script>
		<script src="${pictureVisitUrl}/js/common/global.js"></script>
		<style type="text/css">
			@font-face {
		        font-family: 'PingFang';
		        src: url('${pictureVisitUrl}/htgc/images/PingFang Regular.ttf'),
			}
			.borderBottemLine{
				width: 90%;
				height: 2px;
				background: #fff;
				position: absolute;
				bottom: -25px;
				left: 0;
			}
			.userDate>li{
				width: 31%;
			}
			.userDate li.threeMenu{
				width: 38%;
			}
			
			.question{
				display: inline-block;
				width: 30px;
				height: 30px;
				border-radius: 15px;
				border: 1px solid #347afc;
				color: #5d8af8;
				text-align: center;
				line-height: 30px;
				font-size: 20px;
				padding-left: 1px;
				margin-left: 10px;
				font-weight: bold;
			}
			
		</style>
	</head>
	<body style="background: #eef1f5; overflow: hidden;">
		<div class="flex">
			<div class="body" style="width: 100%; height: 100%;">
				<div class="uCenterHead">
					<div class="overflowH pLeftRight20">
						<div class="photo">
							<div class="photoImg">
								<img src="${fans.headimgurl}" alt="" />
							</div>
						</div>
						<div class="userInfo float_l">
							<p>${fans.nickname}</p>
							<p>Lv${level.levelValue}.${level.levelName}</p>
						</div>
					</div>
				</div>
				<div style="padding:0 30px;">
					<div class="partBlock">
						<#--<span class="blueJB"></span>-->
						<ul class="userDate">
							<li>
								<p>评论数</p>
								<p>${contentCount}</p>
								<span class="line"></span>
							</li>
							<li>
								<p>贡献值</p>
								<p>${fans.smokeBean}</p>
								<span class="line"></span>
							</li>
							<li>
								<p>互动奖励<a class="question" href="${request.contextPath}/frontpage/center/rule">?</a></p>
								<p>${sumPrizeScore}</p>
							</li>
						</ul>
					</div>
					<div class="partBlock bgWhite" style="padding: 5px 30px; margin-bottom: 25px;">
						<#-- <span class="blueJB"></span>-->
						<div class="ldCenter">
							<span>我的乐豆</span>
							<span><font id="somkeCount">0</font></span>
						</div>
						<ul class="LDDate ">
							<li>
								<a href="http://wx.thewm.cn/integral/wxFans!getFansInfo.action?openId=${fans.openid}&visitConfirm=1">乐豆中心</a>
								<span class="line"></span>
							</li>
							<li>
							   <a href="http://wx.thewm.cn/integral/smokeBean!getDetailed.action?openId=${fans.openid}" >明细</a>
							</li>
						</ul>
					</div>
					<div class="partBlock mBottom100">
						<#-- <span class="blueJB"></span> -->
						<ul class="userMenu">
							<li><span class="icon1"></span><a href="${request.contextPath}/frontpage/center/contentList">评论</a></li>
							<li><span class="icon2"></span><a href="${request.contextPath}/frontpage/center/topicFootPrint">我的足迹</a></li>
							<li><span class="icon3"></span><a href="${request.contextPath}/frontpage/center/star_list?status=1">赞</a></li>
							<li><span class="icon4"></span><a href="${request.contextPath}/frontpage/center/step_list?status=1">踩</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		
	</body>
	
	<script>
	    $(document).ready(function(){
	        $.post("${request.contextPath}/frontpage/user/queryBeans",function(data){
	            $('#somkeCount').html(data.smokeBeansCount);
	        })
	    })
	</script>
</html>