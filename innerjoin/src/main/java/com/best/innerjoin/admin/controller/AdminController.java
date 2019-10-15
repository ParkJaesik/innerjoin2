
package com.best.innerjoin.admin.controller;

import java.util.ArrayList;
import java.util.Map;

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


@Controller
public class AdminController {
	
	@Autowired
	private AdminService adService;
	@Autowired
	private GroupService gService;

	
	//임시 관리자 페이지로 이동
	@RequestMapping("admin.ij")
	public String adminView() {
		return "admin/admin";
	}  

	/** 회원관리페이지 이동
	 * @return
	 */
	@RequestMapping("manageMember.ij")
	public ModelAndView manageMemberView(Integer page, ModelAndView mv) {
		int currentPage = (page == null) ? 1 : page;
		
		//회원 정보 리스트 가져오기
		ArrayList<Member> mList = adService.selectMemList(currentPage);
		mv.addObject("mList", mList).addObject("pi", Pagination.getPageInfo()).setViewName("admin/manageMember");
		return mv;
	}
	
	/** 회원 상세페이지로 이동
	 * @param page
	 * @param memberId
	 * @param mv
	 * @return mv
	 */
	@RequestMapping("memDetail.ij")
	public ModelAndView memDetailView(Integer page, String memberId, ModelAndView mv) {
		// 멤버 상세정보 조회
		Member member = adService.selectMemDetail(memberId);
		
		// 멤버 개설, 가입 모임 정보 조회
		Map<String, Map> mgInfo = adService.memGroupInfo(memberId);
		System.out.println("mgInfo" + mgInfo);
		// 신고 내역 조회
		ArrayList<MemberReport> mrList = adService.selectMrList(memberId);
		System.out.println("mrList: " + mrList);
		
		mv.addObject("member", member).addObject("mgInfo", mgInfo)
			.addObject("mrList", mrList).setViewName("admin/memberDetail");
		
		return mv;
	}
	
	/** 모임관리페이지 이동
	 * @return
	 */
	@RequestMapping("manageGroup.ij")
	public ModelAndView manageGroupView(ModelAndView mv, Integer page) {
		int currentPage = (page == null) ? 1 : page;
		
		//그룹 리스트 가져오기
		ArrayList<Group> gList = adService.selectGroupList(currentPage);
		mv.addObject("gList", gList).addObject("pi", Pagination.getPageInfo()).setViewName("admin/manageGroup");
		return mv;
	}
	
	/** 회원신고관리페이지 이동
	 * @return
	 */
	@RequestMapping("memberReport.ij")
	public String memberReportView() {
		return "admin/memberReport";
	}
		/** 그룹회원신고관리페이지 이동
	 * @return
	 */
	@RequestMapping("groupMemberReport.ij")
	public ModelAndView groupMemberReportView(ModelAndView mv, Integer page) {
		int currentPage = (page == null) ? 1 : page;
		
		//그룹 신고 리스트 가져오기
		ArrayList<GroupMemberReport> gmrList = adService.selectGroupMemReptList(currentPage);
		
		mv.addObject("gmrList", gmrList).addObject("pi", Pagination.getPageInfo()).setViewName("admin/groupMemberReport");
		
		return mv;
	}
	/** 그룹신고관리페이지 이동
	 * @return
	 */
	@RequestMapping("groupReport.ij")
	public ModelAndView groupReportView(ModelAndView mv, Integer page) {
		int currentPage = (page == null) ? 1 : page;
		
		//그룹 신고 리스트 가져오기
		ArrayList<GroupReport> rList = adService.selectGroupReptList(currentPage);
		mv.addObject("rList", rList).addObject("pi", Pagination.getPageInfo()).setViewName("admin/groupReport");
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
	public ModelAndView groupDetailView(Integer groupReptNo,int gNo, ModelAndView mv) {
		
		Group group = adService.selectGroupDetail(gNo);
		System.out.println(group);
		ArrayList<GroupMember> mList = gService.groupMemberList(gNo);
		System.out.println("mList.size() : "+ mList.size());
		mv.addObject("group", group).addObject("groupReptNo", groupReptNo).addObject("mList", mList).setViewName("admin/groupDetail");
		
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
	
	@ResponseBody
	@RequestMapping("updateGroupMemLevel.ij")
	public String updateGroupMemLevel(GroupMember gMember, ModelAndView mv) {
		
		
		int result = adService.updateGroupMemLevel(gMember);
		if(result > 0) {
			return "success";
		}else{
			return "fail";
		}
		
	}
	

  
	
	@ResponseBody
	@RequestMapping(value="loadCat.ij",produces="text/plain;charset=UTF-8")
	public String loadCategory() {
		
		ArrayList<GroupCat> catList = gService.selectGroupCat();
		
		
		return new Gson().toJson(catList);
		
	}
}
