package com.bwf.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


// 公文模板控制器 
@Controller
@RequestMapping("affair_module")
public class AffairModuleController {
	
	@Autowired
	com.bwf.service.IDepartmentService departmentService;

	@GetMapping("show")
	public String show(){
		
		return "affair_module/show";
	}
	
	@GetMapping("add")
	public String add(ModelMap modelMap){
		
		modelMap.addAttribute("allDepartments", departmentService.getAll() ) ;
		return "affair_module/add";
	}
}
