package com.best.innerjoin.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.best.innerjoin.member.model.service.MemberService;
import com.best.innerjoin.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	// 로그인 폼으로 가기
	@RequestMapping("loginForm.ij")
	public String loginMember() {
		return "member/loginForm";
	}
	
	// 로그인
	@RequestMapping("login.ij")
	public String loginMember(Member member,Model model) {
		
		Member loginUser = mService.loginMember(member);
		
		System.out.println(loginUser);
		
		return null;
		
	}
	
	
	// 회원가입 폼으로 가기
	@RequestMapping("joinForm.ij")
	public String joinMember() {
		return "member/joinForm";
	}
	
	// 회원가입
	@RequestMapping(value="join.ij", method=RequestMethod.POST)
	public String insertMember(Member member, Model model) {
		System.out.println(member);
		
		int result = mService.insertMember(member);
		
		
		if(result>0) {
			return "redirect:loginForm.ij";
		}else {
			model.addAttribute("msg", "회원 가입 실패");
			return "common/errorPage";
		}
	}
	

}
