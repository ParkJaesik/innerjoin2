package com.best.innerjoin.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.best.innerjoin.member.model.service.MemberService;
import com.best.innerjoin.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	
	@RequestMapping("login.ij")
	public String loginMember(Member member,Model model) {
		
		Member loginUser = mService.loginMember(member);
		
		System.out.println(loginUser);
		
		return null;
		
	}
}
