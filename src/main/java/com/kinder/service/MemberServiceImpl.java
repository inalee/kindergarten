package com.kinder.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kinder.domain.MemberVO;
import com.kinder.dto.LoginDTO;
import com.kinder.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

   @Inject
   private MemberDAO dao;
   
   @Override
   public MemberVO login(LoginDTO dto) throws Exception {
      return dao.login(dto);
   }

   @Override
   public MemberVO nlogin(MemberVO vo) throws Exception {
      return dao.nLogin(vo);
   }

   
}