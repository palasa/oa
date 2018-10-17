package com.bwf.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.bwf.entity.Affair;
import com.bwf.entity.AffairChain;
import com.bwf.entity.User;

@RunWith(SpringRunner.class)
@ContextConfiguration(locations="classpath:spring-mybatis.xml")
public class AffairMapperTest {

	@Autowired
	AffairMapper affairMapper;
	
	@Autowired
	UserMapper userMapper;
	
	Logger logger = org.slf4j.LoggerFactory.getLogger(AffairMapperTest.class);
	
//	@Test
//	public void testGetAffairByMe(){
//		User user = new User();
//		user.setUserId(19);
//		List<Affair> affairs = affairMapper.getAffairByMe( user );
//		
//		logger.info(" {} , {}" , affairs.get(0).getProposer().getNickname() , affairs.get(0).getAffairModule().getAffairModuleName() );
//	}
	
	@Test
	public void testGetAffairDetailByAffairId(){
		Affair affair = affairMapper.getAffairDetailByAffairId(7);
		logger.info ( " {} , {} , {} " , affair.getAffairId() , affair.getAffairModule().getAffairModuleName() , affair.getProposer().getNickname()  );
		
		for( AffairChain chain : affair.getAffairChains() ) {
			logger.info( " {} , {} " , chain.getApprover() , userMapper.getUserById(chain.getApprover()).getNickname() );
		}
		
	}
	
}
