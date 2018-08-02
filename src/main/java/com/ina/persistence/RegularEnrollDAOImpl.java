package com.ina.persistence;



import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.ina.domain.RegularEnrollVO;



@Repository
public class RegularEnrollDAOImpl implements RegularEnrollDAO{
	
	 @Inject
	   private SqlSession sqlSession;
	   
	   private static final String namespace = "com.kinder.mapper.ina.inaMapper";

	
	   @Override
	public void insert_regular(RegularEnrollVO rv) {
		   sqlSession.insert(namespace+".regular_insert", rv);
	}
	   
}
