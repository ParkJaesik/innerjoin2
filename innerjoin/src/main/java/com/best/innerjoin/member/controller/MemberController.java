package com.best.innerjoin.member.controller;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.best.innerjoin.member.model.service.MemberService;
import com.best.innerjoin.member.model.vo.Member;


@SessionAttributes({"loginUser", "msg"})
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
	
	// 이메일  중복 검사
	@RequestMapping(value="dupId.ij", method=RequestMethod.POST)
	@ResponseBody
	public String DuplicateIdCheck(String id) {
		System.out.println(id);
		boolean isUsable = mService.checkIdDup(id) == 0 ? true : false;
		System.out.println(isUsable);
		return isUsable+"";
	}
	
	// 닉네임 중복검사
	@RequestMapping(value="dupName.ij", method=RequestMethod.POST)
	@ResponseBody
	public String DuplicateNameCheck(String name) {
		boolean isUsable = mService.checkNameDup(name) == 0 ? true : false;
		return isUsable+"";
	}
	
	// 비밀번호 찾기 폼으로 가기
	@RequestMapping("findPwdForm.ij")
	public String findPwd() {
		return "member/findPwd";
	}
	
	
	// 마이페이지로 이동
	@RequestMapping("myGroupForm.ij")
	public ModelAndView myGroup(Member member, ModelAndView mv, HttpServletRequest request) {
		ArrayList<Member> list = mService.selectList();
		
		if(list != null) {
			mv.addObject("list", list).setViewName("member/myGroup");
		} else {
			mv.addObject("msg", " 내 목임 목록 조회 오류 발생").setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 프로필 수정으로 이동
	@RequestMapping("profileUpdateForm.ij")
	public String profileUpdateForm() {
		return "member/profileUpdate";
	}
	
	
	// 쪽지함으로 이동
	@RequestMapping("myNoteForm.ij")
	public String myNoteForm() {
		return "member/myNote";
	}
	
	// 알림함으로 이동
	@RequestMapping("myNewsForm.ij")
	public String myNewsForm() {
		return "member/myNews";
	}
	
	// 정보수정으로 이동
	@RequestMapping("infoUpdateForm.ij")
	public String infoUpdateForm() {
		return "member/infoUpdate";
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
