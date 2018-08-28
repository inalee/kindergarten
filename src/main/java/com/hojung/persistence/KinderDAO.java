package com.hojung.persistence;

import java.util.List;

import com.hojung.domain.KinsearchCri;
import com.kinder.domain.GuardianVO;
import com.kinder.domain.KindergartenVO;

public interface KinderDAO {

	public String getTime();
	
	public List<KindergartenVO> selectKinders_kw(KinsearchCri cri) throws Exception;
	
	public List<KindergartenVO> selectKinders_map(KinsearchCri cri) throws Exception;
	
	public GuardianVO selectGuardian(String memid) throws Exception;
	
//	public void insertMember(MemberVO vo);
//	
//	public MemberVO readMember(String userid) throws Exception;
//	
//	public MemberVO readWithPW(String userid, String userpw) throws Exception;
//	
//	
//	
//	public void removeMember(String userid);
//	
//	public void modifyMember(MemberVO vo);
}
