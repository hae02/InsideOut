package com.example.InsideOut.configuration.jwt;

import java.io.IOException;
import java.util.Date;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.example.InsideOut.auth.PrincipalDetails;
import com.example.InsideOut.model.LoginRequestDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class JwtAuthenticationFilter extends UsernamePasswordAuthenticationFilter{

	private final AuthenticationManager authenticationManager;

	@Override
	public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response)
			throws AuthenticationException {
		System.out.println("JwtAuthenticationFilter : 로그인시도");

		//여기서 암호화 비교
		
	
		LoginRequestDto loginRequestDto = new LoginRequestDto();
		loginRequestDto.setUsername(request.getParameter("username"));
		loginRequestDto.setPassword(request.getParameter("password"));
		
		

		UsernamePasswordAuthenticationToken authenticationToken = 
				new UsernamePasswordAuthenticationToken(
						loginRequestDto.getUsername(), 
						loginRequestDto.getPassword());
		
		System.out.println("JwtAuthenticationFilter : 토큰생성완료");
		
		// 인증 성공하면 만드는 객체
		Authentication authentication = 
				authenticationManager.authenticate(authenticationToken);
		
		// principal에 username을 담고, password는 보안상 비워둠
		PrincipalDetails principalDetailis = (PrincipalDetails) authentication.getPrincipal();
		System.out.println("Authentication : "+principalDetailis.getUser().getUsername());
		
		return authentication;	
		
	}
	
	// JWT Token 생성해서 response에 담아주기
	@Override
	protected void successfulAuthentication(HttpServletRequest request, HttpServletResponse response, FilterChain chain,
			Authentication authResult) throws IOException, ServletException {
		System.out.println("successfulAuthentication 실행: 인증 완료");
		
		PrincipalDetails principalDetailis = (PrincipalDetails) authResult.getPrincipal();
		
		//여기서 JwtProperties 활용
		String jwtToken = JWT.create()
				.withSubject(principalDetailis.getUsername())
				.withExpiresAt(new Date(System.currentTimeMillis()+JwtProperties.EXPIRATION_TIME))
				//payload에 담기는 정보
				.withClaim("id", principalDetailis.getUser().getMem_no())
				.withClaim("username", principalDetailis.getUser().getUsername())
				.sign(Algorithm.HMAC512(JwtProperties.SECRET));

		// 쿠키 객체에 토큰 값 저장
		Cookie cookie = new Cookie(JwtProperties.HEADER_STRING, jwtToken);
		cookie.setMaxAge(JwtProperties.EXPIRATION_TIME);
		cookie.setPath("/");
		
		//응답 헤더에 해당 쿠키를 포함시켜 클라이언트로 전송
		response.addCookie(cookie);
	}
}
