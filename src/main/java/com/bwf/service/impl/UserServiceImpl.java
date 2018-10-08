package com.bwf.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bwf.dao.UserMapper;
import com.bwf.entity.User;
import com.bwf.service.IUserService;

@Service
public class UserServiceImpl implements IUserService {
	
	@Autowired
	UserMapper userMapper;

	// 在 service 中 ，单个方法中 执行多条 sql 语句， 我们通过作为一个 事务 来进行处理
	// 在 方法上 添加注解 @Transactional 
	@Transactional
	@Override
	public User login(User user) {		
		// 获取 user 的基本信息
		User u = userMapper.getUserByUsernameAndPassword( user );
		if( u != null ) {
			u = userMapper.getMenusAndOperatesByUserId(u.getUserId());
		}
		return u;
	}

//	@Override
//	public User getMenusByUserId(int userId) {
//		// TODO Auto-generated method stub
//		return userMapper.getMenusByUserId(userId);
//	}

}
