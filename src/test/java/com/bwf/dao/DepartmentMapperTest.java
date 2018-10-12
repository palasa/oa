package com.bwf.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.bwf.entity.Department;
import com.bwf.entity.User;

@RunWith(SpringRunner.class)
@ContextConfiguration(locations="classpath:spring-mybatis.xml")
public class DepartmentMapperTest {
	
	@Autowired
	DepartmentMapper departmentMapper;
	
	@Test
	public void testGetAll(){
		
		List<Department> departments = departmentMapper.getAll();
		for( Department d : departments ) {
			System.out.println( d.getDepartmentName() );
			
			System.out.print( "\t" );
			for( User user : d.getUsers() ) {
				System.out.print( user.getNickname() + "," );
			}
			System.out.println();
		}
		
	}

}
