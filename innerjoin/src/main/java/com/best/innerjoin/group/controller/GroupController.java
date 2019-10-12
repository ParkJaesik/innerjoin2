package com.best.innerjoin.group.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.best.innerjoin.alarm.model.service.AlarmService;
import com.best.innerjoin.event.model.service.EventService;
import com.best.innerjoin.event.model.vo.Event;
import com.best.innerjoin.group.model.service.GroupService;
import com.best.innerjoin.group.model.vo.Group;
import com.best.innerjoin.group.model.vo.GroupMember;
import com.best.innerjoin.member.model.vo.Member;


@Controller
public class GroupController {
	
	@Autowired
	private GroupService gService;
	private AlarmService aService;
	@Autowired
	private EventService eSerivce;
	
	
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
		
		int result = gService.insertGroup(group);

		
		String path= null;
		if(result>0) {
			
			//모임 생성 성공시 group-member테이블에 관리자로 행추가 
			int result2 = gService.insertGroupMemberAdmin(loginUser);
			
			path="group/groupIndex";
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
	
	


	@RequestMapping("tempGoGroup.ij")
	public String tempGoGroup(HttpServletRequest request) {
		 request.getSession().setAttribute("groupName", "가나다");
		return "group/groupIndex";
	}
	
	@RequestMapping("tempGoGroup2.ij")
	public String tempGoGroup2(HttpServletRequest request) {
		 request.getSession().setAttribute("groupName", "라라라라");
		return "group/groupIndex";
	}
	
	
//	클릭한 그룹 페이지로 이동하는 메소드
	@RequestMapping("goGroupPage.ij")
	public String goGroupPage(HttpServletRequest request,Group group,Model model) {
		
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
		
		ArrayList<Event> eList = eSerivce.groupEventList(time1, ""+gNo);
		
		ArrayList<Event> eList2 = null;
		
		// 이벤트 리스트 최신 3개 자르기
		if(!eList.isEmpty()) {
			eList2 = new ArrayList<Event>();
			for(int i = 0; i < 3;i++) {
				eList2.add(eList.get(i));
			}
		}
		
		System.out.println(groupMemberCode);
		
		
		model.addAttribute("event", eList2);
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
		String host = ((Group)request.getSession().getAttribute("group")).getgHost();
		
		int result = gService.applyInsertGroup(memberId,gNo);
		int result2 = 0;
		
		if(result>0) {
			
			result2 = gService.insertAlarm(memberId,host);
			
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
	public ModelAndView waitingGroupMemberList(ModelAndView mv, HttpServletRequest request) {
		int groupNo = ((Group)request.getSession().getAttribute("group")).getgNo();
		
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

}
