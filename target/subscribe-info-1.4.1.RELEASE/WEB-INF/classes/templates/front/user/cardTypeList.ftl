<!DOCTYPE html>
<html class="flex-layout">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black" />
		<meta name="format-detection" content="telephone=no" />
		<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
		<title>我的优惠券列表</title>
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
			<div class="oderHead">我的优惠券</div>
			<div class="orderTab">
				<div class="body p100">
                    <div class="cardUnit" id="11discount">
                        <div class="cardName bgCard1" style="background: url(../../ldsc/img/bg_card1.jpg) no-repeat 0 0;">双11折扣券</div>
                    </div>
                    <div class="cardUnit" id="ziguangCard">
                        <div class="cardName bgCard1" style="background: url(../../ldsc/img/bg_card1.jpg) no-repeat 0 0;">品吸代金券</div>
                    </div>
				</div>
			</div
		</div>
		
	</body>
	<#include "/front/public.ftl"/>  
	<#-- <script src="${pictureVisitUrl}/ldsc/js/myCardList.js?v=3"></script> -->
	<script>
	$(function() {
        $("#ziguangCard").click(function(){
            window.location.href = "${request.contextPath}/frontpage/beanCoupon/myCardList";
         });

          $("#11discount").click(function(){
             window.location.href = "${request.contextPath}/frontpage/myCard/myDiscountCardList";
          });
	});
</script>
</html>