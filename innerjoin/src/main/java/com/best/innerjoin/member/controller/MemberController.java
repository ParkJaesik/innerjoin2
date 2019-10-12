package com.best.innerjoin.member.controller;

import java.util.ArrayList;
import java.util.BitSet;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.best.innerjoin.group.model.vo.Group;
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
	public String loginMember(Member member,Model model,HttpServletRequest request, RedirectAttributes rd) {
		
		Member loginUser = mService.loginMember(member);
		
		if(loginUser != null) {
			model.addAttribute("loginUser", loginUser);
			//return "home"; // forward 방식
			return "redirect:/"; //
		}else {
			rd.addFlashAttribute("msg", "아이디 또는 비밀번호를 다시 확인하세요.");
			return "redirect:loginForm.ij";
		}
		
	}
	
	
	// 회원가입 폼으로 가기
	@RequestMapping("joinForm.ij")
	public String joinMember() {
		return "member/joinForm";
	}
	

	// 회원가입
	@RequestMapping(value="join.ij", method=RequestMethod.POST)
	public String insertMember(Member member, Model model, String birthday1, String birthday2, String birthday3) {
		
		if(!birthday1.equals("") && !birthday2.equals("") && !birthday3.equals("")) {
			member.setMemberBirthday(birthday1 + "/" + birthday2 + "/" + birthday3);
		}
		
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
	
	
	// 마이페이지로 이동
	@RequestMapping("myGroupForm.ij")
	public ModelAndView myGroup(ModelAndView mv, HttpServletRequest request) {
		
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		System.out.println(loginUser);
		
		// 내 모임 목록
		ArrayList<Member> list = mService.selectList(loginUser);
		
		// 초대받은 모임 목록
		ArrayList<Member> invList = mService.selectInvList(loginUser);
		
		// 신청 목록
		ArrayList<Member> waitList = mService.selectWaitList(loginUser); 
		
		System.out.println(list);
		
		// 내 모임 목록
		if(list != null) { // 내 모임 목록이 있을 때
			mv.addObject("list", list).setViewName("member/myGroup");
		} else {
			mv.addObject("msg", " 내 목임 목록 조회 오류 발생").setViewName("common/errorPage");
		}
		
		// 초대받은 모임 목록
		if(invList != null) {
			mv.addObject("invList", invList).setViewName("member/myGroup");
		} else {
			mv.addObject("msg", " 내 목임 목록 조회 오류 발생").setViewName("common/errorPage");
		}
		
		// 신청 모임 목록
		if(waitList != null) {
			mv.addObject("waitList", waitList).setViewName("member/myGroup");
		} else {
			mv.addObject("msg", " 내 목임 목록 조회 오류 발생").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	// 모임 초대 거절
	@RequestMapping("invDeny.ij")
	public String deleteInv(HttpServletRequest request, int gNo, Model model) {
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		

		int result = mService.deleteInv(loginUser, gNo);
		
				
		if(result > 0) {
			return "redirect:myGroupForm.ij";
		}else {
			model.addAttribute("msg", "초대 거절  도중 오류 발생");
			return "common/errorPage";
		}
	}
	
	// 모임 초대 수락
	@RequestMapping("invAccept.ij")
	public String updateInv(HttpServletRequest request, int gNo, Model model) {
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		int result = mService.updateInv(loginUser, gNo);
			
		if(result > 0) {
			return "redirect:myGroupForm.ij";
		}else {
			model.addAttribute("msg", "초대 수락 도중 오류 발생");
			return "common/errorPage";
		}
	}
	
	// 모임 가입신청 취소
	@RequestMapping("waitCancel.ij")
	public String waitCancel(HttpServletRequest request, int gNo, Model model) {
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		int result = mService.deleteWait(loginUser, gNo);
		
		if(result > 0) {
			return "redirect:myGroupForm.ij";
		}else {
			model.addAttribute("msg","취소 도중 오류 발생");
			return "common/errorPage";
		}
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
	
	// 비밀번호 찾기 폼으로 가기
	@RequestMapping("findPwdForm.ij")
	public String findPwd() {
		return "member/findPwd";
	}
	
	// 정보수정 시 비밀번호 입력 폼으로 이동
	@RequestMapping("checkPwdForm.ij")
	public String checkPwdFrom() {
		return "member/checkPwd";
	}
	
	// 비밀번호 확인
	@RequestMapping(value="checkPwd.ij", method=RequestMethod.POST)
	public String checkPwd(Member loginUser, String memberPwd, Model model ) {
		String loginUserPwd = loginUser.getMemberPwd();
		
		int result = mService.checkPwd(loginUserPwd, memberPwd);
		
		if(result > 0) {
			return "redirect:infoUpdateForm.ij";
		}else{
			model.addAttribute("msg", "일치하지않습니다. 다시 입력해 주세요.");
			return "redirect:checkPwdForm.ij";
		}

		
	}
	// 정보수정으로 이동
	@RequestMapping("infoUpdateForm.ij")
	public String infoUpdateForm() {
		return "member/infoUpdate";
	}
	
	

	// 비밀번호 찾기
//	@RequestMapping()

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
	
	// 탈퇴하기
	@RequestMapping("mLeave.ij")
	public String memberDelete(SessionStatus status, RedirectAttributes rdAttr, Model model, HttpServletRequest request) {
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		int result = mService.deleteMember(loginUser);
				
		if(result > 0) {
			rdAttr.addFlashAttribute("leaveMsg", "탈퇴되셨습니다.");
			status.setComplete();
			System.out.println("2adfadfa");
					
			return "redirect:/";
		}else {
			model.addAttribute("msg", "회원탈퇴 도중 오류가 발생했습니다.");
			return "common/errorPage";
		}
	}
	
	

}
