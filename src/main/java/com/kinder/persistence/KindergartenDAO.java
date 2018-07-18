package com.kinder.persistence;

import java.util.List;



import com.kinder.domain.KindergartenVO;
import com.kinder.domain.SearchCri;




public interface KindergartenDAO {
   
   public List<KindergartenVO> searchKinder (SearchCri cri);
   
   public KindergartenVO searchKinder2 (int kincode);
}