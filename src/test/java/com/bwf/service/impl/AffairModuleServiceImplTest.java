package com.bwf.service.impl;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.bwf.entity.AffairModule;

@RunWith(SpringRunner.class)
@ContextConfiguration(locations="classpath:spring-mybatis.xml")
public class AffairModuleServiceImplTest {
	
	Logger logger = LoggerFactory.getLogger(AffairModuleServiceImplTest.class);
	
	@Autowired
	AffairModuleServiceImpl amservice;
	
	@Test
	public void testAdd(){
		AffairModule affairModule = new AffairModule();
		affairModule.setAffairModuleName("出差申请单");
		affairModule.setAffairModuleProducerId(2);
		
		String[] optionNames = {"出差事由" ,"出差具体事由" ,"出差地点" , "出差开始时间" , "出差结束时间"};
		Integer[] optionIds = {3,2,1,8,8};
		String[] optionDatas = { "开会,业务交流,参观学习" , "" , "" , "" , "" };
		Integer[] approverId = {-1,3,2,11};
		amservice.add(affairModule, optionNames, optionIds, optionDatas, approverId);
		// logger.info(  "自动生成的自增列的值： {}" , affairModule.getAffairModuleId() );
		
	}

}
