package com.hojung.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hojung.domain.KinsearchCri;
import com.hojung.persistence.KinderDAO;
import com.kinder.domain.KindergartenVO;

@Service
public class KinderServiceImpl implements KinderService {
	
	@Inject
	private KinderDAO dao;

	@Override
	public List<KindergartenVO> selectKinders_kw(KinsearchCri cri) throws Exception {
		return dao.selectKinders_kw(cri);
	}

	@Override
	public List<KindergartenVO> selectKinders_map(KinsearchCri cri) throws Exception {
		return dao.selectKinders_map(cri);
	}

//	@Override
//	public void regist(BoardVO board) throws Exception {
//		dao.create(board);
//	}
//
//	@Override
//	public BoardVO read(Integer bno) throws Exception {
//		return dao.read(bno);
//	}
//
//	@Override
//	public void modify(BoardVO board) throws Exception {
//		dao.update(board);
//	}
//
//	@Override
//	public void remove(Integer bno) throws Exception {
//		dao.delete(bno);
//	}
//
//	@Override
//	public List<BoardVO> listAll() throws Exception {
//		return dao.listAll();
//	}
//
//	@Override
//	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
//		return dao.listCriteria(cri);
//	}
//
//	@Override
//	public int listCountCriteria(Criteria cri) throws Exception {
//		return dao.countPaging(cri);
//	}
//
//	@Override
//	public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception {
//		return dao.listSearch(cri);
//	}
//
//	@Override
//	public int listSearchCount(SearchCriteria cri) throws Exception {
//		return dao.listSearchCount(cri);
//	}

}
