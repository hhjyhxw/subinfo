<!DOCTYPE html>
<html class="flex-layout">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black" />
		<meta name="format-detection" content="telephone=no" />
		<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
		<title>我的订单</title>
		<link rel="stylesheet" href="${pictureVisitUrl}/ldsc/css/reset.css">
		<link rel="stylesheet" href="${pictureVisitUrl}/ldsc/css/myStyle.css">

		<style type="text/css">
        			.add_team2{
        				background: url(${pictureVisitUrl}/ldsc/img/b2.png) no-repeat;
        				background-size: 366px 120px;
        				margin-top: 3px;
        			}
        			.modal-comfirm {
        				position: fixed;
        				z-index: 9999;
        				top: 0;
        				left: 0;
        				right: 0;
        				bottom: 0;
        				background-color: rgba(0, 0, 0, 0.6);
        				height: 100%;
        			}
        			.modal-comfirm .content_zhongjiang {
        				-webkit-transform: translateX(-50%) translateY(-40%);
        				width: 84%;
        				background:#fee8d1;
        				position: absolute;
        				top: 50%;
        				left: 50%;
        				padding:22px;
        				box-sizing: border-box;
        				margin-top: -30px;
        			}
        			.content_in{
        				width:100%;
        				background: #f94d39;
        				border-radius: 15px;
        				box-sizing: border-box;
        				position: relative;
        				padding: 0 30px;
        			}
        			.close_btn_bottom{
        				position: absolute;
        				bottom: -125px;
        				width: 80px ;
        				height: 80px;
        				left: 50%;
        				margin-left: -40px;
        				background: url(${pictureVisitUrl}/ldsc/img/close.png) repeat 50% 50%;
        				background-size: 100%;
        			}
        			.JDCardHead{
        				width: 100%;
        				height: 190px;
        				background: url(${pictureVisitUrl}/ldsc/img/JDCardHead.png) no-repeat center top;
        				background-size: 96%;
        				margin: 0 auto 10px;
        			}
        			.scrapingAreaBox{
        				width: 100%;
        				height: 250px;
        				background: url(${pictureVisitUrl}/ldsc/img/guaWhiteBg.png) no-repeat 0px 0px;
        				background-size: 100%;
        			}
        			.guaBefore{
        				width: 88%;
        				height: auto;
        				margin: 0  auto;
        				overflow: hidden;
        				padding-top: 15px;
        				position: relative;
        			}
        			.beginGua{
        				position: absolute;
        				left: 0;
        				right: 0;
        				top: 0;
        				bottom: 0;
        				margin: auto auto;
        				width: 270px;
        				height: 70px;
        				line-height: 70px;
        				border-radius: 32px;
        				background: #f5563c;
        				color: #fff;
        				font-size: 28px;
        				letter-spacing: 0.1em;
        				text-align: center;
        			}
        			.cardNumPass{
        				position: absolute;
        				left: 0;
        				right: 0;
        				top: 0;
        				bottom: 0;
        				margin: auto auto;
        				width: 100%;
        				height: 80px;
        			}
        			.cardNumPass>p{
        				height: 45px;
        				color: #612f0d;
        				font-size: 32px;
        				padding-left: 8px;
        			}
        		</style>
		
		
	</head>
	
	<body style="background: #e4ecff; overflow: hidden; width: 100%;">
		<div class="flex">
			<div class="body">
				<div class="oderHead">我的订单</div>
				<div class="orderTab">
					<h2 class="orderStateTab">
						<span class="tabItem onOrderState" id=""><i></i>全部订单</span>
						<span class="tabItem" id="0">未发货</span>
						<span class="tabItem" id="1">已发货</span>
					</h2>
					<!--切换栏    -->
					<div class="oderUnit" style="">
						<!--<div class="oderBox">
							<dl>
								<dt><img src="img/detailImg.png" alt="" /></dt>
								<dd>
									<p>品吸大礼包</p>
									<p>时间：2018-2-3 20:55:15</p>
								</dd>
							</dl>
							<ul class="state">
								<li>乐豆：1880</li>
								<li>未发货</li>
							</ul>
						</div> -->
					</div>
					<!--切换栏    END-->
				</div>
			</div>
		</div>

		        <!--显示京东券卡密的 -->
		        <#--
        		<div class="modal-comfirm beansForm"  style="display: none">
        		  	<div class="content_zhongjiang">
        		  		<p class="changeLd" id="cardSecrect" style="font-size:25px;"></p>
        		  		<p class="changeLd" id="cardAccount" style="font-size:25px;"></p>
        		  		<div class="closeXX" style="position: absolute; width: 60px; height:60px; bottom: -80px;left: 0; right: 0; margin: 0 auto;"><img src="${pictureVisitUrl}/ldsc/img/close.png" alt=""  width="60" style="display: block;"/></div>

        		  	</div>
        		</div>
        		-->


        		<!-- 京东刮刮卡弹窗HTML -->
                	<div class="modal-comfirm"  style="display: none">
                		<div class="content_zhongjiang">
                		  	<div class="content_in">
                		  		<div class="JDCardHead"></div>
                		  		<div class="scrapingAreaBox">

                		  			<div class="guaBefore" id="guakai" style="display: none;">
                		  				<img src="${pictureVisitUrl}/ldsc/img/guaBefore.png" width="100%" alt="" />
                		  				<a href="javascript:showAndUpdateJdCard();" class="beginGua">点击刮开</a>
                		  			</div>
                		  			<div class="guaBefore" id="showkey">
                		  				<img src="${pictureVisitUrl}/ldsc/img/guaAfter.png" width="100%" alt="" />
                		  				<div class="cardNumPass">
                		  					<p id="cardAccount">卡号：JD126993598</p>
                		  					<p id="cardSecrect">密码：595956698916</p>
                		  				</div>
                		  			</div>
                		  		</div>
                		  		<span class="close_btn_bottom"></span>
                		  	</div>
                		 </div>
                	</div>
                	<input type="hidden" id="currentOrderId" value=""></span>
                	<!-- 京东刮刮卡弹窗html END -->
	</body>
	
	<#include "/front/public.ftl"/> 
	<script src="${pictureVisitUrl}/ldsc/js/myOrderList.js"></script>
</html>