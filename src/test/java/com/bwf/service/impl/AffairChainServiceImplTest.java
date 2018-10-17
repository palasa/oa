package com.bwf.service.impl;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.bwf.entity.AffairChain;
import com.bwf.service.IAffairChainService;

@RunWith(SpringRunner.class)
@ContextConfiguration(locations="classpath:spring-mybatis.xml")
public class AffairChainServiceImplTest {
	
	Logger logger = LoggerFactory.getLogger(AffairModuleServiceImplTest.class);
	
	@Autowired
	IAffairChainService affairChainService;
	
	@Test
	public void testPropose(){
		AffairChain affairChain = new AffairChain();
		affairChain.setAffairChainId(20);
		affairChain.setAffairChainComment("这怎么行!");
		affairChain.setAffairChainStatus(3);
		
		affairChainService.propose(affairChain);		
	}

}
