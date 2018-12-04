package com.icloud.config.interceptor;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * 手机端全局拦截器
 * zdh
 */
public class LoginInterceptorNew implements HandlerInterceptor{
	
	public final static Logger log = LoggerFactory.getLogger(LoginInterceptorNew.class);
//	private BeanFansService beanFansService = SpringContextHolder.getBean(BeanFansService.class);
	
	@Override
	public void afterCompletion(HttpServletRequest reqeust, HttpServletResponse response, Object arg2, Exception arg3)
			throws Exception {
		
		// TODO Auto-generated method stub
	}

	@Override
	public void postHandle(HttpServletRequest reqeust, HttpServletResponse response, Object arg2, ModelAndView arg3)
			throws Exception {
	
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {

//			StringBuffer visiturl = new StringBuffer();
//			visiturl.append(request.getScheme() + "://"+request.getHeader("host")+request.getRequestURI());
//			if(visiturl.toString().indexOf("/frontpage/user/toSubscribe")>=0){
//				return true;
//			}
//			//接收用户消息
//			if(visiturl.toString().indexOf("/frontpage/message/userInfon")>=0){
//				return true;
//			}
//			//测试使用
////			if(visiturl.toString().indexOf("/frontpage/beanOrder/exChangeGoods")>=0){
////				return true;
////			}
//			//请求域名
//			if (request.getQueryString() != null) // 判断请求参数是否为空
//				visiturl.append("?" + request.getQueryString()); // 参数
//				log.info("visiturl====="+visiturl);
//
//			BeanFans beanFans = null;
//			/*1=========================从redis session获取=========================*/
//			Object obj = request.getSession().getAttribute("beanFans");
//			if(obj!=null){
//				beanFans=(BeanFans) obj;
//				log.info("queryredis,用户==="+beanFans.getNickname()+"===已登录==="+beanFans.getOpenid());
//				return true;
//			}else{
//				/*2=========================调用真龙接口获取=============================*/
//				//获取接口参数数据,并校验
//				String nickName = request.getParameter("nickName");
//				String headPhoto = request.getParameter("headPhoto");
//				String unionid = request.getParameter("unionid");
//				String openid = request.getParameter("openid");
//				String sign = request.getParameter("sign");
//				if(StringUtil.checkStr(openid) && StringUtil.checkStr(nickName)){
//					String newsign = "";
//					if(StringUtil.checkStr(unionid)){
//						newsign = MD5Utils.encode2hex("openid="+openid+"&unionid="+unionid+"&key="+ConfigUtil.get("infokey"));
//					}else{
//						newsign = MD5Utils.encode2hex("openid="+openid+"&key="+ConfigUtil.get("infokey"));
//					}
//					log.error("sign====="+sign+"&newsign===="+newsign);
//					if(!newsign.equals(sign)){
//						log.error("签名错误,非法请求");
//						return false;
//					}
//
//					nickName=URLDecoder.decode(nickName, "utf-8");
//                    headPhoto=URLDecoder.decode(headPhoto, "utf-8");
//
////					nickName=EmotioUtil.resolveToByteFromEmoji(nickName);
////					nickName=EmotioUtil.filterEmoji(nickName);
//
//					BeanFans beanFansParam = new BeanFans();
//					beanFansParam.setOpenid(openid);
//					List<BeanFans> beanFansList = beanFansService.findList(beanFansParam);
//					if(beanFansList!=null && beanFansList.size()>0){
//						beanFans = beanFansList.get(0);
//
//						//更新
//						if(!"0000".equals(nickName)){
//							beanFans.setNickname(nickName);
//						}
//						if(!"0000".equals(headPhoto)){
//							beanFans.setHeadimgurl(headPhoto);
//						}
//						beanFansService.update(beanFans);
//						//更新缓存
//						request.getSession().setAttribute("beanFans",beanFans);
//						//图片访问路径
//						request.getSession().setAttribute("pictureVisitUrl",ConfigUtil.get("pictureVisitUrl"));
//						log.info("querydb,用户==="+beanFans.getNickname()+"===已登录==="+beanFans.getOpenid());
//						return true;
//					}
//					//数据库查询不到，则保存
//					beanFans = new BeanFans();
//					beanFans.setOpenid(openid);
//					beanFans.setNickname(nickName);
//					beanFans.setHeadimgurl(headPhoto);
//					beanFans.setUnionid(unionid);
//					beanFans.setSmokeBean(0);
//					beanFans.setCreateTime(new Date());
//					beanFansService.save(beanFans);
//					request.getSession().setAttribute("beanFans",beanFans);
//					request.getSession().setAttribute("pictureVisitUrl",ConfigUtil.get("pictureVisitUrl"));
//					log.info("queryByInterface,用户==="+beanFans.getNickname()+"===已登录==="+beanFans.getOpenid());
//					return true;
//				}else{
//					/*3、===============从redis 和数据库 都获取不到 ，那么从接口获取=====================*/
//					//调用接口获取用户数据
//					 String state = Base64.getEncoder()
//							 .encodeToString(visiturl.toString().getBytes(StandardCharsets.UTF_8))
//							 .replace("=", "-").replace("/", "_");
//					 String redirectUrl = ConfigUtil.get("getUserInfo")
//							 .replace("APPID", ConfigUtil.get("appid"))
//							 .replace("STATE", state);
//					 response.sendRedirect(redirectUrl);
//					 return false;
//				}
//			}

		return true;
	}
	
//	public static void main(String[] args){
//		
////		String ste = "http://elevator.iyiplus.com/Index1.aspx";
//		String ste = "http://wx.thewm.cn/crowdweb/raisewx/raiseCenter?raseid=ss&id=6";
//		 String state = Base64.getEncoder()
//				 .encodeToString(ste.toString().getBytes(StandardCharsets.UTF_8))
//				 .replace("=", "-").replace("/", "_");
//			log.info("state=="+state);
//		 
//	}
	
	public Object getBean(String beanName,HttpServletRequest request){
		BeanFactory factory = WebApplicationContextUtils.getRequiredWebApplicationContext(request.getServletContext()); 
	    return factory.getBean(beanName); 
	}
	
}
