package com.ina.persistence;

import java.util.List;

import com.kinder.domain.ChildrenVO;
import com.kinder.domain.GuardianVO;
import com.kinder.domain.MemberVO;
import com.kinder.domain.TeacherVO;
import com.kinder.dto.LoginDTO;



public interface ChildrenDAO {
   
   public void insertChild(ChildrenVO cv);
   
   public int checkGid(String memid);

   public List<ChildrenVO> childInfo(int gcode);
   
   public void updateRank(ChildrenVO cv);
   
   public String search_child(int ccode);
	
   
}