package com.best.innerjoin.member.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.BitSet;
import java.util.Date;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.UploadContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
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

import com.best.innerjoin.alarm.model.service.AlarmService;
import com.best.innerjoin.alarm.model.vo.Alarm;
import com.best.innerjoin.group.model.vo.Group;
import com.best.innerjoin.member.model.service.MemberService;
import com.best.innerjoin.member.model.vo.MailHandler;
import com.best.innerjoin.member.model.vo.Member;

@SessionAttributes({ "loginUser", "msg" })
@Controller
public class MemberController {

	@Autowired
	private MemberService mService;
	@Autowired
	private AlarmService alarmService;
	@Autowired
	private JavaMailSender mailSender;

	// 로그인 폼으로 가기
	@RequestMapping("loginForm.ij")
	public String loginMember() {
		return "member/loginForm";
	}

	// 로그인
	@RequestMapping("login.ij")
	public String loginMember(Member member, Model model, HttpServletRequest request, RedirectAttributes rd) {

		Member loginUser = mService.loginMember(member);

		if (loginUser != null) {
			model.addAttribute("loginUser", loginUser);
			// return "home"; // forward 방식
			return "redirect:myGroupForm.ij"; //
		} else {
			rd.addFlashAttribute("errorMsg", "아이디 또는 비밀번호를 다시 확인하세요.");
			return "redirect:loginForm.ij";
		}

	}

	// 회원가입 폼으로 가기
	@RequestMapping("joinForm.ij")
	public String joinMember() {
		return "member/joinForm";
	}

	// 회원가입
	@RequestMapping(value = "join.ij", method = RequestMethod.POST)
	public String insertMember(Member member, Model model, String birthday1, String birthday2, String birthday3) {

		if (!birthday1.equals("") && !birthday2.equals("") && !birthday3.equals("")) {
			member.setMemberBirthday(birthday1 + "/" + birthday2 + "/" + birthday3);
		}

		int result = mService.insertMember(member);

		if (result > 0) {
			return "redirect:loginForm.ij";
		} else {
			model.addAttribute("msg", "회원 가입 실패");
			return "common/errorPage";
		}
	}

	// 이메일 중복 검사
	@RequestMapping(value = "dupId.ij", method = RequestMethod.POST)
	@ResponseBody
	public String DuplicateIdCheck(String id) {
		System.out.println(id);
		boolean isUsable = mService.checkIdDup(id) == 0 ? true : false;
		System.out.println(isUsable);
		return isUsable + "";
	}

	// 닉네임 중복검사
	@RequestMapping(value = "dupName.ij", method = RequestMethod.POST)
	@ResponseBody
	public String DuplicateNameCheck(String name) {
		boolean isUsable = mService.checkNameDup(name) == 0 ? true : false;
		return isUsable + "";
	}

	// 마이페이지로 이동
	@RequestMapping("myGroupForm.ij")
	public ModelAndView myGroup(ModelAndView mv, HttpServletRequest request) {
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		

		// 내 모임 목록
		ArrayList<Member> list = mService.selectList(loginUser);

		// 초대받은 모임 목록
		ArrayList<Member> invList = mService.selectInvList(loginUser);
		
		// 신청 목록
		ArrayList<Member> waitList = mService.selectWaitList(loginUser);


		// 내 모임 목록
		if (list != null) { // 내 모임 목록이 있을 때
			mv.addObject("list", list).setViewName("member/myGroup");
		} else {
			mv.addObject("msg", " 내 목임 목록 조회 오류 발생").setViewName("common/errorPage");
		}

		// 초대받은 모임 목록
		if (invList != null) {
			mv.addObject("invList", invList).setViewName("member/myGroup");
			
		} else {
			mv.addObject("msg", " 내 목임 목록 조회 오류 발생").setViewName("common/errorPage");
		}

		// 신청 모임 목록
		if (waitList != null) {
			mv.addObject("waitList", waitList).setViewName("member/myGroup");
		} else {
			mv.addObject("msg", " 내 목임 목록 조회 오류 발생").setViewName("common/errorPage");
		}

		return mv;
	}

	// 모임 초대 거절
	@RequestMapping("invDeny.ij")
	public String deleteInv(HttpServletRequest request, int gNo, Model model) {
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");

		int result = mService.deleteInv(loginUser, gNo);

		if (result > 0) {
			return "redirect:myGroupForm.ij";
		} else {
			model.addAttribute("msg", "초대 거절  도중 오류 발생");
			return "common/errorPage";
		}
	}
	
	
	// 다른사람 마이페이지로 이동
		@RequestMapping("otherGroupForm.ij")
		public ModelAndView otherGroup(ModelAndView mv, HttpServletRequest request,String memberId) {
			
			
			Member otherUser = mService.selectMemberInfo(memberId);
			mv.addObject("otherUser", otherUser);
			

			// 내 모임 목록
			ArrayList<Member> list = mService.selectList(otherUser);

			// 초대받은 모임 목록
			ArrayList<Member> invList = mService.selectInvList(otherUser);

			// 신청 목록
			ArrayList<Member> waitList = mService.selectWaitList(otherUser);


			// 내 모임 목록
			if (list != null) { // 내 모임 목록이 있을 때
				mv.addObject("list", list).setViewName("member/otherGroup");
			} else {
				mv.addObject("msg", " 내 목임 목록 조회 오류 발생").setViewName("common/errorPage");
			}

			// 초대받은 모임 목록
			if (invList != null) {
				mv.addObject("invList", invList).setViewName("member/otherGroup");
			} else {
				mv.addObject("msg", " 내 목임 목록 조회 오류 발생").setViewName("common/errorPage");
			}

			// 신청 모임 목록
			if (waitList != null) {
				mv.addObject("waitList", waitList).setViewName("member/otherGroup");
			} else {
				mv.addObject("msg", " 내 목임 목록 조회 오류 발생").setViewName("common/errorPage");
			}
			
			return mv;
		}
	
	
	
	
	

	// 모임 초대 수락
	@RequestMapping("invAccept.ij")
	public String updateInv(HttpServletRequest request, int gNo, Model model) {
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");

		int result = mService.updateInv(loginUser, gNo);

		if (result > 0) {
			return "redirect:myGroupForm.ij";
		} else {
			model.addAttribute("msg", "초대 수락 도중 오류 발생");
			return "common/errorPage";
		}
	}

	// 모임 가입신청 취소
	@RequestMapping("waitCancel.ij")
	public String waitCancel(HttpServletRequest request, int gNo, Model model) {
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");

		int result = mService.deleteWait(loginUser, gNo);

		if (result > 0) {
			return "redirect:myGroupForm.ij";
		} else {
			model.addAttribute("msg", "취소 도중 오류 발생");
			return "common/errorPage";
		}
	}

	// 프로필 수정으로 이동
	@RequestMapping(value = "profileUpdateForm.ij", method = RequestMethod.POST)
	public ModelAndView profileUpdateForm(Member member, ModelAndView mv) {
		member = mService.getMember(member);
		mv.addObject("member",member);
		mv.setViewName("member/profileUpdate");
		return mv;
	}

	// 프로필 수정
	@RequestMapping(value = "profileUpdate.ij", method = RequestMethod.POST)
	public String profileUpdate(Member member, Model model, HttpServletRequest request, MultipartFile reloadFile) {
		if (reloadFile != null && !reloadFile.isEmpty()) {
		
			System.out.println(reloadFile.getOriginalFilename());
			String originFile = mService.getOriginFileName(member.getMemberId());
			String renameFile = "";
			if (!originFile.equals("user.png")) {
				deleteFile(member.getMemberProPath(), request);
			}
			
			renameFile = renameFile(reloadFile);
			saveFile(renameFile, reloadFile, request);
			member.setMemberProPath(renameFile);
			
		}
		
		int result = 0;
		int result2 = 0;
		
		if(!member.getmemberIntroduce().isEmpty()) {
			result = mService.updateProfileAdd(member);
		}
		result2 = mService.updateProfile(member);
		
		
		
		if (result > 0) {
			model.addAttribute(member);
		} else {

		}
		return "member/profileUpdate";
	}

	public void saveFile(String renameFileName, MultipartFile uploadfile, HttpServletRequest request) {

		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\images\\member";
		File folder = new File(savePath);

		String filePath = folder + "\\" + renameFileName;

		// 파일 저장 성공 여부(성공 1, 실패0)
		try {
			uploadfile.transferTo(new File(filePath));
			// 업로드된 파일을 filePath에 지정된 경로 + 파일명으로 저장하겠다.
			// -> IOException 예외 처리 필요
			System.out.println("파일경로 : "+filePath);
		} catch (Exception e) {
			System.out.println("파일 전송 에러" + e.getMessage());
		}
	}

	public String renameFile(MultipartFile file) {
		// "년월일시분초.확장자" 로 파일명 변경
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName = "";
		renameFileName = sdf.format(new Date()) + originFileName.substring(originFileName.lastIndexOf("."));
		return renameFileName;
	}

	// 파일 삭제
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resource");
		String savePath = root + "\\images\\member";

		File deleteFile = new File(savePath + "\\" + fileName);

		if (deleteFile.exists()) {
			deleteFile.delete();
		}
	}

	// 쪽지함으로 이동

	// 알림함으로 이동
	@RequestMapping("myNewsForm.ij")
	public String myNewsForm(HttpServletRequest request, Model model) {
		String receiveId = ((Member) request.getSession().getAttribute("loginUser")).getMemberId();

		ArrayList<Alarm> list = alarmService.selectMyAlarm(receiveId);

		model.addAttribute("list", list);

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
	@RequestMapping(value = "checkPwd.ij", method = RequestMethod.POST)
	public String checkPwd(HttpServletRequest request, String memberPwd, Model model) {
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		String loginUserPwd = loginUser.getMemberPwd();
		int result = mService.checkPwd(loginUserPwd, memberPwd); 
		
		// select count(*) from member where member_id = ${아이디} and member_pwd = ${pwd}; 
		if (result > 0) {
			return "redirect:infoUpdateForm.ij?memberId="+loginUser.getMemberId();
		} else {
			model.addAttribute("msg", "일치하지않습니다. 다시 입력해 주세요.");
			return "redirect:checkPwdForm.ij";
		}

	}

	// 정보수정으로 이동
	@RequestMapping(value = "infoUpdateForm.ij", method = RequestMethod.GET)
	public String infoUpdateForm(String memberId, Model model) {
		System.out.println(memberId);
		Member member = mService.selectMember(memberId);
		System.out.println(member);
		model.addAttribute("Member",member);
		return "member/infoUpdate";
	}

	// 정보수정
	@RequestMapping(value = "infoUpdate.ij", method = RequestMethod.POST)
	public String infoUpdate(Member member, Model model, String birthday1, String birthday2, String birthday3) {

		if (!birthday1.equals("") && !birthday2.equals("") && !birthday3.equals("")) {
			member.setMemberBirthday(birthday1 + "/" + birthday2 + "/" + birthday3);
		}

		System.out.println("수정" + member);

		int result = mService.updateInfo(member);

		if (result > 0) {
			return "redirect:infoUpdateForm.ij";
		} else {
			model.addAttribute("msg", "정보 수정 중 오류 발생");
			return "redirect:infoUpdateForm.ij";
		}
	}

	// 로그아웃
	@RequestMapping("logout.ij")
	public String memberLogout(SessionStatus status, HttpSession session) {
		// 세션의 상태를 관리할 수 있는 객체

		// @SessionAttributes를 사용하였을 때
		// Session을 만료 시키기 위해서는
		// status.setComplete()를 호출해야 함.
		status.setComplete();
		// session.invalidate();
		return "redirect:/";
	}

	// 탈퇴하기
	@RequestMapping("mLeave.ij")
	public String memberDelete(SessionStatus status, RedirectAttributes rdAttr, Model model,
			HttpServletRequest request) {
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		int result = mService.deleteMember(loginUser);

		if (result > 0) {
			rdAttr.addFlashAttribute("leaveMsg", "탈퇴되셨습니다.");
			status.setComplete();
			System.out.println("2adfadfa");

			return "redirect:/";
		} else {
			model.addAttribute("msg", "회원탈퇴 도중 오류가 발생했습니다.");
			return "common/errorPage";
		}
	}

	// 구글회원가입 여부
	@ResponseBody
	@RequestMapping("googleJoinedChk.ij")
	public String googleJoinedChk(String memberId) {
		String isJoined = mService.googleJoinedChk(memberId);
		System.out.println(isJoined);
		return isJoined;
	}

	// 구글로그인
	@RequestMapping("googleLogin.ij")
	public String googleLogin(Member member, Model model, RedirectAttributes rd) {
		Member loginUser = mService.googleLogin(member);
		if (loginUser != null) {
			model.addAttribute("loginUser", loginUser);
			// return "home"; // forward 방식
			return "redirect:/"; //
		} else {
			rd.addFlashAttribute("msg", "아이디 또는 비밀번호를 다시 확인하세요.");
			return "redirect:loginForm.ij";
		}
	}

	// 비밀번호 찾기
	@RequestMapping("findPwd.ij")
	public String findPwd(String memberId, Model model) throws MessagingException,UnsupportedEncodingException {
		System.out.println("이메일로 인증 발송");
		
		int result = mService.checkIdDup(memberId);
		if( result > 0) {
			String host = "http://localhost:8080/innerjoin/";
			MailHandler sendMail = new MailHandler(mailSender);
			sendMail.setSubject("[비밀번호 변경]");
			sendMail.setText(new StringBuffer().append("<h1>비밀번호 변경</h1>")
					.append("<h2><a href =" + host + "infoUpdateForm.ij?memberId="+ memberId + "> 비밀번호 재설정하기 </a></h2>").toString());
			sendMail.setFrom("rjrinal@gmail.com", "InnerJoin");
			
			sendMail.setTo(memberId);
			sendMail.send();
			
			model.addAttribute("memberId", memberId);
			return "member/findPwdResult";
			
		} else {
			model.addAttribute("이메일 전송 실패");
			return "common/errorPage";
		}
		
	}
	

}
