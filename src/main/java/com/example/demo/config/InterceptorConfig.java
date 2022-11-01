package com.example.demo.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {

	@Autowired
	private LocaleChangeInterceptor changeInterceptor;
	
	@Override
		public void addInterceptors(InterceptorRegistry registry) {
			//method chaining: 메서드를 끊지 않고 연결하는 방식
			//message Interceptor 등록
			registry.addInterceptor(changeInterceptor)
					.addPathPatterns("/**");
		}
}
