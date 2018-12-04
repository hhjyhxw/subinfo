<!DOCTYPE html>
<html class="flex-layout">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black" />
		<meta name="format-detection" content="telephone=no" />
		<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
		<title>名人堂</title>
		<link rel="stylesheet" href="${pictureVisitUrl}/htgc/css/reset.css">
		<link rel="stylesheet" href="${pictureVisitUrl}/htgc/css/myStyle.css">
		<style type="text/css">
			@font-face {
		        font-family: 'PingFang';
		        src: url('${pictureVisitUrl}/htgc/images/PingFang Regular.ttf'),
			}

			.timeTab{
                width: 100%;
                height: 80px;
                overflow: hidden;
            }
		</style>
		
	</head>
	
	<body style="background: #eef1f5; overflow: hidden;">
		<div class="flex">
			<div class="body" style=" width: 100%; height: 100%;">
				<#--
				<ul class="timeTab">
                    <li id="weeks" class="selectCur">周榜</li>
                    <li id="moths">月榜</li>
                </ul>
                -->
                <div class="indexTab" style="margin-bottom: 15px;">
                    <span id="weeks" class="onTabDispaly" style="width: 49.5%;"><i></i>周榜</span>
                    <span id="moths" style="width: 49%;"><i></i>月榜</span>
                </div>

                 <!-- 周榜榜 -->
                <div class="weeks">
                    <!--铁杆粉（贡献值）-->
                    <div class="unit pLeftRight20 bgWhite overflowH">
                        <div class="unitHead">
                            <p>铁杆粉</p>
                            <a href="${request.contextPath}/frontpage/subjectRank/findScoreRankForList?ranktype=weeks">查看全部</a>
                        </div>
                        <ul class="rankList findScoreRankForList">
                        </ul>
                    </div>
                    <!--铁杆粉   END-->
                    <!--话题王（收到评论最多的）-->
                    <div class="unit pLeftRight20 bgWhite overflowH">
                        <div class="unitHead">
                            <p>话题王</p>
                            <a href="${request.contextPath}/frontpage/subjectRank/findReceivedContentRankList?ranktype=weeks">查看全部</a>
                        </div>
                        <ul class="rankList findReceivedContentRankList">
                        </ul>
                    </div>
                    <!--话题王  END-->

                    <!--达人榜-->
                    <div class="unit pLeftRight20 bgWhite overflowH">
                        <div class="unitHead">
                            <p>达人榜</p>
                            <a href="${request.contextPath}/frontpage/subjectRank/receiveThumbsRankList?ranktype=weeks">查看全部</a>
                        </div>
                        <ul class="rankList receivThumbsRanksList">
                        </ul>
                    </div>
                    <!--达人榜  END-->
                </div>
                <!-- 月榜 -->
                <div class="moths" style="display:none;">
                        <!--铁杆粉（贡献值）-->
                        <div class="unit pLeftRight20 bgWhite overflowH">
                            <div class="unitHead">
                                <p>铁杆粉</p>
                                <a href="${request.contextPath}/frontpage/subjectRank/findScoreRankForList?ranktype=moths">查看全部</a>
                            </div>
                            <ul class="rankList findScoreRankForList">
                            </ul>
                        </div>
                        <!--铁杆粉   END-->
                        <!--话题王（收到评论最多的）-->
                        <div class="unit pLeftRight20 bgWhite overflowH">
                            <div class="unitHead">
                                <p>话题王</p>
                                <a href="${request.contextPath}/frontpage/subjectRank/findReceivedContentRankList?ranktype=moths">查看全部</a>
                            </div>
                            <ul class="rankList findReceivedContentRankList">
                            </ul>
                        </div>
                        <!--话题王  END-->

                        <!--达人榜-->
                        <div class="unit pLeftRight20 bgWhite overflowH">
                            <div class="unitHead">
                                <p>达人榜</p>
                                <a href="${request.contextPath}/frontpage/subjectRank/receiveThumbsRankList?ranktype=moths">查看全部</a>
                            </div>
                            <ul class="rankList receivThumbsRanksList">
                            </ul>
                        </div>
                        <!--达人榜  END-->
                   </div>
			</div>
		</div>
		
	</body>
	<#include "/subject/front/subject_public.ftl"/> 
	<script src="${pictureVisitUrl}/htgc/js/subjectRanks.js?v=2"></script>

</html>