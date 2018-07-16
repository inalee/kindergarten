package com.kinder.service;

import com.kinder.domain.MemberVO;
import com.kinder.dto.LoginDTO;

public interface MemberService {
	public MemberVO login(LoginDTO dto) throws Exception;
	public MemberVO nlogin(MemberVO vo) throws Exception;
}
