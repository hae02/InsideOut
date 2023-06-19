package com.example.InsideOut.auth;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.InsideOut.dao.UserRepository;
import com.example.InsideOut.model.MemberBean;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PrincipalDetailsService implements UserDetailsService{
	
	private final UserRepository userRepository;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println("PrincipalDetailsService : 진입");
		MemberBean memberBean = userRepository.findByUsername(username);

		// session.setAttribute("loginUser", user);
		return new PrincipalDetails(memberBean);
	}
	
}
