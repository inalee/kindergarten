package com.kinder.persistence;

import java.util.List;
import java.util.Map;

import com.kinder.domain.ChildrenVO;
import com.kinder.domain.ClassVO;
import com.kinder.domain.KindergartenVO;
import com.kinder.domain.SearchCri;




public interface KindergartenDAO {
   
   public List<KindergartenVO> searchKinder (SearchCri cri);
   
   public KindergartenVO searchKinder2 (int kincode);
   
   public void make_class (ClassVO cv);
   
   public List<ChildrenVO> select_kinder_child (int kincode);
   
   public List<ClassVO> select_class (int kincode);
   
   public void update_class (ChildrenVO cv);
  
   public List<Map<String, Object>> find_teacher (int kincode);
   
   public List<Map<String, Object>> all_child (int kincode);
   
   public List<Map<String, Object>> class_info (int kincode);
}