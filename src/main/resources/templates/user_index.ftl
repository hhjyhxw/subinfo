<!DOCTYPE html>
<html class="flex-layout">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black" />
		<meta name="format-detection" content="telephone=no" />
		<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
		<title>ok</title>
		<style type="text/css">
			@font-face {
		        font-family: 'PingFang';
			}
		</style>

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
	
	<body style="background: #fff; overflow: hidden;">
		<div>
			welcome!
		</div>
		<a href="javascript:addSmoke();">添加乐豆测试/a>
		
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