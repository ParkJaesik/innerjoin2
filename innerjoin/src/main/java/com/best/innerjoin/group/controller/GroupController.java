package com.best.innerjoin.group.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.best.innerjoin.alarm.model.service.AlarmService;
import com.best.innerjoin.event.model.service.EventService;
import com.best.innerjoin.event.model.vo.Event;
import com.best.innerjoin.group.model.service.GroupService;
import com.best.innerjoin.group.model.vo.Group;
import com.best.innerjoin.group.model.vo.GroupMember;
import com.best.innerjoin.member.model.service.MemberService;
import com.best.innerjoin.member.model.vo.Member;


@Controller
public class GroupController {
	
	@Autowired
	private GroupService gService;
	private AlarmService aService;
	@Autowired
	private EventService eService;
	@Autowired
	private MemberService mService;
	
	
	@RequestMapping("ginsertForm.ij")
	public String groupInsertForm() {
		return "group/groupInsert";
		
	}
	
	// 모임 만들기
	@RequestMapping(value="ginsert.ij", method=RequestMethod.POST)
	public String groupInsert(Group group, HttpServletRequest request, Model model, @RequestParam(name="uploadFile", required=true) MultipartFile uploadFile) {
		
		if(!uploadFile.getOriginalFilename().equals("")) {
			String filePath = saveFile(uploadFile, request);
			
			if(filePath != null) {
				group.setFilePath(uploadFile.getOriginalFilename());
			}
		}
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		GroupMember gmember = (GroupMember)request.getSession().getAttribute("memberId");
				
		int result = gService.insertGroup(group);
		int gNo = gService.getGno();
		
		String path= null;
		if(result>0) {
			
			//모임 생성 성공시 group-member테이블에 관리자로 행추가 
			int result2 = gService.insertGroupMemberAdmin(loginUser);
			
			path = "redirect:goGroupPage.ij?gNo="+gNo;
		}else {
			model.addAttribute("msg", "모임 생성 실패");
			path = "common/errorPage";
		}
		return path;
		
		
		
	}
	
	// 파일 저장 메소드
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root + "\\guploadFiles";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdir();
		}
		
		String filePath = folder + "\\" + file.getOriginalFilename();
		
		try {
			file.transferTo(new File(filePath));
		}catch (Exception e) {
			System.out.println("파일 전송 에러" + e.getMessage());
		}
		
		return filePath;
	}
	
	// 파일 삭제 메소드
	public void deleteFile(String fileName, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root + "\\guploadFiles";
		
		// 삭제할 파일 경로 + 파일명
		File deleteFile = new File(savePath + "\\" + fileName);
		
		// 해당 파일이 존재할 경우 삭제
		if(deleteFile.exists()) {
			deleteFile.delete();
		}
	}
	
	
	
//	클릭한 그룹 페이지로 이동하는 메소드
	@RequestMapping("goGroupPage.ij")
	public String goGroupPage(HttpServletRequest request,Group group,Model model,HttpServletResponse response) {
		
		int gNo = group.getgNo();
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		Integer groupMemberCode = -1;  
			if(loginUser!=null) {
			String memberId = loginUser.getMemberId();
			
			
			if(memberId != null) {
				groupMemberCode = gService.selectCode(memberId,gNo);
				if(groupMemberCode ==null) {
					groupMemberCode = 5;
					
				}
			}
		}
		Group tempGroup = gService.goGroupPage(gNo);
		
		
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM");
		
		Date time = new Date();
				
		String time1 = format1.format(time);
		
		ArrayList<Event> eList = eService.groupEventList(time1, ""+gNo);
		ArrayList<Member> memList = null;
		
		ArrayList<Event> eList2 = null;
		
		// 이벤트 리스트 최신 3개 자르기
		if(!eList.isEmpty()) {
			eList2 = new ArrayList<Event>();
			memList = new ArrayList<Member>();
			for(int i = 0; i < 3;i++) {
				
				eList2.add(eList.get(i));
				ArrayList<Member> mList = eService.selectMem(""+eList2.get(i).getEno());
				for(int j = 0; j < mList.size();j++ ) {
					memList.add(mList.get(j));
					System.out.println(memList.get(j).toString());
				}
			}
		}
		
		 System.out.println(groupMemberCode);
		 
		
		model.addAttribute("event", eList2);
		model.addAttribute("member", memList);
		model.addAttribute("group", tempGroup);
		model.addAttribute("groupMemberCode", groupMemberCode);
		request.getSession().setAttribute("group", tempGroup);
		request.getSession().setAttribute("gName", tempGroup.getgName());
		request.getSession().setAttribute("groupMemberCode", groupMemberCode);
		
		return "group/groupInfo";
	}
	
	
	@RequestMapping("insertGroupMember.ij")
	public String applyInsertGroup(HttpServletRequest request,Model model) {
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		int gNo  = ((Group)request.getSession().getAttribute("group")).getgNo();
		String memberId = loginUser.getMemberId();
		String hostName = ((Group)request.getSession().getAttribute("group")).getgHost();
		String hostId = gService.selectReceiverId(hostName);
		String gName =  ((Group)request.getSession().getAttribute("group")).getgName();
		String msg = memberId + "님이 " + "<a href='wgmlist.ij?gNo="+gNo + "'>" +  gName + " 모임에  가입신청을 했습니다."  +"</a>";
		
		int result = 0;
		int result2 = 0;
		result = gService.selectIsGroupMember(memberId,gNo);
		
		if(result>0) {
			result = gService.rejoinApplyGroupMember(memberId,gNo);
		}else {
			result = gService.applyInsertGroup(memberId,gNo);
		}
		
		if(result>0) {
			result2 = gService.insertAlarm(memberId,hostId,msg);
			
			
			if(result2>0) {
				return "redirect:goGroupPage.ij?gNo="+gNo;
			}else {
				return "common/errorPage";
			}
		}else {
			return "common/errorPage";
		}
		
	}



	// 그룹 회원 목록 조회
	@RequestMapping("gmlist.ij")
	public ModelAndView groupMemberList(ModelAndView mv, HttpServletRequest request) {
		int groupNo = ((Group)request.getSession().getAttribute("group")).getgNo();
		
		ArrayList<GroupMember> list = gService.groupMemberList(groupNo);
		
		if (list != null) {
			mv.addObject("list", list).setViewName("group/groupMember");
			
		} else {
			mv.addObject("msg", "회원 목록 조회 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	// 대기중인 그룹 회원 목록 조회
	@RequestMapping("wgmlist.ij")
	public ModelAndView waitingGroupMemberList(ModelAndView mv, HttpServletRequest request,Integer gNo) {
		
		
		int groupNo = 0;
		if(request.getSession().getAttribute("group")!=null) {
			groupNo = ((Group)request.getSession().getAttribute("group")).getgNo();
		}else {
			groupNo = gNo;
			Group tempGroup = gService.goGroupPage(groupNo);
			
			Member loginUser = (Member)request.getSession().getAttribute("loginUser");
			Integer groupMemberCode = -1;  
			if(loginUser!=null) {
			String memberId = loginUser.getMemberId();
			
			
			if(memberId != null) {
				groupMemberCode = gService.selectCode(memberId,gNo);
				if(groupMemberCode ==null) {
					groupMemberCode = 5;
					
				}
			}
			request.getSession().setAttribute("group",tempGroup );
			request.getSession().setAttribute("gName", tempGroup.getgName());
			request.getSession().setAttribute("groupMemberCode", groupMemberCode);
			}
		
		}
		
		
		/*
		 * int groupNo = ((Group)request.getSession().getAttribute("group")).getgNo();
		 */
		
		ArrayList<GroupMember> list = gService.waitingGroupMemberList(groupNo);
		
		if (list != null) {
			mv.addObject("list", list).setViewName("group/groupMemberWaiting");
			
		} else {
			mv.addObject("msg", "대기중인 회원 목록 조회 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}

	
	
	// 회원 등급 수정
	@RequestMapping("memlevel.ij")
	public String memLevelUpdate(HttpServletRequest request, Model model, GroupMember gMember) {
		
		int result = gService.updateLevel(request, gMember);
		
		String path = null;
		if(result > 0) {
			
			path = "group/groupMember";
		}else {
			model.addAttribute("msg", "회원 등급 수정 실패");
			path= "common/errorPage";
		}
		
		return path;
	}
	
	
	//회원 수락 
	@RequestMapping("acceptGroup.ij")
	public String accpetGroup(HttpServletRequest request,Member member,Model model) {
		String memberId = member.getMemberId();
		int gNo = ((Group)request.getSession().getAttribute("group")).getgNo();
		int result = gService.acceptGroup(memberId,gNo);
		String path = null;
		if(result>0) {
			int result2 = gService.updateGroupCount(gNo);
			
			path = "redirect:wgmlist.ij"; 
		}else {
			model.addAttribute("msg", "가입 신청 수락 중 에러발생");
			path= "common/errorPage";
		}
		return path;
	}
	
	//모임신청 거절
	@RequestMapping("rejectGroup.ij")
	public String rejectGroup(HttpServletRequest request,Member member,Model model) {
		String memberId = member.getMemberId();
		int gNo = ((Group)request.getSession().getAttribute("group")).getgNo();
		int result = gService.rejectGroup(memberId,gNo);
		String path = null;
		if(result>0) {
			path = "redirect:wgmlist.ij"; 
		}else {
			model.addAttribute("msg", "가입 신청 거절 중 에러발생");
			path= "common/errorPage";
		}
		return path;
	}
	
	
	//모임탈퇴하기
	@ResponseBody
	@RequestMapping(value="withdraw.ij", method=RequestMethod.POST)
	public String withdraw(String loginUserId, String gNo, HttpServletRequest request) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("loginUserId",loginUserId);
		map.put("gNo",gNo);
		System.out.println("loginUserId : " + loginUserId);
		System.out.println("gNo : " + gNo);
		int result = gService.withdraw(map);
		
		int groupNo = Integer.parseInt(gNo);
		String memberId= loginUserId;
		Group tempGroup = gService.goGroupPage(groupNo);
		String result2 = null;
		if(result>0) {
			
			int groupMemberCode = gService.selectCode(memberId,groupNo);
			request.getSession().setAttribute("group", tempGroup);
			request.getSession().setAttribute("gName", tempGroup.getgName());
			request.getSession().setAttribute("groupMemberCode", groupMemberCode);
			
			int result3 = gService.decreaseCount(gNo); 
			
			result2 = "success";
		}
		return result2;
	}

}
