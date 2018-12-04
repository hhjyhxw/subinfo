<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<title>登录</title>
		<link rel="stylesheet" href="plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="css/login.css" />
	</head>

	<body class="beg-login-bg">
		<div class="beg-login-box">
			<header>
				<h1>后台登录</h1>
			</header>
			<div class="beg-login-main">
				<form  class="layui-form" method="post" id="form">
					<div class="layui-form-item">
						<label class="beg-login-icon">
                        <i class="layui-icon">&#xe612;</i>
                    </label>
						<input type="text" name="account" lay-verify="userName" autocomplete="off" placeholder="这里输入登录名" class="layui-input">
					</div>
					<div class="layui-form-item">
						<label class="beg-login-icon">
                        <i class="layui-icon">&#xe642;</i>
                    </label>
						<input type="password" name="password" lay-verify="password" autocomplete="off" placeholder="这里输入密码" class="layui-input">
					</div>
					<div class="layui-form-item">
						<div class="beg-pull-left beg-login-remember" style="width: 145px;">
							<input class="layui-input" type="tel" id="verify_input" placeholder="请输入验证码" maxlength="4">
						</div>
						<div class="beg-pull-right">
							 <a href="javascript:void(0);" title="点击更换验证码">
					            <img id="imgVerify" src="" alt="更换验证码" height="36" width="100%" onclick="getVerify(this);">
					        </a>
                        </button>
						</div>
						<div class="beg-clear"></div>
					</div>
					
					<div class="layui-form-item">
						<div class="beg-pull-left beg-login-remember">
							<label>记住帐号？</label>
							<input type="checkbox" name="rememberMe" value="true" lay-skin="switch" checked title="记住帐号">
						</div>
						<div class="beg-pull-right">
							<button class="layui-btn layui-btn-primary" lay-submit lay-filter="login">
                            <i class="layui-icon">&#xe650;</i> 登录
                        </button>
						</div>
						<div class="beg-clear"></div>
					</div>
					
				</form>
			</div>
			<footer>
				<p>2017 © icloudsoft</p>
			</footer>
		</div>
		<script type="text/javascript" src="plugins/layui/layui.js"></script>
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script>
			layui.use(['layer', 'form'], function() {
				var layer = layui.layer,
				$ = layui.jquery,
				form = layui.form();
				form.on('submit(login)',function(data){
				 layer.msg("登录中...");  
				 var flag = false;
				 	$.ajax({
					   url:'${request.contextPath}/veryCode/checkVerify',
					   type:'post',
					   async:false,
					   contentType : "application/json",
					   data:JSON.stringify({"inputStr":$("#verify_input").val()}),
					   success:function(data) { 
					      if(data=='0000'){
					         flag = true;
					      }else{
					      	layer.msg("验证码错误");  
					      }
					    }
					})
				 	if(!flag){
				 		return false;
				 	}
					$.ajax({
					   url:'${request.contextPath}/login',
					   type:'post',
					   data:$("#form").serialize(),
					    success:function(data) { 
					      if(data=='0000'){
					         window.location='${request.contextPath}/admin'
					       }else if(data=='0001'){
					         layer.msg("账号或密码错误");  
					       }else{
					         layer.msg("账号已被限制使用");
					        }
					    }
					})
					return false;
				});
			});
			
			//页面加载 获取验证码
			$(document).ready(function(){
				getVerify($("#imgVerify").get(0));
			});
			//获取验证码
			function getVerify(obj){
			    obj.src = "${request.contextPath}/veryCode/getVerify?"+Math.random();
			}
		</script>
	</body>

</html>