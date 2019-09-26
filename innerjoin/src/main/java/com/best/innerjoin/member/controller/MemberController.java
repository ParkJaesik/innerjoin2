package com.best.innerjoin.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

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
			model.addAttribute("loginUser", loginUser);
			//return "home"; // forward 방식
			return "redirect:/"; //
		}else {
			
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("loginForm.ij")
	public String loginMember() {
		return "member/loginForm";
	}
	
	@RequestMapping("joinForm.ij")
	public String joinMember() {
		return "member/joinForm";
	}
	
	@RequestMapping("logout.ij")
	public String memberLogout(SessionStatus status,
								HttpSession session) {
		// 세션의 상태를 관리할 수 있는 객체
		
		// @SessionAttributes를 사용하였을 때
		// Session을 만료 시키기 위해서는
		// status.setComplete()를 호출해야 함.
		status.setComplete();
		//session.invalidate();
		return "redirect:/";
	}
}
