package com.icloud.config.interceptor;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * 配置拦截器
 */
@Configuration 
public class InterceptorStack {

 
	@Configuration
	static class WebMvcConfigurer extends WebMvcConfigurerAdapter {
		public void addInterceptors(InterceptorRegistry registry) {
		    registry.addInterceptor(new PermissionsInterceptor()).addPathPatterns("/admin/**").addPathPatterns("/backpage/**");
			registry.addInterceptor(new AddTokenInterceptor()).addPathPatterns("/activityUser/userIndex");
		    registry.addInterceptor(new RemoveTokenInterceptor()).addPathPatterns("/checkToken/removeToken");
//            registry.addInterceptor(new LoginInterceptorNew()).addPathPatterns("/frontpage/**"); //手机端拦截
            registry.addInterceptor(new LoginInterceptorNew_bak()).addPathPatterns("/frontpage/**"); //手机端拦截
			registry.addInterceptor(new ThirdInterfaceInterceptor()).addPathPatterns("/thirdInterfacePath/**"); //第三方接口拦截
		}
	}
}
