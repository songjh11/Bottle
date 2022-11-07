package com.example.demo.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

	@Bean
	WebSecurityCustomizer webSecurityConfig() {
		return web -> web
				.ignoring()
				.antMatchers("/images/**")
				.antMatchers("/css/**")
				.antMatchers("/js/**")
				.antMatchers("/favicon/**")
				.antMatchers("/resources/**");
	}
	
	@Bean
	SecurityFilterChain filterChain(HttpSecurity httpSecurity) throws Exception {
		httpSecurity
				.cors()
				.and()
				.csrf()
				.disable()
			.authorizeRequests()
				.antMatchers("/").permitAll()
				.antMatchers("/member/join").permitAll()
				.antMatchers("/admin").hasRole("ADMIN")
				.antMatchers("/manager").hasAnyRole("ADMIN","MANAGER")
				.anyRequest().authenticated()
				.and()
			.formLogin()
				.loginPage("/member/login")
				.usernameParameter("id")
				.passwordParameter("pw")
				.defaultSuccessUrl("/")
				.failureUrl("/member/login")
				.permitAll()
				.and()
			.logout()
				.logoutUrl("/member/logout")
				.logoutSuccessUrl("/")
				.deleteCookies("JSESSIONID")
				.invalidateHttpSession(true)
				.permitAll();
				
				return httpSecurity.build(); 
				
	}
	
	@Bean
	public PasswordEncoder getEncoder() {
		return new BCryptPasswordEncoder();
	}
	
}
