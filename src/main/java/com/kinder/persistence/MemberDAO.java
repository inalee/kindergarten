package com.kinder.persistence;

import com.kinder.domain.GuardianVO;
import com.kinder.domain.MemberVO;
import com.kinder.domain.TeacherVO;
import com.kinder.dto.LoginDTO;



public interface MemberDAO {
   
   public String getTime();
   
   public void insertMember(MemberVO vo);
   
   public MemberVO login(LoginDTO dto) throws Exception;
   
   public void insertGuardian(GuardianVO gv);
   
   public void insertTeacher(TeacherVO tv);

   public int checkMemId(String memid);

   public MemberVO nLogin(MemberVO vo) throws Exception;
   
}