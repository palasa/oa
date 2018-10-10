package com.bwf.dao;


import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.bwf.entity.Operate;
import com.bwf.entity.User;

@RunWith(SpringRunner.class)
@ContextConfiguration(locations="classpath:spring-mybatis.xml")
public class UserMapperTest {

	@Autowired
	UserMapper userMapper;
	
	Logger logger = org.slf4j.LoggerFactory.getLogger(UserMapperTest.class);
	
	@Test
	public void testGetMenusAndOperatesByUserId(){
		User user = userMapper.getMenusAndOperatesByUserId(1);
		logger.info( user.getOperates().size() + "" );

		Assert.assertNotEquals( 0 , user.getOperates().size() );
	}
	
	@Test
	public void testGetAllUser(){
		Assert.assertEquals( 25 , userMapper.getAllUser().size() ); 
//		for( User user : userMapper.getAllUser() ) {
//			if ( user.getLeader() != null ) {
//				logger.info( user.getLeader().getNickname() );
//			}
//		}
	}
	
	@Test
	public void testGetAllUsersByPage(){
		Assert.assertEquals( 10 , userMapper.getAllUsersByPage(1, 10).size() );
		for( User user : userMapper.getAllUsersByPage(1, 10) ) {
			if ( user.getLeader() != null ) {
				logger.info( user.getLeader().getNickname() );
			}
		}
	}
	
	@Test
	public void deleteMulti(){
		Integer[] idArr = {4,5,6};
		userMapper.deleteMulti( idArr );
	}
}
