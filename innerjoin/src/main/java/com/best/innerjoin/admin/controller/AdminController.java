
package com.best.innerjoin.admin.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.best.innerjoin.admin.model.service.AdminService;
import com.best.innerjoin.admin.model.vo.Pagination;
import com.best.innerjoin.group.model.service.GroupService;
import com.best.innerjoin.group.model.vo.Group;
import com.best.innerjoin.group.model.vo.GroupCat;
import com.best.innerjoin.group.model.vo.GroupMember;
import com.best.innerjoin.member.model.vo.Member;
import com.best.innerjoin.report.model.vo.GroupMemberReport;
import com.best.innerjoin.report.model.vo.GroupReport;
import com.best.innerjoin.report.model.vo.MemberReport;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonParser;


@Controller
public class AdminController {
	
	@Autowired
	private AdminService adService;
	@Autowired
	private GroupService gService;

	
	//임시 관리자 페이지로 이동
	@RequestMapping("admin.ij")
	public String adminView(HttpSession session) {
		
		System.out.println((Member)session.getAttribute("loginUser"));
		
		if(session.getAttribute("loginUser") != null && ((Member)session.getAttribute("loginUser")).getMemberStatusCode() == 0) {
			
			return "redirect:manageMember.ij";
		}else {
			return "redirect:gohome.ij";
		}
		
	}  

	/** 회원관리페이지 이동
	 * @return
	 */
	@RequestMapping("manageMember.ij")
	public ModelAndView manageMemberView(HttpSession session,Integer page, ModelAndView mv) {
		int currentPage = (page == null) ? 1 : page;
		
		if(session.getAttribute("loginUser") != null && ((Member)session.getAttribute("loginUser")).getMemberStatusCode() == 0) {
			
			//회원 정보 리스트 가져오기
			ArrayList<Member> mList = adService.selectMemList(currentPage);
			mv.addObject("mList", mList).addObject("pi", Pagination.getPageInfo()).setViewName("admin/manageMember");
		}else {
			mv.setViewName("redirect:gohome.ij");
		}
		
		
		return mv;
	}
	
	/** 회원 상세페이지로 이동
	 * @param page
	 * @param memberId
	 * @param mv
	 * @return mv
	 */
	@RequestMapping("memDetail.ij")
	public ModelAndView memDetailView(HttpSession session,Integer page, String memberId, ModelAndView mv) {
		// 멤버 상세정보 조회
		Member member = adService.selectMemDetail(memberId);
		
		// 멤버 개설, 가입 모임 정보 조회
		Map<String, Map> mgInfo = adService.memGroupInfo(memberId);
		// 신고 내역 조회
		ArrayList<MemberReport> mrList = adService.selectMrList(memberId);
		
		if(session.getAttribute("loginUser") != null && ((Member)session.getAttribute("loginUser")).getMemberStatusCode() == 0) {
		
		mv.addObject("member", member).addObject("mgInfo", mgInfo)
			.addObject("mrList", mrList).setViewName("admin/memberDetail");
		}else {
			mv.setViewName("redirect:gohome.ij");
		}
		return mv;
	}
	
	/** 모임관리페이지 이동
	 * @return
	 */
	@RequestMapping("manageGroup.ij")
	public ModelAndView manageGroupView(HttpSession session, ModelAndView mv, Integer page) {
		int currentPage = (page == null) ? 1 : page;
		
		//그룹 리스트 가져오기
		ArrayList<Group> gList = adService.selectGroupList(currentPage);
		
		if(session.getAttribute("loginUser") != null && ((Member)session.getAttribute("loginUser")).getMemberStatusCode() == 0) {
		mv.addObject("gList", gList).addObject("pi", Pagination.getPageInfo()).setViewName("admin/manageGroup");
		
		}else {
			mv.setViewName("redirect:gohome.ij");
		}
		
		return mv;
	}
	
	/** 회원신고관리페이지 이동
	 * @return
	 */
	@RequestMapping("memberReport.ij")
	public ModelAndView memberReportView(ModelAndView mv, Integer page) {
		int currentPage = (page == null) ? 1 : page;

		
		ArrayList<MemberReport> mrList = adService.selectAllMrList(currentPage);
		System.out.println("mrList: " + mrList);
		
		mv.addObject("mrList", mrList).addObject("pi", Pagination.getPageInfo()).setViewName("admin/memberReport");
		return mv;
	}
		/** 그룹회원신고관리페이지 이동
	 * @return
	 */
	@RequestMapping("groupMemberReport.ij")
	public ModelAndView groupMemberReportView(HttpSession session,ModelAndView mv, Integer page) {
		int currentPage = (page == null) ? 1 : page;
		
		//그룹 신고 리스트 가져오기
		ArrayList<GroupMemberReport> gmrList = adService.selectGroupMemReptList(currentPage);
		if(session.getAttribute("loginUser") != null && ((Member)session.getAttribute("loginUser")).getMemberStatusCode() == 0) {
			mv.addObject("gmrList", gmrList).addObject("pi", Pagination.getPageInfo()).setViewName("admin/groupMemberReport");
		}else {
			mv.setViewName("redirect:gohome.ij");
		}
		return mv;
	}
	/** 그룹신고관리페이지 이동
	 * @return
	 */
	@RequestMapping("groupReport.ij")
	public ModelAndView groupReportView(HttpSession session, ModelAndView mv, Integer page) {
		int currentPage = (page == null) ? 1 : page;
		
		//그룹 신고 리스트 가져오기
		ArrayList<GroupReport> rList = adService.selectGroupReptList(currentPage);
		
		if(session.getAttribute("loginUser") != null && ((Member)session.getAttribute("loginUser")).getMemberStatusCode() == 0) {
			mv.addObject("rList", rList).addObject("pi", Pagination.getPageInfo()).setViewName("admin/groupReport");
		}else {
			mv.setViewName("redirect:gohome.ij");
		}
		return mv;
	}

	/** 카테고리관리페이지 이동
	 * @return
	 */
	@RequestMapping("manageCategory.ij")
	public String manageCategoryView() {
		return "admin/manageCategory";
	}
	
	/** (신고처리) 회원 등급 조정
	 * @param memberId
	 * @param statusCode
	 * @return
	 */
	@RequestMapping("setMemStatus.ij")
	public String setMemberStatus(String memberId, int statusCode) {
		int result = adService.setMemberStatus(memberId, statusCode);
		return "redirect:memDetail.ij?memberId=" + memberId;
	}
	
	@RequestMapping("processReport.ij")
	public String processReport(String reptNoList, String memberId) {
		int result = adService.processReport(reptNoList);
		return "redirect:memDetail.ij?memberId=" + memberId;
	}

	
	//============================================================================
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	/** 그룹 상세페이지로 이동
	 * @param page
	 * @param memberId
	 * @param mv
	 * @return mv
	 */
	@RequestMapping("groupDetail.ij")
	public ModelAndView groupDetailView(HttpSession session, Integer groupReptNo,int gNo, ModelAndView mv) {
		
		Group group = adService.selectGroupDetail(gNo);
		ArrayList<GroupMember> mList = gService.groupMemberList(gNo);
		
		if(session.getAttribute("loginUser") != null && ((Member)session.getAttribute("loginUser")).getMemberStatusCode() == 0) {
		mv.addObject("group", group).addObject("groupReptNo", groupReptNo).addObject("mList", mList).setViewName("admin/groupDetail");
		}else {
			mv.setViewName("redirect:gohome.ij");
		}
		return mv;
	}
	
	
	@ResponseBody
	@RequestMapping("updateGroupStatus.ij")
	public int updateGroupStatus(Integer groupReptNo, Group group, ModelAndView mv) {
		
		
		int result = adService.updateGroupStatus(groupReptNo,group);
		if(result > 0) {
			return result;
		}{
			return result;
		}
		
	}
	
  
  	
	// 그룹회원 등급 조회
	@ResponseBody
	@RequestMapping("adGroupMemSelectCode.ij")
	public Integer groupMemSelectCode(Integer groupNo, String memberId) {
		Integer groupMemberCode = gService.selectCode(memberId,groupNo);
		
		return groupMemberCode;
	}
	
	// 그룹회원 등급 변경
	@ResponseBody
	@RequestMapping("updateGroupMemLevel.ij")
	public String updateGroupMemLevel(String levelCode,String str,ModelAndView mv) {
		
		int level = Integer.parseInt(levelCode);
		System.out.println(str);
		System.out.println(level);
		
		
		JsonArray arr =  (JsonArray)(new JsonParser().parse(str));
		
		//JsonObject obj = (JsonObject)(new JsonParser().parse(str));
		
	    List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
	      
		
		/*
		 * ArrayList<GroupMember> gList = new ArrayList<GroupMember>(reptList); int
		 * result = adService.updateGroupMemLevel(level,gList);
		 * System.out.println("gMember : "+reptList);
		 * System.out.println("gMember사이즈 : "+reptList.size()); if(result ==
		 * reptList.size()) { return "success"; }else{ return "fail"; }
		 */	
		return "success";
	}
	

	
	@ResponseBody
	@RequestMapping(value="loadCat.ij",produces="text/plain;charset=UTF-8")
	public String loadCategory() {
		
		ArrayList<GroupCat> catList = gService.selectGroupCat();
		
		
		return new Gson().toJson(catList);
		
	}
}
