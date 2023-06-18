package com.example.InsideOut.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.SecurityFilterChain;

import com.example.InsideOut.configuration.jwt.JwtAuthenticationFilter;
import com.example.InsideOut.configuration.jwt.JwtAuthorizationFilter;
import com.example.InsideOut.dao.UserRepository;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(securedEnabled = true, prePostEnabled = true)
public class SecurityConfig {
	@Autowired
	private UserRepository userRepository;

	@Autowired
	private CorsConfig corsConfig;

	@Bean
	SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		return http
				.csrf().disable()
				.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS)
				.and()
				.formLogin().disable()
				.httpBasic().disable()
				.apply(new MyCustomDsl()) // 커스텀 필터 등록
				.and()
				.authorizeRequests(authroize -> authroize.antMatchers("/api/v1/user/**")
						.access("hasRole('ROLE_STUDENT') or hasRole('ROLE_STAFF') or hasRole('ROLE_ADMIN')")
						.antMatchers("/api/v1/student/**")
						.access("hasRole('ROLE_STUDENT') or hasRole('ROLE_ADMIN')")
						.antMatchers("/api/v1/staff/**")
						.access("hasRole('ROLE_STAFF') or hasRole('ROLE_ADMIN')")
						.antMatchers("/api/v1/admin/**")
						.access("hasRole('ROLE_ADMIN')")
						.anyRequest().permitAll()) // 해당 요청에 관해 모두 접근 가능
				.build();
	}

	public class MyCustomDsl extends AbstractHttpConfigurer<MyCustomDsl, HttpSecurity> {
		@Override
		public void configure(HttpSecurity http) throws Exception {
			AuthenticationManager authenticationManager = http.getSharedObject(AuthenticationManager.class);
			http
					.addFilter(corsConfig.corsFilter())
					.addFilter(new JwtAuthenticationFilter(authenticationManager))
					.addFilter(new JwtAuthorizationFilter(authenticationManager, userRepository));
		}
	}
}
