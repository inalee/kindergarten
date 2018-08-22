package com.ina.persistence;


import java.util.List;
import com.ina.domain.EnrollBean;
import com.ina.domain.EnrollVO;
import com.kinder.domain.ChildrenVO;



public interface ChildrenDAO {
   
   public void insertChild(ChildrenVO cv);
   
   public int checkGid(String memid);

   public List<ChildrenVO> childInfo(int gcode);
   
   public void updateRank(ChildrenVO cv);
   
   public String search_child(int ccode);
	
   public void enroll_kinder(EnrollBean eb);
   
   public EnrollVO result_enroll(EnrollBean eb);
   
   public int Kin_num(int ccode);
   
   public int same_kin(EnrollBean eb);
   
   public ChildrenVO sel_child_info(int ccode);
   
   
}