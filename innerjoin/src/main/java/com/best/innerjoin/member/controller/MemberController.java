package com.best.innerjoin.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.best.innerjoin.member.model.service.MemberService;
import com.best.innerjoin.member.model.vo.Member;

@SessionAttributes({"loginUser", "msg"})
@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	
	@RequestMapping("login.ij")
	public String loginMember(Member member,Model model,HttpServletRequest request) {
		
		Member loginUser = mService.loginMember(member);
		
		if(loginUser != null) {
			
			model.addAttribute("loginUser",loginUser);
			
		}else {
			model.addAttribute("msg", "아이디나 비밀번호를 확인해주세요");
		}
		
		return null;
		
	}
	
	@RequestMapping("login2.ij")
	public String loginMember() {
		return "member/loginForm";
	}
}
