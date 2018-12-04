package com.icloud.config.interceptor;

import com.icloud.common.IpUtil;
import com.icloud.model.bms.BmsAdmin;
import com.icloud.model.bms.BmsLogs;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Date;

/**
 * 后台访问日志记录拦截器
 */
public class BackLogInterceptor implements HandlerInterceptor {
	

	public final static Logger log = LoggerFactory.getLogger(BackLogInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("admin_user");
		if(null==obj){
			response.sendRedirect("/tologin");
			return false;
		}
        createVisitLogs(request,handler,(BmsAdmin)obj);
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
			
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

    /**
     * 创建后台访问日志
     * @param request
     * @param handler
     * @return
     * @throws IOException
     */
	private BmsLogs createVisitLogs(HttpServletRequest request, Object handler,BmsAdmin admin) throws IOException{
		BmsLogs log = new BmsLogs();
        String reqURL = request.getRequestURL().toString();  
        String ip = IpUtil.getIpAddr(request);
        InputStream  is = request.getInputStream ();  
        StringBuilder responseStrBuilder = new StringBuilder ();  
        BufferedReader streamReader = new BufferedReader (new InputStreamReader (is,"UTF-8"));  
        String inputStr;  
         while ((inputStr = streamReader.readLine ()) != null)  
             responseStrBuilder.append (inputStr);
        String parmeter = responseStrBuilder.toString();
        log.setUserName(admin.getAccount());
		log.setCreateTime(new Date());
		log.setVisitIp(ip);
		log.setVisitParams(parmeter);
		log.setVisitUri(request.getRequestURI());

       if (handler instanceof HandlerMethod) {
		   HandlerMethod h = (HandlerMethod) handler;
		   log.setVisitMethod(h.getMethod().getName());
       }
       return log;
	}

}
