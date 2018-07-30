package com.hojung.service;

import java.util.List;

import com.hojung.domain.KinsearchCri;
import com.kinder.domain.KindergartenVO;

public interface KinderService {
	
	public List<KindergartenVO> selectKinders_kw(KinsearchCri cri) throws Exception;
	
	public List<KindergartenVO> selectKinders_map(KinsearchCri cri) throws Exception;

//	public void regist(BoardVO board) throws Exception;
//	
//	public BoardVO read(Integer bno) throws Exception;
//	
//	public void modify(BoardVO board) throws Exception;
//	
//	public void remove(Integer bno) throws Exception;
//	
//	
//	
//	public List<BoardVO> listCriteria(Criteria cri) throws Exception;
//	
//	public int listCountCriteria(Criteria cri) throws Exception;
//	
//	public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception;
//	
//	public int listSearchCount(SearchCriteria cri) throws Exception;
}
