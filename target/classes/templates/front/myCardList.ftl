<!DOCTYPE html>
<html class="flex-layout">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black" />
		<meta name="format-detection" content="telephone=no" />
		<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
		<title>品吸代金券</title>
		<link rel="stylesheet" href="${pictureVisitUrl}/ldsc/css/reset.css">
		<link rel="stylesheet" href="${pictureVisitUrl}/ldsc/css/myStyle.css?v=2">
		<style type="text/css">
			@font-face {
		        font-family: 'PingFang';
			}

		</style>
	</head>
	
	<body style="background: #e4ecff; overflow: hidden; width: 100%;">
		<div class="flex">
			<div class="oderHead">我的卡券</div>
			<div class="orderTab">
				<h2 class="orderStateTab">
					<span class="tabItem onOrderState" id="2"><i></i>全部卡券</span>
					<span class="tabItem" id="0">未使用</span>
					<span class="tabItem" id="1">已使用</span>
				</h2>
				<div class="body p100">
					
				</div>
			</div
		</div>
		
	</body>
	<#include "/front/public.ftl"/>  
	<script src="${pictureVisitUrl}/ldsc/js/myCardList.js?v=3"></script>
</html>