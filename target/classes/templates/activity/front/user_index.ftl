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
						<div class="cultureImg"><img src="${request.contextPath}/subinfo/images/culture.png"/></div>
						<p>阳光人寿保险股份有限公司广西分公司</p>
						<span class="line"></span>
					</div>
					<form action="">
						<div class="unit">
							<div class="headName"><span></span>机 构<span></span></div>
							<select name="cityId" id="cityId" class="address">
							    <option value="">请选择</option>
								<option value="1">南宁</option>
								<option value="2">柳州</option>
								<option value="3">桂林</option>
								<option value="4">玉林</option>
								<option value="5">梧州</option>
								<option value="6">河池</option>
								<option value="7">百色</option>
								<option value="8">北海</option>
							</select>
						</div>
						<div class="unit">
							<div class="headName"><span></span>姓名<span></span></div>
							<input name="realName"  id="realName" type="text" />
						</div>
						<div class="unit">
							<div class="headName"><span></span>认领保费 <i>(万元)</i><span></span></div>
							<input name="amout"  id="amout" type="number" />
						</div>
						<a class="submitBtn" href="javascript:beforeSubData();">提 交</a>
						<input name="cityName"  id="cityName" type="hidden" />
					</form>
				</div>
			</div>
		</div>

		<!-- 确认认领保费弹窗 HTML -->
        <div class="modal-comfirm" style="display:none;">
            <div class="content_zhongjiang">
                <div class="content_in zj_con_long repadding">
                    <p class="confirmTitle">请确认表单</p>
                    <div class="confirmInfo">
                        <span id="com_city">北海</span>
                        <span id="com_realname">惠周大</span>
                        <span id="com_amout"></span>
                    </div>
                    <p class="tip">每人仅可提交一次，确认无误，提交后返回原页面即可退出</p>
                    <a class="submitBtn" href="javascript:submitData();">确 认 提 交</a>
                </div>

                <span class="close_btn_bottom"></span>
            </div>
        </div>
        <!-- 确认认领保费弹窗 -->
	</body>

    <script src="${request.contextPath}/js/jquery-1.7.2.js"></script>
	<#-- <script src="https://code.jquery.com/jquery-3.0.0.min.js"></script> -->
	<script type="text/javascript">

        $(function(){
                $("#cityId").change(function(){
                   var text = $(this).find("option:selected").text();
                   $("#cityName").val(text);
                });
                ////关闭确认框
                $(".close_btn_bottom").click(function(){
                    $(".modal-comfirm").hide();
                });

         });

        //beforeSubData,提交前再次确认数据
        function beforeSubData(){
             var cityId = $("#cityId").val();
            if(cityId==""){
                alert("请选择城市");
                return;
            }
            var cityName = $("#cityName").val();
            if(cityName==""){
                alert("请选择城市");
                return;
            }
            var realName = $("#realName").val();
             if(realName==""){
                alert("请填写姓名");
                 return;
             }
            var amout = $("#amout").val();
            if(amout==""){
                alert("请填写认购金额");
                 return;
             }
             $("#com_city").text(cityName);
             $("#com_realname").text(realName);
             $("#com_amout").html("认领保费 <i>"+amout+"</i> 万元");
             $(".modal-comfirm").show();

        }

        //提交数据
        function submitData(){
            var cityId = $("#cityId").val();
            if(cityId==""){
                alert("请选择城市");
                return;
            }
            var cityName = $("#cityName").val();
            if(cityName==""){
                alert("请选择城市");
                return;
            }
            var realName = $("#realName").val();
             if(realName==""){
                alert("请填写姓名");
                 return;
             }
            var amout = $("#amout").val();
            if(amout==""){
                alert("请填写认购金额");
                 return;
             }
             //关闭确认框
              $(".modal-comfirm").hide();

                $.ajax({
                    url: '${request.contextPath}/frontpage/activityUser/subOrder',
                    type: "POST",
                    data:{"cityId":cityId,"cityName":cityName,"realName":realName,"amout":amout},
                    async:false,
                    success: function(data){
                        if(data!=null && 'success'==data.status){
                            alert("提交成功!")
                        }else{
                             if(data!=null && 'error'==data.status && '1'==data.show){
                                 alert(data.message)
                             }else{
                                 alert('提交失败，请稍后再试')
                             }
                        }
                    },
                   error: function(data){
                       alert('网络异常，请稍后再试')
                    }
               });
        }
	</script>
</html>