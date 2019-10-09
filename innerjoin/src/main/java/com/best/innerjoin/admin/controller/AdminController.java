package com.best.innerjoin.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.best.innerjoin.admin.model.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adService;
	
	//임시 관리자 페이지로 이동
	@RequestMapping("admin.ij")
	public String adminView() {
		return "admin/admin";
	}

	/** 회원관리페이지 이동
	 * @return
	 */
	@RequestMapping("manageMember.ij")
	public String manageMemberView() {
		return "admin/manageMember";
	}
	
	@RequestMapping("googleLogin.ij")
	public String googleLogin() {
		return "member/loginTest";
	}


}
