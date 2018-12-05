<!DOCTYPE html>
<html class="flex-layout">
		<head>
    		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    		<meta name="apple-mobile-web-app-capable" content="yes" />
    		<meta name="apple-mobile-web-app-status-bar-style" content="black" />
    		<meta name="format-detection" content="telephone=no" />
    		<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
    		<title>阳光保险广西分公司</title>
    		<link rel="stylesheet" href="${request.contextPath}/subinfo/css/reset.css">
    		<link rel="stylesheet" href="${request.contextPath}/subinfo/css/myStyle.css">
    		<script src="${request.contextPath}/subinfo/js/global.js"></script>

    	</head>

		<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
        		<script type="text/javascript">
        		/***********通过config接口注入权限验证配置***************/
        		wx.config({
        			debug: false,
        		    appId: '${(jssdk.appid)!''}',
        		    timestamp: '${(jssdk.timeStamp)!''}',
        		    nonceStr: '${(jssdk.nonceStr)!''}',
        		    signature: '${(jssdk.sign)!''}',
        		    jsApiList: [
        		                'hideOptionMenu',
        		    	        'previewImage'
        		                ]
        		});
        		 wx.ready(function() {
                    wx.hideOptionMenu();
                });
         </script>
	</head>
	

	<body style="background: #eef1f5; overflow: hidden; width: 100%;">
		<div class="flex">
			<div class="body">
				<div class="infoForm">
					<div class="companyName">
						<div class="cultureImg"><img src="images/culture.png"/></div>
						<p>阳光人寿保险股份有限公司广西分公司</p>
						<span class="line"></span>
					</div>
					<form action="">
						<div class="unit">
							<div class="headName"><span></span>机 构<span></span></div>
							<select name="" class="address">
								<option value="1">南宁</option>
								<option value="2">柳州</option>
								<option value="桂林">桂林</option>
								<option value="玉林">玉林</option>
								<option value="梧州">梧州</option>
								<option value="河池">河池</option>
								<option value="百色">百色</option>
								<option value="北海">北海</option>
							</select>
						</div>
						<div class="unit">
							<div class="headName"><span></span>姓名<span></span></div>
							<input type="text" />
						</div>
						<div class="unit">
							<div class="headName"><span></span>认领保费 <i>(万元)</i><span></span></div>
							<input type="number" />
						</div>
						<a class="submitBtn" href="#">提 交</a>
					</form>
				</div>
			</div>
		</div>
	</body>

	<script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
	<script type="text/javascript">
        //获取第一页数据
        function addSmoke(){
                $.ajax({
                    url: 'http://wx.thewm.cn/integral/integralManage!addIntegral.action',
                    type: "POST",
                    data:{
                        "app_id":'ldsc',
                        "app_key":'ldscxslilpolkjafjkdsdf',
                        "qrcodeNo":'sutest21356',
                        "orderno":'sutest21356',
                        "openid":'oREekjpYosWes5b16jyeSTmv3CcA',
                        "smokeBeans":25,
                        "desc":'test20181205',
                        "smokeBrand":'5',
                        "type":"test20181205",
                        "sgin":"3466913eb43d35d1d747a91d2a180603"
                    },
                    dataType: "json",
                    async:false,
                    success: function(data){
                       alert("success=="+data);
                    },
                   error: function(data){
                       alert("error==="+data);
                    }
               });
        }
	</script>
</html>