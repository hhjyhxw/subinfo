<!DOCTYPE html>
<html class="flex-layout">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black" />
		<meta name="format-detection" content="telephone=no" />
		<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
		<title>踩</title>
		<link rel="stylesheet" href="${pictureVisitUrl}/htgc/css/reset.css">
		<link rel="stylesheet" href="${pictureVisitUrl}/htgc/css/myStyle.css">
		<script src="${pictureVisitUrl}/js/common/jquery-2.1.4.js"></script>
		<script src="${pictureVisitUrl}/js/common/global.js"></script>
		<style type="text/css">
			@font-face {
		        font-family: 'PingFang';
		        src: url('${pictureVisitUrl}/htgc/images/PingFang Regular.ttf'),
			}
			.huifuBtn{
				display: inline-block;
			    width: 80px;
			    height: 38px;
			    border-radius: 19px;
			    border: 1px solid #dcdcdc;
			    line-height: 38px;
			    text-align: center;
			    font-size: 22px;
			    color: #848e98;
			    letter-spacing: 0.08em;
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
			
		</style>
		
	</head>
	
	<body style="background: #fff; overflow: hidden;">
		<div class="flex">
			<div class="body" style=" width: 100%; height: 100%; position: relative;">
				<div class="headClassify">
					<a href="${request.contextPath}/frontpage/center/index" class="backBtn"></a>
					<span class="selectCommentType">${typeStr!'踩我的'}</span><span class="kuozhan"></span>
				</div>
				<div class="modal-comfirm"  style="display:none;">
					<ul class="commentClassify">
						<li <#if status??&&status=="1">class="currentComment"</#if>>踩我的</li>
						<li <#if status??&&status=="0">class="currentComment"</#if>>我踩的</li>
						<li></li>
					</ul>
				</div>
				<ul class="getPraise">
				<#list page as step>
				  <li>
						<div  style="overflow: hidden;"><img class="faceImg" src="${step.headimgurl}" alt="" />
                          <div class="orderUserName">
						         <span>${step.nickName}</span>
						         <div><span>${(step.createTime?string('MM-dd HH:mm'))!}</span></div></div>
                       </div>
						<div class="praiseTopicBox mLeft80">
							<span class="stamp">踩了这条评论</span>
							<#--<span class="praiseTime">${step.createTime?string('MM-dd HH:mm')}</span>-->
							<div class="reply" style="background: rgba(1,1,1,0);">
								<!--回复信息展示-->
								<div class="replyLists" style="padding:5px 0 15px 0px;">
									<p><span class="repalyName">@${step.content.nickName}:</span>${step.content.contents}</p>
								</div>
								<a href="${request.contextPath}/frontpage/subjectTopicDetail/topicDetail?id=${step.topicId}" style="background: #f2f3f5;">
									<dl class="huatiBlock">
										<dt><img src="${pictureVisitUrl}/${step.topic.topicUrl}"/></dt>
										<dd>${step.topic.topicName}</dd>
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
     $('.selectCommentType').click(function(){
         $('.modal-comfirm').show();
      })
      $('.commentClassify').find('li').click(function(){
           $('.modal-comfirm').hide();
           var index = $(this).index();
           if(index==0){
              window.location.href="${request.contextPath}/frontpage/center/step_list?status=1"
           }else{
              window.location.href="${request.contextPath}/frontpage/center/step_list?status=0"
           }
      })
      
    </script>
</html>