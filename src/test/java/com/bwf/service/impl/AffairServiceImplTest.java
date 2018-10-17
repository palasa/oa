package com.bwf.service.impl;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.bwf.entity.Affair;
import com.bwf.entity.AffairChain;
import com.bwf.service.IAffairService;

@RunWith(SpringRunner.class)
@ContextConfiguration(locations="classpath:spring-mybatis.xml")
public class AffairServiceImplTest {
	
	Logger logger = LoggerFactory.getLogger(AffairServiceImplTest.class);
	
	@Autowired
	IAffairService affairService;
	
	@Test
	public void testGetAffairDetailByAffairId(){
		
		Affair affair = affairService.getAffairDetailByAffairId(11);
		
		for( AffairChain chain : affair.getAffairChains() ) {
			logger.info( " {} , {}  " , chain.getAffairChainId()  , chain.getAffairChainStatus() );
		}
	}

}
