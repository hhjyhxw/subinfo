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
		<link rel="stylesheet" href="${pictureVisitUrl}/ldsc/css/reset.css">
		<link rel="stylesheet" href="${pictureVisitUrl}/ldsc/css/myStyle.css">
		<style type="text/css">
			@font-face {
		        font-family: 'PingFang';
			}

		</style>
		
	</head>
	
	<body style="background: #fff; overflow: hidden;">
		<div class="flex menu">
			<div class="body" style=" width: 100%; height: 100%;">
				<div class="photo">
					<img src="${beanFans.headimgurl}" alt="" />
					<span class="userName"></span>
				</div>
				<div class="userInfo">
					<p>${beanFans.nickname}</p>
					<p id="smokeBeansCount">乐豆 0</p>
				</div>
				<ul class="userMenu  overflowS">
					<li><a href="${request.contextPath}/frontpage/beanOrder/myOrderList">我的订单</a></li>
					<li><a href="${request.contextPath}/frontpage/myCard/cardTypeList">我的卡券</a></li>
					<li><a href="${request.contextPath}/frontpage/address/getAddrList">地址管理</a></li>
				</ul>
			</div>
			<ul class="bottomMenu">
				<li><a href="${request.contextPath}/frontpage/beanGoods/goodsList">首页</a></li>
				<li><a href="#">个人中心</a></li>
			</ul>
		</div>
		
	</body>
	<#include "/front/public.ftl"/>  
	<script src="${pictureVisitUrl}/ldsc/js/myCenter.js"></script>
</html>