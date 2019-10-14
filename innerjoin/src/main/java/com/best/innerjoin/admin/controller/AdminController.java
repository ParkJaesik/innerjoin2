package com.best.innerjoin.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.best.innerjoin.admin.model.service.AdminService;
import com.best.innerjoin.admin.model.vo.Pagination;
import com.best.innerjoin.member.model.vo.Member;
import com.best.innerjoin.report.model.vo.GroupReport;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adService;
	
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
		Member member = adService.selectMemDetail(memberId);
		System.out.println(member);
		mv.addObject("member", member).setViewName("admin/memberDetail");
		
		return mv;
	}
	
	/** 모임관리페이지 이동
	 * @return
	 */
	@RequestMapping("manageGroup.ij")
	public String manageGroupView() {
		return "admin/manageGroup";
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
	public String groupMemberReportView() {
		return "admin/groupMemberReport";
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

	
	//============================================================================
	
	

}
