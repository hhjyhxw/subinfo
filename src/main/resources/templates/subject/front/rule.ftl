<!DOCTYPE html>
<html class="flex-layout">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black" />
		<meta name="format-detection" content="telephone=no" />
		<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
		<title>互动奖励规则</title>
		<link rel="stylesheet" href="${pictureVisitUrl}/htgc/css/reset.css">
		<link rel="stylesheet" href="${pictureVisitUrl}/htgc/css/myStyle.css">
		<script src="${pictureVisitUrl}/htgc/js/jquery-2.1.4.js"></script>
		<script src="${pictureVisitUrl}/htgc/js/global.js"></script>
		<style type="text/css">
			@font-face {
		        font-family: 'PingFang';
		        src: url('${pictureVisitUrl}/htgc/images/PingFang Regular.ttf'),
			}
			
			.ruleTitle{
				color: #2671fe;
				font-size: 32px;
				font-weight: bold;
				text-align: center;
				line-height: 100px;
				margin-top: 20px;
				letter-spacing: 0.1em;
			}
			.partRule{
				width: 80%;
				margin: 0 auto 20px;
			}
			.partRule>p:nth-child(1){
				color: #2671fe;
				padding-left: 30px;
				background: url('${pictureVisitUrl}/htgc/images/ruleItem.png') no-repeat 0px 10px;
				background-size: 24px 24px;
				margin-bottom: 5px;
				text-indent: 0em;
				font-size: 26px;
			}
			.partRule>p{
				color: #000;
				font-size: 24px;
				line-height: 44px;
				text-align: justify;
				text-indent: 2em;
			}
			.tableDate{
				width: 100%;
				height: auto;
				border: 1px solid #000;
				margin-top: 20px;
			}
			.tableDate>li{
				border-bottom: 1px solid #000;
				height: 60px;
				line-height: 60px;
			}
			.tableDate>li:last-child{
				border-bottom: 0px solid #000;
			}
			.tableDate>li>span:nth-child(1){
				display: inline-block;
				width: 140px;
				border-right: 1px solid #000;
				text-align: center;
				padding-left: 0;
			}
			.tableDate>li>span{
				padding-left: 20px;
				font-size: 24px;
			}
		</style>
		
	</head>
	
	<body style="background: #eef1f5; overflow: hidden;">
		<div class="flex">
			<div class="body" style=" background: #fff; width: 100%; height: 100%;">
				<div style="padding: 0 0 100px 0;">
					<p class="ruleTitle">互动奖励规则</p>
					<div class="partRule">
						<p>什么是互动奖励？</p>
						<p>话题广场有“话题”和“征集”两大版块，参加话题评论和征集投稿均可获得乐豆奖励，参与越多奖励越多。</p>
					</div>
					<div class="partRule">
						<p>什么是贡献值？</p>
						<p>贡献值是龙粉参加话题广场活跃度的数值体现，贡献值会影响龙粉的话题广场等级和排行榜排名情况。</p>
					</div>
					<div class="partRule">
						<p>如何获得贡献值？</p>
						<p>贡献值可以通过“发布评论”、“征集投稿”、“点赞或踩”、“收到点赞”、“收到评论”等方式活动，参与活动越积极，获得的贡献值越多。</p>
					</div>
					<div class="partRule">
						<p>话题广场等级如何判定？</p>
						<p>话题广场等级由粉丝的贡献值决定，贡献值越高等级越高。</p>
					</div>
					<div class="partRule">
						<p>排行榜怎么计算？</p>
						<p>排行榜实时呈现当前排名，共有三大板块：铁杆粉、话题王和达人榜。</p>
						<p>铁杆粉：按贡献值从高到低进行排行。</p>
						<p>话题王：按收到评论的数量从高到低进行排行。</p>
						<p>达人榜：按收到点赞的数量从高到低进行排行。</p>
					</div>
					<div class="partRule">
						<p>周排行榜如何进行奖励结算？</p>
						<p>周排行榜的评定时间按周一到周日计算，每周一重新开始新一周的排行，并结算上周数据进行奖励。每个榜单排名前100的粉丝可获得乐豆奖励（若数值相同则按照获得该数值的时间先后进行排名），奖励规则如下：</p>
						<ul class="tableDate">
							<li>
								<span>排名</span>
								<span>乐豆奖励</span>
							</li>
							<li>
								<span>1</span>
								<span>50乐豆/人</span>
							</li>
							<li>
								<span>2-10</span>
								<span>20乐豆/人</span>
							</li>
							<li>
								<span>11-50</span>
								<span>10乐豆/人</span>
							</li>
							<li>
								<span>51-100</span>
								<span>5乐豆/人</span>
							</li>
						</ul>
					</div>
					<div class="partRule" style="padding-top: 12px;">
						<p>月排行榜如何进行奖励结算？</p>
						<p>月排行榜的评定时间按日历自然月计算，每月1日重新开始新一月的排行，并结算上月数据进行奖励。每个榜单排名前100的粉丝可获得乐豆奖励（若数值相同则按照获得该数值的时间先后进行排名），奖励规则如下：</p>
						<ul class="tableDate">
							<li>
								<span>排名</span>
								<span>乐豆奖励</span>
							</li>
							<li>
								<span>1</span>
								<span>100乐豆/人</span>
							</li>
							<li>
								<span>2-10</span>
								<span>50乐豆/人</span>
							</li>
							<li>
								<span>11-50</span>
								<span>20乐豆/人</span>
							</li>
							<li>
								<span>51-100</span>
								<span>10乐豆/人</span>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		
	</body>

</html>