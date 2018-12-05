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

	public final static Logger logger = LoggerFactory.getLogger(LoginInterceptorNew.class);
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
