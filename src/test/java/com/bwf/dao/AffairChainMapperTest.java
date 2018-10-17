package com.bwf.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.bwf.entity.AffairChain;

@RunWith(SpringRunner.class)
@ContextConfiguration(locations="classpath:spring-mybatis.xml")
public class AffairChainMapperTest {
	
	Logger logger = org.slf4j.LoggerFactory.getLogger(AffairChainMapperTest.class);
	
	@Autowired
	AffairChainMapper affairChainMapper;
	
	@Test
	public void testPropose (){
		AffairChain affairChain = new AffairChain();
		affairChain.setAffairChainId(16);
		affairChain.setAffairChainComment("同意");
		affairChain.setAffairChainStatus(2);
		
		
		affairChainMapper.propose(affairChain);
	}

}
