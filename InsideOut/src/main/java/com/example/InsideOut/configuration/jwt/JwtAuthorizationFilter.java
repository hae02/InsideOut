package com.example.InsideOut.configuration.jwt;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.www.BasicAuthenticationFilter;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.example.InsideOut.auth.PrincipalDetails;
import com.example.InsideOut.dao.UserRepository;
import com.example.InsideOut.model.MemberBean;

public class JwtAuthorizationFilter extends BasicAuthenticationFilter {

	private UserRepository userRepository;

	public JwtAuthorizationFilter(AuthenticationManager authenticationManager, UserRepository userRepository) {
		super(authenticationManager);
		this.userRepository = userRepository;
	}

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("권한이나 인증이 필요한 특정 주소를 요청");

		// header 확인
//		if (header == null || !header.startsWith(JwtProperties.TOKEN_PREFIX)) {
//			chain.doFilter(request, response);
//			return;
//		}

		Cookie[] cookies = request.getCookies();

		// 쿠키 확인
		if (cookies == null) {
			chain.doFilter(request, response);
			return;
		}

		String token = null;

		// 쿠키에서 JWT 토큰 추출
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals(JwtProperties.HEADER_STRING)) {
				token = cookie.getValue();
				break;
			}
		}

		// JWT 토큰 확인
		if (token == null) {
			chain.doFilter(request, response);
			return;
		}

//		System.out.println("header : " + header);

//		String token = request.getHeader(JwtProperties.HEADER_STRING).replace(JwtProperties.TOKEN_PREFIX, "");

		String username = JWT.require(Algorithm.HMAC512(JwtProperties.SECRET)).build().verify(token)
				.getClaim("username").asString();

		if (username != null) {
			MemberBean member = userRepository.findByUsername(username);

			PrincipalDetails principalDetails = new PrincipalDetails(member);

			// 토큰이 정상이면 authentication 객체 생성
			Authentication authentication = new UsernamePasswordAuthenticationToken(principalDetails, null,
					principalDetails.getAuthorities());

			// 강제로 시큐리티의 세션에 접근하여 값 저장
			SecurityContextHolder.getContext().setAuthentication(authentication);
		}

		chain.doFilter(request, response);
	}
}
