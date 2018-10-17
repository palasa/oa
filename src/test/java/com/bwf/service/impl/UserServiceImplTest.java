package com.bwf.service.impl;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.bwf.entity.User;
import com.bwf.service.IUserService;
import com.bwf.utils.StringUtils;

@RunWith(SpringRunner.class)
@ContextConfiguration(locations="classpath:spring-mybatis.xml")
public class UserServiceImplTest {
	
	Logger logger = LoggerFactory.getLogger(UserServiceImplTest.class);
	
	@Autowired
	IUserService userServiceImpl;
	
	@Test
	public void testLogin(){
		User user = new User();
		user.setUsername("yuxiao");
		user.setPassword("123");
		user.setPassword( StringUtils.md5( user.getPassword() ) );
		
		User loginUser =  userServiceImpl.login(user);
		System.out.println( loginUser );
		logger.info( "{} , {}" ,  loginUser.getUserId() , loginUser.getNickname() );
	}

}
