package com.bwf.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bwf.entity.AffairModule;
import com.bwf.entity.ModuleOption;
import com.bwf.entity.User;


// 公文模板控制器 
@Controller
@RequestMapping("affair_module")
public class AffairModuleController {
	
	@Autowired
	com.bwf.service.IDepartmentService departmentService;
	
	@Autowired
	com.bwf.service.IAffairModuleService affairModuleService;

	@GetMapping("show")
	public String show(){
		
		return "affair_module/show";
	}
	
	@GetMapping("add")
	public String add(ModelMap modelMap){
		
		modelMap.addAttribute("allDepartments", departmentService.getAll() ) ;
		return "affair_module/add";
	}
	
	@PostMapping("doAdd")
	public String doAdd( AffairModule affairModule , 
			String[] optionName , 
			Integer[] optionId , 
			String[] optionData ,
			Integer[] approverId ,
			HttpSession session
	) {
		
		User user = ( User ) session.getAttribute("user");
		affairModule.setAffairModuleProducerId( user.getUserId() );
		
		affairModuleService.add( affairModule ,optionName , optionId ,  optionData, approverId );
		
		return "redirect:/affair_module/show";
	}
	
	
	
}
